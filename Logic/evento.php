<?php
function insertEvento($data = array(), $data_direccion = array(), $tickets = array(), $condiciones = array()) {
    try {
        $data["tiempoCreacion"] = date("Y-m-d H:i:s");  
        $transaction = new Transaction();
        $d = false;
        foreach ($data_direccion as $dir) {
            if(!is_null($dir) && strlen(trim($dir)) > 0) {
                $d = true;
                break;
            }
        }
        
        if($d) {
            $direccion = DAOFactory::getDireccionDAO()->prepare($data_direccion);
            $id_direccion = DAOFactory::getDireccionDAO()->insert($direccion);
            $data["direccionId"] = $id_direccion;
        }

        $evento = DAOFactory::getEventoDAO()->prepare($data);        
        $new_evento_id = DAOFactory::getEventoDAO()->insert($evento);

        if($tickets && is_array($tickets)){
            foreach($tickets as $ticket) {

                $ticket["eventoId"] = $new_evento_id;
                $horarios = array();

                if(isset($ticket['horario']) && is_array($ticket["horario"])){
                    foreach ($ticket["horario"] as $h_k => $horario) {
                        $hour = date ('H:i', strtotime($horario));
                        if(strlen($horario) > 3 && $hour){
                            array_push($horarios, $hour);
                        }else{
                            unset($ticket["horario"][$h_k]);
                        }
                    }
                }

                $ticket["horario"] = serialize($horarios);
                $ticket_array = $ticket;

                $ticket = DAOFactory::getTicketDAO()->prepare($ticket);
                $ticket->idiomaId = 1;
                
                $new_ticket_id = DAOFactory::getTicketDAO()->insert($ticket);

                if(isset($ticket_array['fechas']) && is_array($ticket_array["fechas"])){
                       foreach ($ticket_array["fechas"] as $fecha) {
                            $f = date("Y-m-d" , strtotime($fecha));
                            if(strlen($fecha) && $f){
                                $ticketFecha = DAOFactory::getTicketFechaDAO()->prepare(array("fecha" => $f, "ticketId" => $new_ticket_id));
                                DAOFactory::getTicketFechaDAO()->insert($ticketFecha);    
                            }
                       }
                }
            }    
        }

        foreach ($condiciones as $cond) {
            $condicion = DAOFactory::getEventoCondicionDAO()->prepare(array('eventoId'=>$new_evento_id, 'condicionId'=>$cond));
            DAOFactory::getEventoCondicionDAO()->insert($condicion);
        }

        $transaction->commit();

        return $new_evento_id;
    } catch (Exception $e) {
        var_dump($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function updateEventoData($idProducto, $data_producto) {
    try {
        $transaction = new Transaction();
        
        $producto = DAOFactory::getEventoDAO()->prepare($data_producto, $idProducto);
        
        DAOFactory::getEventoDAO()->update($producto);
        
        getClaveByHotel($idProducto);
        
        $transaction->commit();

        return $producto;
    } catch (Exception $e) {
        print_r($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}


function updateEvento($idEvento, $data = array(), $data_direccion = array(), $tickets = array(), $condiciones = array()) {
    try {
        $transaction = new Transaction();

        $evento = DAOFactory::getEventoDAO()->prepare($data, $idEvento);

        if(!$evento->direccionId){
            $direccion = DAOFactory::getDireccionDAO()->prepare($data_direccion);
            $id_direccion = DAOFactory::getDireccionDAO()->insert($direccion);
            $evento->direccionId = $id_direccion;
        }else{
            $direccion = DAOFactory::getDireccionDAO()->prepare($data_direccion, $evento->direccionId);
            DAOFactory::getDireccionDAO()->update($direccion);
        }
        
        DAOFactory::getEventoDAO()->update($evento);

        deleteTicketsByEvento($idEvento, $transactional);

        if($tickets && is_array($tickets)){
            foreach($tickets as $ticket) {
                $ticket["eventoId"] = $idEvento;
                $horarios = array();

                if(isset($ticket['horario']) && is_array($ticket["horario"])){
                    foreach ($ticket["horario"] as $h_k => $horario) {
                        $hour = date ('H:i', strtotime($horario));
                        if(strlen($horario) > 3 && $hour){
                            array_push($horarios, $hour);
                        }else{
                            unset($ticket["horario"][$h_k]);
                        }
                    }
                }

                $ticket["horario"] = serialize($horarios);
                $ticket_array = $ticket;

                $ticket = DAOFactory::getTicketDAO()->prepare($ticket);
                $ticket->idiomaId = 1;
                
                $new_ticket_id = DAOFactory::getTicketDAO()->insert($ticket);

                if($new_ticket_id && isset($ticket_array['fechas']) && is_array($ticket_array["fechas"])){
                       foreach ($ticket_array["fechas"] as $fecha) {
                            $f = date("Y-m-d" , strtotime($fecha));
                            if(strlen($fecha) && $f){
                                $ticketFecha = DAOFactory::getTicketFechaDAO()->prepare(array("fecha" => $f, "ticketId" => $new_ticket_id));
                                DAOFactory::getTicketFechaDAO()->insert($ticketFecha);    
                            }
                       }
                }
            }    
        }

        DAOFactory::getEventoCondicionDAO()->deleteByEventoId($idEvento);

        foreach ($condiciones as $cond) {
            $condicion = DAOFactory::getEventoCondicionDAO()->prepare(array('eventoId'=>$idEvento, 'condicionId'=>$cond));
            DAOFactory::getEventoCondicionDAO()->insert($condicion);
        }

        $transaction->commit();

        return $idEvento;
    } catch (Exception $e) {
        print_r($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function insertEventoImage($data,$evento_id) {
    try {
        $transaction = new Transaction();
        
        $archivo = DAOFactory::getArchivoDAO()->prepare($data);
        $new_archivo_id = DAOFactory::getArchivoDAO()->insert($archivo);
        
        if($new_archivo_id){
            $evento_archivo = array('eventoId' => $evento_id,'archivoId' => $new_archivo_id);
            $evento_archivo = DAOFactory::getEventoArchivoDAO()->prepare($evento_archivo);
            $new_evento_archivo_id = DAOFactory::getEventoArchivoDAO()->insert($evento_archivo);

            $transaction->commit();
        }
       

        return $new_evento_archivo_id;
    } catch (Exception $e) {
        var_dump($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function getAllEventoImages($idEvento, $all = false) {
    try {
        
        $h_archivos = DAOFactory::getEventoArchivoDAO()->queryByEventoId($idEvento);
        $images = array();

        if($h_archivos)
            foreach ($h_archivos as $h_a) {
                $images[] = DAOFactory::getArchivoDAO()->load($h_a->archivoId);
            }

        return $images;
        
    } catch (Exception $e) {
        return false;
    }
}

function deleteEventoFoto($id) {
    try {
        $transaction = new Transaction();

        DAOFactory::getEventoArchivoDAO()->deleteByArchivoId($id);
        DAOFactory::getArchivoDAO()->delete($id);
        $transaction->commit();

        return true;
    } catch (Exception $e) {
        var_dump($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function deleteEventoImages($idEvento, $transactional = true){
    try {
        if($transactional)$transaction = new Transaction();

        $h_archivos = DAOFactory::getEventoArchivoDAO()->queryByEventoId($idEvento);

        foreach ($h_archivos as $h_a) {
            $d = DAOFactory::getEventoArchivoDAO()->delete($h_a->id);
            if (!$d) {
                throw new Exception("Error:delete evento archivos.");
            }
            $d = DAOFactory::getArchivoDAO()->delete($h_a->archivoId);
             if (!$d) {
                throw new Exception("Error:delete archivos");
            }
        }
        if($transactional)$transaction->commit();

        return $result;
    } catch (Exception $e) {
        var_dump($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function getFullDataEvent($evento){
    try {        
        $evento->fotos = getEventoFotos($evento->id);
        $evento->condiciones = DAOFactory::getEventoCondicionDAO()->queryByEventoId($evento->id);
        
        /*
            $evento->descripcionBreve = json_decode($evento->descripcionBreve);
            $evento->descripcionExtendida = json_decode($evento->descripcionExtendida);
            $evento->sugerenciasTpv = json_decode($evento->sugerenciasTpv);
            $evento->instruccionesConsumo = json_decode($evento->instruccionesConsumo);
        */

        $tickets_a = getTicketsByEventoId($evento->id);
        $evento->tickets = $tickets_a['tickets'];
        $evento->precio_minimo = $tickets_a['precio_minimo'];

        $evento->campania = DAOFactory::getCampaniaDAO()->load($evento->campaniaId);
        $evento->destino = DAOFactory::getDestinoTuristicoDAO()->load($evento->destinoTuristicoId);
        $evento->direccion = DAOFactory::getDireccionDAO()->load($evento->direccionId);
        $evento->guias = unserialize($evento->guias);
        
        $duracion_h = sprintf("%02s", floor($evento->duracion));
        $duracion_m = sprintf("%02s", ceil(($evento->duracion - $duracion_h)*60));
        $evento->duracion = $duracion_h.':'.$duracion_m;
        return $evento;
        
    } catch(Exception $e) {
        return false;
    }
}

function getEventos() {
    try {
        
        $eventos = DAOFactory::getEventoDAO()->queryAll();
        
        foreach ($eventos as $evento) {
            $evento = getFullDataEvent($evento);
        }
        
        return $eventos;
        
    } catch(Exception $e) {
        return false;
    }
}

function getEvento($id){
    try {
        
        $evento = DAOFactory::getEventoDAO()->load($id);
        $evento = getFullDataEvent($evento);
        return $evento;
        
    } catch(Exception $e) {
        return false;
    }
}

function getTicketsByEventoId($evento_id) {
    try {
        
        $tickets = DAOFactory::getTicketDAO()->queryByEventoId($evento_id);
        $precio_minimo = 9999999;

        foreach ($tickets as $ticket) {
            if($precio_minimo > $ticket->precio){
                $precio_minimo = $ticket->precio;
            }
            $fechas = DAOFactory::getTicketFechaDAO()->queryByTicketId($ticket->id);
            $ticket->fechas = $fechas;
            $ticket->fechas_json = json_encode($fechas);
            $ticket->horario = unserialize($ticket->horario);
        }

        if($precio_minimo==9999999){
            $precio_minimo = false;
        }
        
        return array('tickets'=>$tickets, 'precio_minimo' => $precio_minimo);
        
    } catch(Exception $e) {
        return false;
    }
}

function deleteEvento($eventoId){
    try{
        $transaction = new Transaction();

        deleteTicketsByEvento($eventoId, $transactional);
        $evento = DAOFactory::getEventoDAO()->load($eventoId);

        DAOFactory::getEventoCondicionDAO()->deleteByEventoId($evento->id);

        $h_archivos = DAOFactory::getEventoArchivoDAO()->queryByEventoId($eventoId);
        
        if($h_archivos &&  is_array($h_archivos)){
            foreach ($h_archivos as $h_a) {
                $d = DAOFactory::getEventoArchivoDAO()->delete($h_a->id);
                if (!$d) {
                    throw new Exception("Error:delete evento archivos.");
                }
                $file = DAOFactory::getArchivoDAO()->load($h_a->archivoId);
                
                $dir = str_replace($base_url, $app_dir, $file->ruta);
                $dir = str_replace('//', '/', $dir);
                if(file_exists($dir))
                    unlink($dir);

                $d = DAOFactory::getArchivoDAO()->delete($h_a->archivoId);

                if (!$d) {
                    throw new Exception("Error:delete archivos");
                }
            }
        }
        DAOFactory::getConfiguracionEventoDAO()->deleteByEventoId($eventoId);

        $deleted = DAOFactory::getEventoDAO()->delete($eventoId);  
        $d = DAOFactory::getDireccionDAO()->delete($evento->direccionId);

        $transaction->commit();
        return $deleted;

    } catch (Exception $e) {
        var_dump($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function deleteTicketsByEvento($eventoId, $transactional = true){
    try{
        if($transactional) $transaction = new Transaction();

        $tickets = DAOFactory::getTicketDAO()->queryByEventoId($eventoId);
        
        if($tickets && is_array($tickets)){
            foreach ($tickets as $ticket) {
                DAOFactory::getTicketFechaDAO()->deleteByTicketId($ticket->id);    
            }
        }
        
        DAOFactory::getTicketDAO()->deleteByEventoId($eventoId);
        
        if($transactional) $transaction->commit();

    } catch (Exception $e) {
        var_dump($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function getTicket($id){
    try {
        
        $ticket = DAOFactory::getTicketDAO()->load($id);
        $ticket->fechas = DAOFactory::getTicketFechaDAO()->queryByTicketId($id);
        $ticket->horario = unserialize($ticket->horario);
        return $ticket;
        
    } catch(Exception $e) {
        return false;
    }
}

function getEventoFotos($id){
    try {
        $evento_fotos = DAOFactory::getEventoArchivoDAO()->queryByEventoId($id);
        $fotos = array();

        if($evento_fotos && is_array($evento_fotos)){
            foreach ($evento_fotos as $evento_foto) {
                $fotos[] = DAOFactory::getArchivoDAO()->load($evento_foto->archivoId);
            }
        }

        return $fotos;
    } catch(Exception $e) {
        return false;
    }
}

function getProductosFullByConfiguracionId($id, $limit = false, $favorito = false) {
    try {
        $productos = array();
        $productos_configuracion = DAOFactory::getConfiguracionEventoDAO()->queryByConfiguracionId($id);
        $counter = 0;

        if($productos_configuracion && is_array($productos_configuracion)){
            foreach ($productos_configuracion as $producto_c) {
                if($limit && $counter >= $limit){
                    break;
                }
                if($producto_c->favorito || !$favorito){
                    $productos[] = getEvento($producto_c->eventoId);
                    $counter++;
                }
            }    
        }
        
        return $productos;
        
    } catch(Exception $e) {
        return false;
    }
}


function userCanAccessEvento($idEvento, $idUser) {
    try {
        $usuario = DAOFactory::getUsuarioDAO()->load($idUser);
        if($usuario->usuarioGrupoId == 1)
            return true;
        $uh = DAOFactory::getEventoDAO()->queryUsuarioEvento($idUser, $idEvento);
        if($uh && count($uh))
            return true;
        
        return false;
        
        
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}
?>