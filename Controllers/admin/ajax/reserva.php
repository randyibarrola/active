<?php 

$action = $_POST['action'];

$result = array('msg' => 'error', 'data' => 'Acción no valida');


if(strcmp($action, 'update') == 0) {
    if(isset($_POST['idReserva'])) {
        
        $idReserva = $_POST['idReserva'];
        
        $estado = $_POST['estado'];
        $oldEstado = getReserva($idReserva)->estado;
        
        $data = array('estado' => $_POST['estado'], 'nota' => $_POST['nota']);
        
        if($_POST['motivoCancelacion']) {
            $data['motivoCancelacion'] = $_POST['motivoCancelacion'];
        } else {
            $data['motivoCancelacion'] = NULL;
        }
        
        $pagos_data = $_POST['pagoUpdate'];
        
        $pagos = array();
        
        if($pagos_data) {
            foreach ($pagos_data as $pago) {
                $pagoTemp = array('estado'=>$pago['estado'], 'idPago'=>$pago['idPago']);
                if(isset($pago['op']) && strlen($pago['op']) > 0)
                    $pagoTemp['op'] = $pago['op'];
                if(isset($pago['opDevolucion']) && strlen($pago['opDevolucion']) > 0)
                    $pagoTemp['opDevolucion'] = $pago['opDevolucion'];
                $pagos[] = $pagoTemp;
            }
        }
        
        $reserva = updateReserva($idReserva, $data, $pagos);
        
        if($reserva) {
            $result['msg'] = 'ok';
            $result['data'] = 'Se guardaron los cambios correctamente';
            
            if($estado != $oldEstado) {
                if((($oldEstado == "Confirmada" || $oldEstado=="Aprobada" || $oldEstado=="Pendiente" || $oldEstado=="Cancelada por el cliente") && $estado == 'Cancelada por el administrador')
                    || (($oldEstado == "Confirmada" || $oldEstado=="Aprobada" || $oldEstado=="Pendiente") && $estado == "Cancelada por el cliente")) {
                    try {
                        set_time_limit(0);

                        $reservacion = getReserva($idReserva);
                        $reservacion->id = encryptId($idReserva);
                        /*Cancelación de excursiones en vikatickets.
                        if($reservacion->extras) {
                            foreach ($reservacion->extras as $excursion) {
                                
                                $distribuidor = getParametrosVikaByHotelId($reservacion->hotelId);
                                $params_ws = array_merge($distribuidor, array());
                                $params_ws['codigo'] = $excursion->localizador;
                                $params_ws['noContactUser'] = 1;
                                $client = new nusoap_client($service_url."/soap-reservacion");
                                $client->timeout = 1000000000;
                                $client->response_timeout = 1000000000;
                                $results = $client->call('cancelar', array('params' => $params_ws));

                                $results = json_decode($results);
                            }
                        }*/
                        
                        $subject = 'Tu reserva con localizador [' . $reservacion->localizador . '] fue cancelada';
                        if($reservacion->idiomaId) {
                            $smarty->configLoad($reservacion->idioma->codigo . '.conf');
                        }
                        $smarty->assign('usuario', get_object_vars($reservacion->usuario));
                        $apartamento = $reservacion->alojamiento[0];
                        $smarty->assign('reserva', $reservacion);
                        $smarty->assign('apartamento', $apartamento);
                        //$smarty->assign('precioTotal', $moneda . ' ' . number_format($precio, 2, ",", ""));
                        $smarty->assign('cantidad', $_POST['cantidad']);
                        $smarty->assign('excursiones', $reservacion->extras);
                        $smarty->assign('entrada', $apartamento->inicio);
                        $smarty->assign('salida', $apartamento->final);
                        $smarty->assign('hotel', $hotel);

                        $noches = ceil((strtotime($apartamento->final) - strtotime($apartamento->inicio))/(24*60*60));
                        $smarty->assign('noches', $noches);
                        $campania = false;

                        $hotel = getHotelById($reservacion->hotelId);

                        if($hotel && $hotel->campaniaId){
                            $campania = getCampania($hotel->campaniaId);
                            $smarty->assign('campania',$campania); 
                        }

                        $body = $smarty->fetch('cancelacionEmail_nodesign.tpl');

                        if($reservacion->pagos && count($reservacion->pagos) && $reservacion->pagos[0]->importe && $estado == 'Cancelada por el administrador') {
                            $factura = generarFactura($reservacion, $hotel, true);
                        } else {
                            $factura = 0;
                        }

                        $mail = new Core_Mailer();                               

                        $enviado = $mail->send_email($reservacion->usuario->email, $subject, $body, $factura);
                        
                        if($factura) {
                            $mail = new Core_Mailer();
                            @unlink($factura);
                        }

                        //solo se envia al hotel si no es parte del proceso de aprobacion del onrequest
                        if($estado != 'Pendiente' && $oldEstado != "Cancelada por el cliente") {
                            $emails = $hotel->emailReservas;
                            $emails = explode(',', $emails);
                            
                            $emails_distribuidor = explode(',', $hotel->distribuidor->emailReservas);
                            $emails = array_merge($emails, $emails_distribuidor);

                            $smarty->configLoad('es.conf');
                            $smarty->assign('usuario', $reservacion->usuario);
                            $body = $smarty->fetch('reservaCancelacionEmail_nodesign.tpl');

                            if($campania){
                                $subject = 'Reserva cancelada en '.$smarty->getConfigVariable('sistema_nombre').' [contrato '.$campania->localizador.']';
                            }else{
                                $subject = 'Reserva cancelada en '.$smarty->getConfigVariable('sistema_nombre');    
                            }


                            foreach ($emails as $email) {
                                if(strlen(trim($email)) > 0) {
                                    $enviado = $mail->send_email($email, $subject, $body);
                                }
                            }
                        }

                        //$result['email'] = $body;

                    } catch (Exception $e) {
                        print_r($e);
                    }
                } else if($estado == 'Aprobada') {
                    set_time_limit(0);
                    try {
                        $reservacion = getReserva($idReserva);
                        $reservacion->id = encryptId($idReserva);
                        $hotel = getHotelById($reserva->hotelId);
                        $subject = 'New Booking ' . $hotel->nombres->es . ' [Confirmed]';
                        $smarty->assign('hotel', $hotel);
                        $smarty->assign('usuario', get_object_vars($reservacion->usuario));
                        $apartamento = $reservacion->alojamiento[0];
                        $smarty->assign('reserva', $reservacion);            
                        $smarty->assign('entrada', $apartamento->inicio);
                        $smarty->assign('salida', $apartamento->final);


                        $noches = ceil((strtotime($apartamento->final) - strtotime($apartamento->inicio))/(24*60*60));
                        $smarty->assign('noches', $noches);
                        if($hotel && $hotel->campaniaId){
                            $campania = getCampania($hotel->campaniaId);
                            $smarty->assign('campania',$campania); 
                        }
                        if($reservacion->idiomaId) {
                            $smarty->configLoad($reservacion->idioma->codigo . '.conf');
                        }
                        $body = $smarty->fetch('confirmacionEmail_nodesign.tpl');

                        if($reserva->pagos && count($reserva->pagos) && $reserva->pagos[0]->importe) {
                            $factura = generarFactura($reserva, $hotel);
                        } else {
                            $factura = 0;
                        }

                        $mail = new Core_Mailer();                               

                        $enviado = $mail->send_email($reservacion->usuario->email, $subject, $body, $factura);
                        
                        if($factura) {
                            $mail = new Core_Mailer();
                            @unlink($factura);
                        }

                        //enviar al hotel
                        $smarty->configLoad('es.conf');
                        $reserva_url = getReservaUrl($reserva->id);
                        $smarty->assign('reserva_url', $reserva_url);
                        $subject = 'New Booking ' . $reserva->localizador . ' [Contrato ' . $campania->localizador . ']';
                        $body = $smarty->fetch('reservaEmail_nodesign.tpl');

                        $emails = explode(',', $hotel->emailReservas);

                        foreach ($emails as $email) {
                            $enviado = $mail->send_email($email, $subject, $body);
                        }
                        
                        //enviar a las excursiones
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
                    }catch(Exception $e) {
                        print_r($e);
                    }

                }
            }
            
        } else {
            $result['data'] = 'No se pudieron guardar los cambios. Verifique sus datos y vuelva a intentarlo.';
        }
        
    } else {
        $result['data'] = 'Seleccione la reserva';
    }
    
    
}

if(strcmp($action, 'eliminar') == '0') {
    if(isset($_POST['id'])) {
        $id = $_POST['id'];
        $eliminar = deleteReserva($id);
        
        if($eliminar) {
            $result['msg'] = 'ok';
            $result['data'] = 'Se eliminó la reserva';
            
        } else {
            $result['data'] = 'No se pudo eliminar la reserva';
        }
    }
}

if (strcmp($action, 'filtrar') == 0) {
    
        $query = $_POST['query'];
        
        $args = $_POST;
        
        
        /*
        $smarty->assign('reservas', $reservas);
        $smarty->assign('estadosReserva', array(
        'Pendiente', 
        'Cancelada por el cliente', 
        'Cancelada por el administrador',
        'Aprobada',
        'Confirmada'
        ));         
         */
        
        if(isset($_POST['table'])) {
            if(!isset($_POST['query']) || strlen(trim($query)))
                $reservas = showReservasByQuery($query, $args);
            else
                $reservas = showReservasPendientesAprobacion($usuario_core->getUsuario()->id, $args);
            $aaData = array();
            $totalFacturado = 0;
            $moneda = "EUR";
            $comisionTotal = 0;
            
            $hotel = false;
            foreach ($reservas as $reserva) {
                //print_r($reserva);
                $cant = $reserva['producto']['precioUnitario'] * $reserva['moneda']['tasaCambio'];
                $totalFacturado += $cant;
                
                if($reserva['producto']['porcientoInicial']){
                    $comision = ($cant * $reserva['producto']['porcientoInicial'] / 100);
                }else{
                    $comision = ($cant * $reserva['campania']['porcentajeBeneficio'] / 100);
                }
                
                if($reserva['estado'] == 'Cancelada por el administrador' || !$comision)
                    $comision = $reserva['moneda']['simbolo'].'0,0';
                else {
                    $comisionTotal += $comision;
                    $comision = $reserva['moneda']['simbolo'] . number_format($comision, 2, ',', '');
                }
                
                $data = array(
                    'localizador' => $reserva['localizador'],
                    'cliente' => $reserva['usuario']['nombre'] . ' ' . $reserva['usuario']['apellido'],
                    'hotel' => $reserva['hotel']['nombre'],
                    'llegada' => date('d-m-Y', strtotime($reserva['producto']['inicio'])),
                    'salida' => date('d-m-Y', strtotime($reserva['producto']['final'])),
                    //Aqui hay un error con la creación, dependiendo si buscas por hotel o quieres mostrar todas...
                    'creacion' => date('d-m-Y', strtotime($reserva['tiempoCreacion'])),
                    'total' => $reserva['moneda']['simbolo'] . number_format($reserva['producto']['precioUnitario'], 2, ',', ''),
                    'comision' => $comision,
                    'estado' => $reserva['estado'] ? : 'Pendiente',
                    'op' => $reserva['op'] ? : '',
                    'opDevolucion' => $reserva['opDevolucion'] ? : '',
                    'id' => $reserva['id']
                );
                
                if($data['op'] && strlen($data['op']) > 0 && $data['estado'] == 'Pendiente') {
                    //$data['estado'] = 'Aprobada';
                }
                
                $aaData[] = $data;
            }
            if(!isset($_POST['query']) || strlen(trim($query)))
                $filtered = $total = count(showReservasByQuery($query));
            else
                $filtered = $total = count(showReservasPendientesAprobacion($usuario_core->getUsuario()->id));
            
            if(isset($_POST['sSearch']) && strlen($_POST['sSearch'])) {
                if(!isset($_POST['query']) || strlen(trim($query)))
                    $filtered = count(showReservasByQuery($query, array('sSearch'=>$_POST['sSearch'])));
                else
                    $filtered = count(showReservasPendientesAprobacion($usuario_core->getUsuario()->id, array('sSearch'=>$_POST['sSearch'])));
            }
            
            if(count($aaData)) {
                $totalFacturado = '&euro;' . number_format($totalFacturado, 2, ',', '');
                $comision = '&euro;' . number_format($comisionTotal, 2, ',', '');
                $aaData[] = array(
                    'localizador' => '',
                    'cliente' => '',
                    'hotel' => '',
                    'llegada' => '',
                    'salida' => '',
                    'creacion' => '',
                    'total' => "Total: $totalFacturado",
                    'comision' => "Comisión: $comision",
                    'estado' => '',
                    'op' => '',
                    'opDevolucion' => '',
                    'id' => ''
                );
            }
            
            $_SESSION['lastReservas'] = $aaData;

            $result = array(
                "iTotalRecords"=> $total,
                "iTotalDisplayRecords"=> $filtered,
                'aaData' => $aaData
            );
            
        } else {
            if(!isset($_POST['query']) || strlen(trim($query)))
                $reservas = getReservasByQuery($query, $args);
            else
                $reservas = getReservasPendientesAprobacion($usuario_core->getUsuario()->id, $args);
            $html = $smarty->fetch('admin/reserva/filtros.tpl');
            $result['msg'] = 'ok';
            $result['html'] = $html;
        }
    
}

if (strcmp($action, 'cambiarEstado') == 0) {
    if(isset($_POST['id'])) {
        $reservaId = $_POST['id'];
        $estado = $_POST['estado'];
        
        $reserva = getReserva($_POST['id']);
        $oldEstado = $reserva->estado;
        
        if(strcmp($estado, 'Cancelada por el administrador') == 0 && isset($_POST['motivoCancelacion']))
            cambiarEstadoReserva($reservaId, $estado, $_POST['motivoCancelacion']);
        else 
            cambiarEstadoReserva($reservaId, $estado);
        
        $result['msg'] = 'ok';
        $result['data'] = 'Se guardaron los datos correctamente';
        
        if((($oldEstado == "Confirmada" || $oldEstado=="Aprobada" || $oldEstado=="Pendiente" || $oldEstado=="Cancelada por el cliente") && $estado == 'Cancelada por el administrador')
                    || (($oldEstado == "Confirmada" || $oldEstado=="Aprobada" || $oldEstado=="Pendiente") && $estado == "Cancelada por el cliente")) {
            try {
                set_time_limit(0);
                
                $reservacion = getReserva($reservaId);
                $reservacion->id = encryptId($reservaId);
                $subject = 'Tu reserva con localizador [' . $reservacion->localizador . '] fue cancelada';
                if($reservacion->idiomaId) {
                    $smarty->configLoad($reservacion->idioma->codigo . '.conf');
                }
                $smarty->assign('usuario', get_object_vars($reservacion->usuario));
                $apartamento = $reservacion->alojamiento[0];
                $smarty->assign('reserva', $reservacion);
                $smarty->assign('apartamento', $apartamento);
                //$smarty->assign('precioTotal', $moneda . ' ' . number_format($precio, 2, ",", ""));
                $smarty->assign('cantidad', $_POST['cantidad']);
                $smarty->assign('excursiones', $reservacion->extras);
                $smarty->assign('entrada', $apartamento->inicio);
                $smarty->assign('salida', $apartamento->final);
                
                
                $noches = ceil((strtotime($apartamento->final) - strtotime($apartamento->inicio))/(24*60*60));
                $smarty->assign('noches', $noches);
                $campania = false;
                
                $hotel = getHotelById($reservacion->hotelId);

                if($hotel && $hotel->campaniaId){
                    $campania = getCampania($hotel->campaniaId);
                    $smarty->assign('campania',$campania); 
                }
                $smarty->assign('hotel', $hotel);

                $body = $smarty->fetch('cancelacionEmail_nodesign.tpl');

                if($reservacion->pagos && count($reservacion->pagos) && $reservacion->pagos[0]->importe && $estado == 'Cancelada por el administrador') {
                    $factura = generarFactura($reservacion, $hotel, true);
                } else {
                    $factura = 0;
                }

                $mail = new Core_Mailer();                               

                $enviado = $mail->send_email($reservacion->usuario->email, $subject, $body, $factura);
                
                if($factura) {
                    $mail = new Core_Mailer();
                    @unlink($factura);
                }

                //solo se envia al hotel si no es parte del proceso de aprobacion del onrequest
                if($estado != 'Pendiente' && $oldEstado != "Cancelada por el cliente") {
                    $emails = $hotel->emailReservas;
                    $emails = explode(',', $emails);

                    $emails_distribuidor = explode(',', $hotel->distribuidor->emailReservas);
                    $emails = array_merge($emails, $emails_distribuidor);

                    $smarty->configLoad('es.conf');
                    $smarty->assign('usuario', $reservacion->usuario);
                    $body = $smarty->fetch('reservaCancelacionEmail_nodesign.tpl');

                    if($campania){
                        $subject = 'Reserva cancelada en '.$smarty->getConfigVariable('sistema_nombre').' [contrato '.$campania->localizador.']';
                    }else{
                        $subject = 'Reserva cancelada en '.$smarty->getConfigVariable('sistema_nombre');    
                    }


                    foreach ($emails as $email) {
                        if(strlen(trim($email)) > 0) {
                            $enviado = $mail->send_email($email, $subject, $body);
                        }
                    }
                }
                
                //$result['email'] = $body;
                
            } catch (Exception $e) {
                print_r($e);
            }
        } else if($estado == 'Aprobada') {
            set_time_limit(0);
            try {
                $reservacion = getReserva($reservaId);
                $reservacion->id = encryptId($reservaId);
                $hotel = getHotelById($reserva->hotelId);
                $subject = 'New Booking ' . $hotel->nombres->es . ' [Confirmed]';
                $smarty->assign('hotel', $hotel);
                $smarty->assign('usuario', get_object_vars($reservacion->usuario));
                $apartamento = $reservacion->alojamiento[0];
                $smarty->assign('reserva', $reservacion);            
                $smarty->assign('entrada', $apartamento->inicio);
                $smarty->assign('salida', $apartamento->final);


                $noches = ceil((strtotime($apartamento->final) - strtotime($apartamento->inicio))/(24*60*60));
                $smarty->assign('noches', $noches);
                if($hotel && $hotel->campaniaId){
                    $campania = getCampania($hotel->campaniaId);
                    $smarty->assign('campania',$campania); 
                }
                if($reservacion->idiomaId) {
                    $smarty->configLoad($reservacion->idioma->codigo . '.conf');
                }
                $body = $smarty->fetch('confirmacionEmail_nodesign.tpl');

                if($reservacion->pagos && count($reservacion->pagos) && $reservacion->pagos[0]->importe) {
                    $factura = generarFactura($reservacion, $hotel);
                } else {
                    $factura = 0;
                }

                $mail = new Core_Mailer();                               

                $enviado = $mail->send_email($reservacion->usuario->email, $subject, $body, $factura);
                
                if($factura) {
                    $mail = new Core_Mailer();
                    @unlink($factura);
                }

                //enviar al hotel
                $smarty->configLoad('es.conf');
                $subject = 'New Booking ' . $reserva->localizador . ' [Contrato ' . $campania->localizador . ']';
                $reserva_url = getReservaUrl($reserva->id);
                $smarty->assign('reserva_url', $reserva_url);
                $body = $smarty->fetch('reservaEmail_nodesign.tpl');

                $emails = explode(',', $hotel->emailReservas);

                foreach ($emails as $email) {
                    $enviado = $mail->send_email($email, $subject, $body);
                }
                
                //enviar a las excursiones
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
            }catch(Exception $e) {
                print_r($e);
            }
            
        }
        
    }
}

if(strcmp($action, 'cardData') == 0) {
    if(isset($_POST['clave'])) {
        
        $reserva = getReserva($_POST['id'], true);
        
        $valida = verificarClaveHotel($reserva->hotelId, $_POST['clave']);
        
        
        
        if($valida) {
            $reserva->hotel = getHotelById($reserva->hotelId);
            
            if(!$reserva->pagos || !count($reserva->pagos)) {
                $reserva->pagos = array();
                $reserva->pagos[0]->importe = $reserva->productos[0]->precioUnitario;
                $reserva->pagos[0]->formaPago = 'efectivo';
            } else {
                $reserva->pagos[0]->importe = $reserva->productos[0]->precioUnitario;
            }
            
            if($reserva->pagos) {
                $hotel = getHotelById($reserva->hotelId);
                $beneficio = $reserva->productos[0]->porcientoInicial;
                /*if(!$beneficio)
                    $beneficio = $hotel->distribuidor->porcentajeBeneficio;
                */
                if($usuario_core->getUsuario()->usuarioGrupoId != 3 && $usuario_core->getUsuario()->usuarioGrupoId != 1)
                    $beneficio = 100 - $beneficio;

                foreach ($reserva->pagos as $k=>$pago) {
                    $reserva->pagos[$k]->importe = $pago->importe * $beneficio / 100;
                }
            }
            
            //print_r($reserva->pagos);
            $smarty->assign('reserva', $reserva);
            $smarty->assign('edit', true);
            $smarty->assign('meses', array('Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
                    'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'));

            $smarty->assign('estadosPago', array('Pendiente', 'Denegado', 'Confirmado'));
            $smarty->assign('estadosReserva', Core_Util_General::getEstadosReserva($reserva->tipoCobro));
            
            $html = $smarty->fetch('admin/reserva/pagos.tpl');
            $result['msg'] = 'ok';
            $result['html'] = $html;
            
        } else {
            $result['data'] = 'La clave no es válida';
        }
        
    } else {
        $result['data'] = 'La clave no es válida';
    }
}

if (strcmp($action, 'search') == 0) {
    $term = $_POST['term'];
    $usuario = $usuario_core->getUsuario();
    $elementos = busquedaReservas($term, $usuario->id);
    $result['msg'] = 'ok';
    $result['lista'] = $elementos;
}

if (strcmp($action, 'insert') == 0) {
    
    $hotel = getHotelById($_POST['hotelId']);
    
    $data_user = array(
        'nombre' => NULL,
        'apellido' => NULL,
        'email' => NULL,
        'telefono' => NULL,
        'paisId' => NULL
    );
    
    $data_reserva = array(
        'urlOrigen' => 'admin vikahotel',
        'monedaId' => $hotel->monedaId,
        'recibirFactura' => 0,
        'adultos' => 0,
        'ninios' => 0
    );
    
    foreach ($data_reserva as $k=>$val) {
        if(isset($_POST[$k]))
            $data_reserva[$k] = $_POST[$k];
    }

    foreach ($data_user as $k=>$val) {
        if(isset($_POST[$k]))
            $data_user[$k] = $_POST[$k];
    }
    
    $data_pago = array(
        'formaPago' => 'tarjeta',
        'tipo' => 'pago',
        'tarjetaTipo' => NULL,
        'tarjetaNumero' => NULL,
        'titular' => NULL,
        'caducidadMes' => NULL,
        'caducidadAnio' => NULL,
        'cvv' => NULL,
        'importe' => 0,
        'op' => NULL
    );
    
    foreach ($data_pago as $k=>$val) {
        if(isset($_POST[$k]))
            $data_pago[$k] = $_POST[$k];
    }
    
    $data_apartamento = array(
        'titulo' => NULL,
        'pension' => NULL,
        'condicion' => NULL,
        'precioUnitario' => 0,
        'inicio' => NULL,
        'final' => NULL,
        'tipo' => 'apartamento',
        'adultos' => 1,
        'ninios' => 0
    );
    
    
    
    foreach ($data_apartamento as $k=>$val) {
        if(isset($_POST[$k]))
            $data_apartamento[$k] = $_POST[$k];
    }
    
    if($data_apartamento['inicio']) {
        $f = explode('-', $data_apartamento['inicio']);
        $data_apartamento['inicio'] = implode('-', array_reverse($f));
    }
    
    if($data_apartamento['final']) {
        $f = explode('-', $data_apartamento['final']);
        $data_apartamento['final'] = implode('-', array_reverse($f));
    }
    
    $data_apartamento['nombre'] = $data_apartamento['titulo'];
    
    $data_apartamento['importeInicial'] = $_POST['importe'];
    
    $cart_data = array(
        'hotelId' => $hotel->id,
        'apartamento' => $data_apartamento,
        'monedaId' => $hotel->monedaId,
        'inicio' => $data_apartamento['inicio'],
        'salida' => $data_apartamento['final'],
        'noches' => intval((strtotime($data_apartamento['final']) - strtotime($data_apartamento['inicio'])) / (60 * 60 * 24)),
        'importe' => $_POST['importe']
    );
    
    $cartid = insertCart($cart_data);
    
    $data_reserva['cartId'] = $cartid;
    
    $idReserva = insertReserva($hotel->id, $data_reserva, $data_apartamento, array(), $data_user, $data_pago, $_POST['importe']);
    
    if($idReserva) {
        
        enviarEmailNuevaReserva($idReserva);
        
        $result = array(
            'msg' => 'ok',
            'data' => 'Se guardaron los datos satisfactoriamente'
        );
    } else {
        $result['data'] = 'No se guardaron los datos';
    }

}

echo json_encode($result);

?>