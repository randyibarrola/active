<?php

function insertReserva($idHotel, $data = array(), $data_apartamento = array(), 
        $data_excursiones = array(), $data_usuario = array(), 
        $data_tarjeta = array(), $total = 0) {
    try {
        
        $transaction = new Transaction();
        
        $email = $data_usuario['email'];
        
        $usuario = getUsuarioByEmail($email);
        
        if($usuario && count($usuario)) {
            $usuario_id = $usuario[0]->id;
            $usuario = DAOFactory::getUsuarioDAO()->prepare($data_usuario, $usuario_id);
            DAOFactory::getUsuarioDAO()->update($usuario);
            
        } else {
        
            $data_usuario['tiempoCreacion'] = date('Y-m-d');
            $data_usuario['estatus'] = 'Activo';
            $data_usuario['usuarioGrupoId'] = 4;
            $usuario = DAOFactory::getUsuarioDAO()->prepare($data_usuario);

            $usuario_id = DAOFactory::getUsuarioDAO()->insert($usuario);
        }
        
        $hotel = DAOFactory::getHotelDAO()->load($idHotel);
        
        $data_reserva = array(
            'hotelId' => $idHotel,
            'usuarioId' => $usuario_id,
            'tiempoCreacion' => date('Y-m-d'),
            'total' => $total,
            'peticionesEspeciales' => $data['peticionesEspeciales'],
            'urlOrigen' => $data['urlOrigen'],
            'monedaId' => $data['monedaId'],
            'estado' => ($hotel->bookingOnrequest)?'Pendiente':'Aprobada',
            'recibirFactura' => $data['recibirFactura'],
            'idiomaId' => $data['idiomaId'],
            'cartId' => $data['cartId'],
            'adultos' => $data['adultos'],
            'ninios' => $data['ninios'],
            'tipoCobro' => $hotel->tipoReserva
        );
        
        if($data_tarjeta['op'] && strlen(trim($data_tarjeta['op']))) {
            $data_reserva['estado'] = 'Confirmada';
        }
        
        $stop_sales = DAOFactory::getHotelFechasDAO()->queryInFechas($data_apartamento['inicio'], $data_apartamento['final'],$idHotel);
        if(count($stop_sales)) {
            $data_reserva['estado'] = 'Pendiente';
        }
        
        $reserva = DAOFactory::getReservaDAO()->prepare($data_reserva);
        
        $reserva_id = DAOFactory::getReservaDAO()->insert($reserva);
        
        $localizador = strtoupper(generarLocalizador(5));
        
        $reserva = DAOFactory::getReservaDAO()->prepare(array('localizador'=>$localizador), $reserva_id);
        DAOFactory::getReservaDAO()->update($reserva);
        
        $data_apartamento['reservaId'] = $reserva_id;
        
        $apartamento = DAOFactory::getReservaProductoDAO()->prepare($data_apartamento);
        $apartamento_id = DAOFactory::getReservaProductoDAO()->insert($apartamento);
        
        foreach ($data_excursiones as $data_excursion) {
            $data_excursion['reservaId'] = $reserva_id;
            if($data_excursion['eventoTpv'] && !is_string($data_excursion['eventoTpv'])) {
                $data_excursion['eventoTpv'] = json_encode($data_excursion['eventoTpv']);
            }
            $excursion = DAOFactory::getReservaProductoDAO()->prepare($data_excursion);
        
            $excursion_id = DAOFactory::getReservaProductoDAO()->insert($excursion);
        }
        
        $clave = getClaveByHotel($idHotel);
        
        $data_tarjeta['reservaId'] = $reserva_id;
        if($data_tarjeta['tarjetaNumero'] && strlen(trim($data_tarjeta['tarjetaNumero'])))
            $data_tarjeta['tarjetaNumero'] = Encrypter::encrypt($data_tarjeta['tarjetaNumero'], $clave);
        if($data_tarjeta['cvv'] && strlen(trim($data_tarjeta['cvv'])))
            $data_tarjeta['cvv'] = Encrypter::encrypt($data_tarjeta['cvv'], $clave);
        if($data_tarjeta['importe'] || $hotel->tipoReserva != 'offline') {
            $importe = $data_tarjeta['importe'];
            require 'Logic/afiliado.php';
            insertReservaAfiliado($reserva_id, $importe);
            $pago = DAOFactory::getReservaPagoDAO()->prepare($data_tarjeta);
            $pago_id = DAOFactory::getReservaPagoDAO()->insert($pago);
        }

        $transaction->commit();
        
            return $reserva_id;
    } catch (Exception $e) {
        var_dump($e);
        $transaction->rollback();
        return false;
    }
}

function getReserva($idReserva, $withCardData = false) {
    try {
        
        $reserva = DAOFactory::getReservaDAO()->load($idReserva);
        
        if(!$reserva) return false;
        
        $reserva->productos = DAOFactory::getReservaProductoDAO()->queryByReservaId($idReserva);
        
        $reserva->usuario = getUsuario($reserva->usuarioId);
        
        if($reserva->usuario->paisId)
            $reserva->usuario->pais = getPais($reserva->usuario->paisId);
        
        $hotel = getHotelById($reserva->hotelId);
        $reserva->hotel = $hotel;
        
        $reserva->pagos = DAOFactory::getReservaPagoDAO()->queryByReservaId($idReserva);
        if($reserva->pagos){
            $clave = getClaveByHotel($reserva->hotelId);
            foreach ($reserva->pagos as $pago) {
                if($pago->formaPago == 'tarjeta') {
                    if(!$withCardData) {
                        $pago->tarjetaNumero = false;
                        $reserva->cardData = true;
                    } else if($pago->tarjetaNumero && strlen(trim($pago->tarjetaNumero)))
                        $pago->tarjetaNumero = Encrypter::decrypt($pago->tarjetaNumero, $clave);

                    if(!$withCardData)
                        $pago->cvv = false;
                    else if($pago->cvv && strlen(trim($pago->cvv)))
                        $pago->cvv = Encrypter::decrypt($pago->cvv, $clave);
                }
            }
        }
        
        $reserva->alojamiento = array();
        $reserva->extras = array();
        foreach ($reserva->productos as $kp=>$p) {
            if(strcmp($p->tipo, 'apartamento') == 0){
                $p->noches = ceil((strtotime($p->final) - strtotime($p->inicio))/(24*60*60));
                if(strpos($p->nombre, '(')) {
                    $n = explode('(', $p->nombre);
                    $pax = trim($n[count($n) - 1]);
                    $reserva->productos[$kp]->pax = substr($pax, 0, strlen($pax) - 1);
                }
                $p->comision = ($p->precioUnitario * $hotel->distribuidor->porcentajeBeneficio / 100);
                array_push ($reserva->alojamiento, $p);
            }else {
                if($p->eventoTpv && strlen($p->eventoTpv)){
                    $p->eventoTpv = json_decode($p->eventoTpv);                    
                }
                if($p->entradas) {
                    $p->entradasList = json_decode($p->entradas);
                    $cant = 0;
                    if($p && $p->entradasList){
                        foreach ($p->entradasList as $entrada) {
                            $cant += $entrada->entradas;
                        }
                    }
                    $p->tickets = $cant;
                }
                array_push ($reserva->extras, $p);
            }
        }
        
        if($reserva->monedaId) {
            $reserva->moneda = DAOFactory::getMonedaDAO()->load($reserva->monedaId);
        }
        
        if($reserva->idiomaId) {
            $reserva->idioma = DAOFactory::getIdiomaDAO()->load($reserva->idiomaId);
        }
        
        if($reserva->cartId) {
            $reserva->cart = DAOFactory::getShoppingCartDAO()->load($reserva->cartId);
            $reserva->cart->apto = json_decode($reserva->cart->apartamento);
        }
        
        return $reserva;
        
    } catch(Exception $e) {
        return false;
    }
}

function getAllReservas() {
    try {
        
        $reservas = DAOFactory::getReservaDAO()->queryAll();
        
        foreach ($reservas as $reserva) {
            $reserva->usuario = DAOFactory::getUsuarioDAO()->load($reserva->usuarioId);
            $reserva->productos = DAOFactory::getReservaProductoDAO()->queryByReservaId($reserva->id);            
        }
        
        return $reservas;
        
    } catch(Exception $e) {
        return false;
    }
}

function getReservasByHotelId($idHotel) {
    try {
        
        $reservas = DAOFactory::getReservaDAO()->queryByHotelId($idHotel);
        $hotel = DAOFactory::getHotelDAO()->load($idHotel);
        foreach ($reservas as $reserva) {
            $reserva->usuario = DAOFactory::getUsuarioDAO()->load($reserva->usuarioId);
            $reserva->productos = DAOFactory::getReservaProductoDAO()->queryByReservaId($reserva->id);
            $reserva->hotel = $hotel;
            $reserva->alojamiento = array();
            $reserva->extras = array();
            foreach ($reserva->productos as $p) {
                if(strcmp($p->tipo, 'apartamento') == 0)
                    array_push ($reserva->alojamiento, $p);
                else
                    array_push ($reserva->extras, $p);
            }
        }
        
        return $reservas;
        
    } catch(Exception $e) {
        return false;
    }
}

function updateReservaProducto($producto) {
    try {
        
        $transaction = new Transaction(); 
        $reserva_id = DAOFactory::getReservaProductoDAO()->update($producto);
        var_dump($reserva_id);

    } catch (Exception $e) {
        var_dump($e);
        $transaction->rollback();
        return false;
    }  
}
function updateReserva($idReserva, $data_reserva = array(), $data_pagos = array()) {
    try {
        
        $transaction = new Transaction();      
        
        
        $data_reserva['ultimaModificacion'] = date('Y-m-d');
        /*foreach ($data_pagos as $data_pago) {
            if($data_pago['op'] && strlen(trim($data_pago['op']))) {
                $data_reserva['estado'] = 'Confirmada';
            }
        }*/
        
        $reserva = DAOFactory::getReservaDAO()->prepare($data_reserva, $idReserva);
        
        $reserva_id = DAOFactory::getReservaDAO()->update($reserva);
        
        //$pagos_old = DAOFactory::getReservaPagoDAO()->queryByReservaId($idReserva);
        
        //$pagos_eliminar = array();
        
        /*foreach ($pagos_old as $k=>$pago) {
            $pagos_eliminar[$pago->id] = $pago->id;
        }*/
        
        foreach ($data_pagos as $data_pago) {
            
            if(isset($data_pago['idPago'])) {
                $idPago = $data_pago['idPago'];
                //unset($pagos_eliminar[$idPago]);
                $data_pago['ultimaModificacion'] = date("Y-m-d");
                $pago = DAOFactory::getReservaPagoDAO()->prepare($data_pago, $idPago);
                DAOFactory::getReservaPagoDAO()->update($pago);
            } else {
                $data_pago['reservaId'] = $idReserva;
                $data_pago['tiempoCreacion'] = date("Y-m-d");
                $pago = DAOFactory::getReservaPagoDAO()->prepare($data_pago);
                $pago_id = DAOFactory::getReservaPagoDAO()->insert($pago);
            }
            
        }
        /*
        foreach ($pagos_eliminar as $idPago) {
            DAOFactory::getReservaPagoDAO()->delete($idPago);
        }*/
        
        $transaction->commit();
        
            return $idReserva;
    } catch (Exception $e) {
        var_dump($e);
        $transaction->rollback();
        return false;
    }
}

function deleteReserva($idReserva, $inTransaction = true) {
    try {
        if($inTransaction)
        $transaction = new Transaction();      
        
        DAOFactory::getReservaProductoDAO()->deleteByReservaId($idReserva);
        
        DAOFactory::getReservaPagoDAO()->deleteByReservaId($idReserva);
        
        $facturas = DAOFactory::getFacturaReservaDAO()->queryByReservaId($idReserva);

        if($facturas){
            foreach ($facturas as $factura_reserva) {
                DAOFactory::getFacturaReservaDAO()->delete($factura_reserva->id);
                DAOFactory::getFacturaDAO()->delete($factura_reserva->facturaId);
            }
        }

        DAOFactory::getReservaDAO()->delete($idReserva);
        
        if($inTransaction)
        $transaction->commit();
        
            return $idReserva;
    } catch (Exception $e) {
        var_dump($e);
        if($inTransaction)
        $transaction->rollback();
        return false;
    }
}

function deleteReservasByHotelId($idHotel) {
    try {
        
        $reservas = DAOFactory::getReservaDAO()->queryByHotelId($idHotel);
        
        foreach ($reservas as $r) {
            deleteReserva($r->id, false);
        }
                
    } catch (Exception $e) {
        print_r($e);
        
        return false;
    }
}

function deleteReservasByUsuarioId($idUsuario) {
    try {
        
        $reservas = DAOFactory::getReservaDAO()->queryByUsuarioId($idUsuario);
        
        foreach ($reservas as $r) {
            $d = deleteReserva($r->id, false);
            if(!$d) throw new Exception('No se pudo borrar la reserva ' . $r->id);
        }
        return true;
                
    } catch (Exception $e) {
        print_r($e);
        
        return false;
    }
}

function cambiarEstadoReserva($id, $estado, $motivoCancelacion = false) {
    try {
        $data = array('estado'=>$estado, 'ultimaModificacion'=>date('Y-m-d'));
        if($motivoCancelacion) {
            $data['motivoCancelacion'] = $motivoCancelacion;
        }
        $reserva = DAOFactory::getReservaDAO()->prepare($data, $id);
        DAOFactory::getReservaDAO()->update($reserva);
        return true;
        
    } catch(Exception $e) {
        return false;
    }
}

function verificarClaveHotel($idHotel, $clave) {
    try {
        
        $hotel = DAOFactory::getHotelDAO()->load($idHotel);
        
        if(!$hotel->clave || !strlen($hotel->clave)) {
            return false;
        }
        
        $testClave = Encrypter::encrypt($clave, $idHotel);
        
        //echo Encrypter::decrypt($hotel->clave, $idHotel);
        
        if(strcasecmp($hotel->clave, $testClave) == 0)
            return true;
        
        return false;
        
    } catch(Exception $e) {
        return false;
    }
}

function encryptId($id) {
    return dechex(9999 * $id);
}

function decryptId($id) {
    return hexdec($id) / 9999;
}

function reservationUrl($hotelId, $apartamento = array(), $excursiones = array(), $vikahotel_url) {
    try {        
        
        $form_url = $vikahotel_url . '/reservationForm/hid:' . $hotelId;
        
        
    } catch (Exception $e) {
        print_r($e);
        return false;
    }
}

function getReservasByUsuarioEmail($email) {
    try {
        
        $reservas = DAOFactory::getReservaDAO()->queryByUsuarioEmail($email);
        
        $reservasArray = array();
        
        foreach ($reservas as $r) {
            $reservasArray[] = getReserva($r->id);
        }
        
        return $reservasArray;
        
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

function generarFactura($reserva, $hotel, $negativo = false) {
    try {
        
        global $template_dir;
        global $template_url;
        global $app_dir;
        global $smarty;
        
        $campania = getCampania($hotel->campaniaId);
        $reserva->id = decryptId($reserva->id);
        
        if($negativo){
            $factura = getFacturaByIdReserva($reserva->id);
            
            if($factura){
                $negativo = $factura->id;
                $numeroFactura = 'R-'.$factura->numero;
            }else{
                return false;
            }
        }else{
            $count = DAOFactory::getFacturaDAO()->countByYear(intval(date('Y')), $campania->localizador);
            $count = '' . $count[0][0];
            $count ++;
            while(strlen($count) < 4) $count = ('0' . $count);
            $numeroFactura = $count . '-' . $campania->localizador . '-' . date('Y');
        }

        insertFactura($hotel->id, array($reserva->id), "cobrado", $negativo);
        
        $smarty->assign('numero', $numeroFactura);
        $smarty->assign('reserva', $reserva);
        $smarty->assign('hotel', $hotel);
        $smarty->assign('negativo', $negativo);
        
        $content = $smarty->fetch('reserva_factura.tpl');
        $filename = $app_dir . '/cache/factura_' . time() . '.pdf';
        Html2PdfWriter::write($content, $filename);
        
        return $filename;
    } catch(Exception $e) {
        print_r($e);
        return false;
    }
}

function getReservasPendientesAprobacion($usuarioId, $args = array()) {
    try {
        $usuario = DAOFactory::getUsuarioDAO()->load($usuarioId);
        if($usuario->usuarioGrupoId == 1)
            $reservas = DAOFactory::getReservaDAO()->queryByEstado('Pendiente', $args);
        else
            $reservas = DAOFactory::getReservaDAO()->queryByUsuarioAprobar($usuarioId, $args);
        
        $hotel = false;
        foreach ($reservas as $reserva) {
            $reserva->usuario = DAOFactory::getUsuarioDAO()->load($reserva->usuarioId);
            $reserva->moneda = DAOFactory::getMonedaDAO()->load($reserva->monedaId);
            $reserva->productos = DAOFactory::getReservaProductoDAO()->queryByReservaId($reserva->id);
            if(!$hotel || $hotel->id != $reserva->hotelId)
                $hotel = DAOFactory::getHotelDAO()->load($reserva->hotelId);
            $reserva->hotel = $hotel;
            $reserva->alojamiento = array();
            $reserva->extras = array();
            foreach ($reserva->productos as $p) {
                if(strcmp($p->tipo, 'apartamento') == 0)
                    array_push ($reserva->alojamiento, $p);
                else
                    array_push ($reserva->extras, $p);
            }
        }
        
        return $reservas;
        
    } catch(Exception $e) {
        print_r($e);
        return false;
    }
}

function busquedaReservas($term, $idUsuario) {
    try {
        
        $elementos = array();
        
        $usuario = DAOFactory::getUsuarioDAO()->load($idUsuario);
        
        if($usuario->usuarioGrupoId == 1)
            $hoteles = buscarHoteles($term);   
        else //if ($usuario->usuarioGrupoId == 3)
            $hoteles = buscarHoteles($term, $usuario->id);
        
        $elementos['hoteles'] = $hoteles;
        
        if($usuario->usuarioGrupoId == 1)
            $usuarios = DAOFactory::getUsuarioDAO()->queryByTerm($term);
        else 
            $usuarios = DAOFactory::getUsuarioDAO()->queryUsuariosReservaronMisHoteles($term, $idUsuario);
        
        $elementos['usuarios'] = $usuarios;
        if($usuario->usuarioGrupoId == 1) 
            $reservas = DAOFactory::getReservaDAO()->queryByTerm($term);
        else
            $reservas = DAOFactory::getReservaDAO()->queryByTerm($term, $idUsuario);
        $elementos['reservas'] = $reservas;
        
        
        return $elementos;
        
    } catch (Exception $e) {
        print_r($e);
        return false;
    }
}

function getReservasByQuery($query, $args = array()) {
    try {
        
        if($query) {
            if(!strlen(trim($query))) return false;

            $query = explode(':', $query);

            if(count($query) != 2) return false;

            switch ($query[0]) {
             case 'hotel':
                 $reservas = DAOFactory::getReservaDAO()->queryByHotelId($query[1], $args);            
                 break;
             case 'usuario':
                 $reservas = DAOFactory::getReservaDAO()->queryByUsuarioId($query[1], $args);
                 break;
             case 'reserva':
                 $reservas = array(
                     DAOFactory::getReservaDAO()->load($query[1])
                 );
                 break;
             default:
                 break;
            }
        } else {
            global $usuario_core;
            $logged_user = $usuario_core->getUsuario();
            
            if($logged_user->usuarioGrupoId == 1) {
                $reservas = DAOFactory::getReservaDAO()->queryByArgs($args);
            } else {
                $reservas = DAOFactory::getReservaDAO()->queryByUsuarioAutenticadoId($logged_user->id, $args); 
            }
            
            
        }
        
        $hotel = false;
        foreach ($reservas as $reserva) {
            $reserva->usuario = DAOFactory::getUsuarioDAO()->load($reserva->usuarioId);
            $reserva->productos = DAOFactory::getReservaProductoDAO()->queryByReservaId($reserva->id);
            if(!$hotel || $hotel->id != $reserva->hotelId)
                $hotel = DAOFactory::getHotelDAO()->load($reserva->hotelId);
            $reserva->hotel = $hotel;
            $reserva->moneda = DAOFactory::getMonedaDAO()->load($reserva->monedaId);
            $reserva->alojamiento = array();
            $reserva->extras = array();
            foreach ($reserva->productos as $p) {
                if(strcmp($p->tipo, 'apartamento') == 0)
                    array_push ($reserva->alojamiento, $p);
                else
                    array_push ($reserva->extras, $p);
            }
        }
        
        return $reservas;
        
    } catch(Exception $e) {
        print_r($e);
        return false;
    }
}

function showReservasByQuery($query, $args = array()) {
    try {
        
        if($query) {
            if(!strlen(trim($query))) return false;

            $query = explode(':', $query);

            if(count($query) != 2) return false;

            switch ($query[0]) {
             case 'hotel':
                 $reservas = DAOFactory::getReservaDAO()->showByHotelId($query[1], $args);            
                 break;
             case 'usuario':
                 $reservas = DAOFactory::getReservaDAO()->showByUsuarioId($query[1], $args);
                 break;
             case 'reserva':
                 $reservas = DAOFactory::getReservaDAO()->showById($query[1]);
                 break;
             default:
                 break;
            }
        } else {
            global $usuario_core;
            $logged_user = $usuario_core->getUsuario();
            
            if($logged_user->usuarioGrupoId == 1) {
                $reservas = DAOFactory::getReservaDAO()->showByArgs($args);
            } else {
                $reservas = DAOFactory::getReservaDAO()->showByUsuarioAutenticadoId($logged_user->id, $args); 
            }
            
            
        }
        
        $devolver = array();
        foreach ($reservas as $reserva) {
            $data = array();
            foreach ($reserva as $k=>$val) {
                if(strpos($k, '_')) {
                    $ks = explode('_', $k);
                    $data[$ks[0]][$ks[1]] = $val;
                } else {
                    $data[$k] = $val;
                }
            }
            $devolver[] = $data;
        }
        
        return $devolver;
        
    } catch(Exception $e) {
        print_r($e);
        return false;
    }
}

function showReservasPendientesAprobacion($usuarioId, $args = array()) {
    try {
        $usuario = DAOFactory::getUsuarioDAO()->load($usuarioId);
        if($usuario->usuarioGrupoId == 1)
            $reservas = DAOFactory::getReservaDAO()->showByEstado('Pendiente', $args);
        else
            $reservas = DAOFactory::getReservaDAO()->showByUsuarioAutenticadoId($usuarioId, $args);
        
        $devolver = array();
        foreach ($reservas as $reserva) {
            $data = array();
            foreach ($reserva as $k=>$val) {
                if(strpos($k, '_')) {
                    $ks = explode('_', $k);
                    $data[$ks[0]][$ks[1]] = $val;
                } else {
                    $data[$k] = $val;
                }
            }
            $devolver[] = $data;
        }
        
        return $devolver;
        
    } catch(Exception $e) {
        print_r($e);
        return false;
    }
}

function getReservasActualesByHotel($idHotel, $moneda = false) {
    try {
        
        actualizarPaxReservas();
        
        $rows = DAOFactory::getReservaDAO()->queryByValidar($idHotel);
        $reservas = array();
        
        $hotel = getHotelById($idHotel);
        
        foreach ($rows as $row) {
            if(!$reservas[$row['reserva_id']]) {
                foreach ($row as $k=>$value) {
                    $key = explode('_', $k);
                    if(strcmp($key[0], 'reserva') == 0) {
                        $reservas[$row['reserva_id']][$key[1]] = $value;
                    } else {
                        $reservas[$row['reserva_id']][$key[0]][$key[1]] = $value;
                    }
                }
                if($moneda && $reservas[$row['reserva_id']]['moneda']['codigo'] != $moneda) {
                    
                    $precio = convertFromMonedaToMoneda($reservas[$row['reserva_id']]['producto']['precioUnitario'],
                            $reservas[$row['reserva_id']]['moneda']['codigo'], $moneda);
                    $m = getMonedaByCodigo($moneda);
                    $reservas[$row['reserva_id']]['producto']['precioUnitario'] = $precio;
                    
                    $reservas[$row['reserva_id']]['moneda']['id'] = $m->id;
                    $reservas[$row['reserva_id']]['moneda']['codigo'] = $m->codigo;
                    $reservas[$row['reserva_id']]['moneda']['nombre'] = $m->nombre;
                    $reservas[$row['reserva_id']]['moneda']['simbolo'] = $m->simbolo;
                }
                $precio = $reservas[$row['reserva_id']]['producto']['precioUnitario'];
                $comision = $precio * $hotel->distribuidor->porcentajeBeneficio / 100;
                    
                $reservas[$row['reserva_id']]['producto']['comision'] = $comision;
            }
        }
        
        return $reservas;
        
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

function getReservasValidadasByHotel($idHotel, $moneda = false) {
    try {
        
        actualizarPaxReservas();
        
        $rows = DAOFactory::getReservaDAO()->queryByValidadas($idHotel);
        $reservas = array();
        
        $hotel = getHotelById($idHotel);
        
        foreach ($rows as $row) {
            if(!$reservas[$row['reserva_id']]) {
                foreach ($row as $k=>$value) {
                    $key = explode('_', $k);
                    if(strcmp($key[0], 'reserva') == 0) {
                        $reservas[$row['reserva_id']][$key[1]] = $value;
                    } else {
                        $reservas[$row['reserva_id']][$key[0]][$key[1]] = $value;
                    }
                }
                if($moneda && $reservas[$row['reserva_id']]['moneda']['codigo'] != $moneda) {
                    
                    $precio = convertFromMonedaToMoneda($reservas[$row['reserva_id']]['producto']['precioUnitario'],
                            $reservas[$row['reserva_id']]['moneda']['codigo'], $moneda);
                    $m = getMonedaByCodigo($moneda);
                    $reservas[$row['reserva_id']]['producto']['precioUnitario'] = $precio;
                    
                    $reservas[$row['reserva_id']]['moneda']['id'] = $m->id;
                    $reservas[$row['reserva_id']]['moneda']['codigo'] = $m->codigo;
                    $reservas[$row['reserva_id']]['moneda']['nombre'] = $m->nombre;
                    $reservas[$row['reserva_id']]['moneda']['simbolo'] = $m->simbolo;
                }
                $precio = $reservas[$row['reserva_id']]['producto']['precioUnitario'];
                $comision = $precio * $hotel->distribuidor->porcentajeBeneficio / 100;
                    
                $reservas[$row['reserva_id']]['producto']['comision'] = $comision;
            }
        }
        
        return $reservas;
        
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

function actualizarPaxReservas() {
    try {
        
        $reservasPaxes = DAOFactory::getReservaDAO()->queryByEmptyPax();
        
        if(count($reservasPaxes)) {
            foreach ($reservasPaxes as $ra) {
                $apartamento = json_decode($ra['apartamento']);
                $rp = array();
                if($apartamento->adultos)
                    $rp['adultos'] = $apartamento->adultos;
                if($apartamento->ninios)
                    $rp['ninios'] = $apartamento->ninios;
                
                $r = DAOFactory::getReservaProductoDAO()->prepare($rp, $ra['id']);
                DAOFactory::getReservaProductoDAO()->update($r);
            }
        }
        
        return true;
        
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

function validarReservas($reservas, $importes) {
    try {
        $transaction = new Transaction();
        
        foreach ($importes as $rid=>$imp) {
            $status = in_array($rid, $reservas) ? 'Stayed' : 'No show';
            $reserva = DAOFactory::getReservaDAO()->prepare(array('estado'=>$status), $rid);
            DAOFactory::getReservaDAO()->update($reserva); //estado actualizado
            $moneda = getMoneda($reserva->monedaId);
            $productos = DAOFactory::getReservaProductoDAO()->queryByReservaId($rid);
            
            foreach ($productos as $p) {
                
                if($p->tipo == 'apartamento') {
                    $precio = $imp;
                    if($moneda->codigo != 'EUR')
                        $precio = convertFromMonedaToMoneda($imp, 'EUR', $moneda->codigo);
                    $producto = DAOFactory::getReservaProductoDAO()->prepare(array('precioUnitario'=>$precio), $p->id);
                    DAOFactory::getReservaProductoDAO()->update($producto);
                    
                    break;
                }
            }
        }
        
        $transaction->commit();
        return true;
        
    } catch (Exception $e) {
        print_r($e);
        if($transaction) $transaction->rollback();
        return false;
    }
}

function getReservaByLocalizador($localizador, $withCardData = false) {
    try {
        
        $reservas = DAOFactory::getReservaDAO()->queryByLocalizador($localizador);
        
        if(!$reservas || !count($reservas)) return false;
        
        $reserva = $reservas[count($reservas) - 1];
        
        $idReserva = $reserva->id;
        
        $reserva->productos = DAOFactory::getReservaProductoDAO()->queryByReservaId($idReserva);
        
        $reserva->usuario = getUsuario($reserva->usuarioId);
        
        $reserva->pagos = DAOFactory::getReservaPagoDAO()->queryByReservaId($idReserva);
        if($reserva->pagos){
            $clave = getClaveByHotel($reserva->hotelId);
            foreach ($reserva->pagos as $pago) {
                if($pago->formaPago == 'tarjeta') {
                    if(!$withCardData) {
                        $pago->tarjetaNumero = false;
                        $reserva->cardData = true;
                    } else if($pago->tarjetaNumero && strlen(trim($pago->tarjetaNumero)))
                        $pago->tarjetaNumero = Encrypter::decrypt($pago->tarjetaNumero, $clave);

                    if(!$withCardData)
                        $pago->cvv = false;
                    else if($pago->cvv && strlen(trim($pago->cvv)))
                        $pago->cvv = Encrypter::decrypt($pago->cvv, $clave);
                }
            }
        }
        
        $reserva->alojamiento = array();
        $reserva->extras = array();
        foreach ($reserva->productos as $kp=>$p) {
            if(strcmp($p->tipo, 'apartamento') == 0){
                $p->noches = ceil((strtotime($p->final) - strtotime($p->inicio))/(24*60*60));
                if(strpos($p->nombre, '(')) {
                    $n = explode('(', $p->nombre);
                    $pax = trim($n[count($n) - 1]);
                    $reserva->productos[$kp]->pax = substr($pax, 0, strlen($pax) - 1);
                }
                array_push ($reserva->alojamiento, $p);
            }else {
                if($p->eventoTpv && strlen($p->eventoTpv)){
                    $p->eventoTpv = json_decode($p->eventoTpv);                    
                }
                if($p->entradas) {
                    $p->entradasList = json_decode($p->entradas);
                    $cant = 0;
                    foreach ($p->entradasList as $entrada) {
                        $cant += $entrada->entradas;
                    }
                    $p->tickets = $cant;
                }
                array_push ($reserva->extras, $p);
            }
        }
        
        if($reserva->monedaId) {
            $reserva->moneda = DAOFactory::getMonedaDAO()->load($reserva->monedaId);
        }
        
        if($reserva->idiomaId) {
            $reserva->idioma = DAOFactory::getIdiomaDAO()->load($reserva->idiomaId);
        }
        
        if($reserva->cartId) {
            $reserva->cart = DAOFactory::getShoppingCartDAO()->load($reserva->cartId);
            $reserva->cart->apto = json_decode($reserva->cart->apartamento);
        }
        
        return $reserva;
        
    } catch(Exception $e) {
        return false;
    }
}

function getReservaUrl($idReserva) {
    try {
        
        $reserva = DAOFactory::getReservaDAO()->load($idReserva);
        global $vikahotel_url;
        $login_code = getLoginCodeByHotelId($reserva->hotelId);
        return $vikahotel_url . '/reserva?login_code=' . $login_code . '&rloc=' . $reserva->localizador;
        
    } catch ( Exception $e) {
        var_dump($e);
        return false;
    }
}

function enviarEmailFacturacion($idHotel, $idFactura) {
    try {
        
        $hotel = getHotelById($idHotel);
        global $vikahotel_url;
        global $base_url;
        $login_code = getLoginCodeByHotelId($idHotel);
        $factura_code = encryptId($idFactura); 
        $subject = "Se han validado reservas de " . $hotel->nombre;
        $body = "Para ver la factura haga click en el siguiente link o copie y pegue la dirección en su navegador:<br>";
        $body .= "<a href='$vikahotel_url/facturacion?login_code=$login_code&fcode=$factura_code'>$vikahotel_url/facturacion?login_code=$login_code&fcode=$factura_code</a>";
        
        $email = $hotel->emailReservas;
        $mail = new Core_Mailer();
        $mail->send_email($email, $subject, $body);
        
    } catch ( Exception $e) {
        var_dump($e);
        return false;
    }
}

function enviarEmailFactura($idFactura) {
    try {
        
        $factura = getFactura($idFactura);
        $hotel = getHotelById($factura->hotelId);
        global $vikahotel_url;
        global $base_url;
        $login_code = getLoginCodeByHotelId($factura->hotelId);
        $factura_code = encryptId($idFactura); 
        $subject = "Url de Factura de " . $hotel->nombre . " del " . date('d/m/Y', strtotime($factura->tiempoCreacion));
        $body = "Para ver la factura haga click en el siguiente link o copie y pegue la dirección en su navegador:<br>";
        $body .= "<a href='$vikahotel_url/facturacion?login_code=$login_code&fcode=$factura_code'>$vikahotel_url/facturacion?login_code=$login_code&fcode=$factura_code</a>";
        
        $email = $hotel->emailReservas;
        $mail = new Core_Mailer();
        $mail->send_email($email, $subject, $body);
        
    } catch ( Exception $e) {
        print_r($e);
        return false;
    }
}

function enviarEmailNuevaReserva($idReserva) {
    try {
        global $smarty;
        
        $reservacion = getReserva($idReserva);
        $reservacion->id = encryptId($idReserva);
        $smarty->assign('reserva', $reservacion);
        $cart = $reservacion->cart;
        $data_user = array(
            'nombre' => $reservacion->usuario->nombre,
            'apellido' => $reservacion->usuario->apellido,
            'email' => $reservacion->usuario->email,
            'telefono' => $reservacion->usuario->telefono
        );
        $smarty->assign('usuario', $data_user);
        $hotel = getHotelById($reservacion->hotelId);
        $subject = 'New Booking ' . $hotel->nombres->es . ' [' . $reservacion->localizador . ']';

        $smarty->assign('entrada', $reservacion->alojamiento[0]->inicio);
        $smarty->assign('salida', $reservacion->alojamiento[0]->final);

        $noches = ceil((strtotime($reservacion->alojamiento[0]->final) - strtotime($reservacion->alojamiento[0]->inicio))/(24*60*60));
        $smarty->assign('noches', $noches);

        $pais = getPais($reservacion->usuario->paisId);
        $smarty->assign('pais', $pais->nombre);
        $smarty->assign('base_url', $cart->url);
        $smarty->assign('currency', $moneda);
        $campania = false;
        $smarty->assign('hotel', $hotel);
        if($hotel && $hotel->campaniaId){
            $campania = getCampania($hotel->campaniaId);
            $smarty->assign('campania',$campania); 
        }

        $body = $smarty->fetch('confirmacionEmail_nodesign.tpl');
        $cobroAnticipado = 0;
        foreach ($reservacion->productos as $producto) {
            $cobroAnticipado += $producto->importeInicial;
        }
        //generar factura
        if($cobroAnticipado && $reservacion->estado == 'Aprobada') {
            $factura = generarFactura($reservacion, $hotel);
        } else {
            $factura = 0;
        }

        $mail = new Core_Mailer();                               
        /* enviando email al usuario */
        $enviado = $mail->send_email($data_user['email'], $subject, $body, $factura);

        if($factura) {
            //TODO: eliminar pdf
            $mail = new Core_Mailer();
            @unlink($factura);
        }



        $emails = $hotel->emailReservas;
        $emails = explode(',', $emails);

        $reserva_url = getReservaUrl($idReserva);
        $smarty->assign('reserva_url', $reserva_url);

        $body = $smarty->fetch('reservaEmail_nodesign.tpl');

        if($campania){
            $subject = 'New Booking ' . $reservacion->localizador . ' [contrato '.$campania->localizador.']';
        }else{
            $subject = 'New Booking '. $hotel->nombres->es . ' ' . $reservacion->localizador;    
        }

        $emailDistribuidor = explode(',', $hotel->distribuidor->emailReservas);

        if($emailDistribuidor && count($emailDistribuidor)) {                        
            foreach ($emailDistribuidor as $email) {
                if(strlen(trim($email)) > 0) {
                    $enviado = $mail->send_email($email, $subject, $body);
                }
            }                        
        }

        if($reservacion->estado == 'Aprobada') {//cuando no es onrequest

            foreach ($emails as $email) {
                if(strlen(trim($email)) > 0) {
                    $enviado = $mail->send_email($email, $subject, $body);
                }
            }

            if($reservacion->extras) {
                foreach ($reservacion->extras as $excursion) {
                    if($excursion->emails && explode(',', $excursion->emails)) {
                        $smarty->assign('excursion', $excursion);
                        $body = $smarty->fetch('confirmacionExcursion_nodesign.tpl');
                        $emails = explode(',', $excursion->emails);
                        $subject = 'New Booking ' . $excursion->localizador;
                        foreach ($emails as $email) {
                            if(strlen(trim($email))) {
                                $mail->send_email($email, $subject, $body);
                            }
                        }
                    }
                }
            }
        }
    } catch (Exception $ex) {
        print_r($ex);
    }
}
?>