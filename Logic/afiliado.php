<?php 

function insertAfiliado($data = array(), $data_cuenta = array(), $hoteles = array(), $productos = array(), $idUsuario) {
    try {
        $data["tiempoCreacion"] = date("Y-m-d H:i:s");
        $transaction = new Transaction();

        $data['usuarioId'] = $idUsuario;
        $afiliado = DAOFactory::getAfiliadoDAO()->prepare($data);
        $new_afiliado_id = DAOFactory::getAfiliadoDAO()->insert($afiliado);

        $data_direccion = $data_cuenta['direccion'];
        $direccion = DAOFactory::getDireccionDAO()->prepare($data_direccion);
        $id_direccion = DAOFactory::getDireccionDAO()->insert($direccion);
        
        $data_cuenta['usuarioId'] = $idUsuario;
        $data_cuenta['direccionId'] = $id_direccion;
        $cuenta = DAOFactory::getUsuarioCuentaDAO()->prepare($data_cuenta);
        $id_cuenta = DAOFactory::getUsuarioCuentaDAO()->insert($cuenta);

        foreach ($hoteles as $hotel_id) {
            $usuario_hotel = DAOFactory::getAfiliadoHotelDAO()->prepare(array(
                'afiliadoId' => $new_afiliado_id,
                'hotelId' => $hotel_id
            ));
            DAOFactory::getAfiliadoHotelDAO()->insert($usuario_hotel);
        }

        foreach ($productos as $producto_id) {
            $usuario_hotel = DAOFactory::getAfiliadoEventoDAO()->prepare(array(
                'afiliadoId' => $new_afiliado_id,
                'eventoId' => $producto_id
            ));
            DAOFactory::getAfiliadoEventoDAO()->insert($usuario_hotel);
        }
    
        $transaction->commit();

        return $new_afiliado_id;
    } catch (Exception $e) {
        var_dump($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function insertReservaAfiliado($reserva_id, $total){
    if(isset($_COOKIE['afiliado'])){
        $afiliado_id = urldecode(Encrypter::decrypt($_COOKIE['afiliado'], 'afiliado'));
        if(is_numeric($afiliado_id)){
            $afiliado = getAfiliado($afiliado_id);
            if($afiliado){
                $comision = $afiliado->comisionHotel;
                $comision_importe = $total * ($comision / 100);

                $reserva_afiliado_a = array(
                    'comision' => $comision_importe,
                    'porcentaje' => $comision,
                    'reservaId' => $reserva_id,
                    'afiliadoId' => $afiliado_id);

                $reserva_afiliado = DAOFactory::getReservaAfiliadoDAO()->prepare($reserva_afiliado_a);
                $reserva_afiliado_id = DAOFactory::getReservaAfiliadoDAO()->insert($reserva_afiliado);
            }
        }
    }
}

function updateAfiliado($idAfiliado, $data = array(), $data_cuenta = array(), $hoteles = array(), $productos = array(), $idUsuario) {
    try {
        $transaction = new Transaction();

        $afiliado = DAOFactory::getAfiliadoDAO()->prepare($data, $idAfiliado);
        DAOFactory::getAfiliadoDAO()->update($afiliado);

        $data_direccion = $data_cuenta['direccion'];
        $direccion = DAOFactory::getDireccionDAO()->prepare($data_direccion, $data_cuenta['direccionId']);
        DAOFactory::getDireccionDAO()->update($direccion);
        
        $cuenta = DAOFactory::getUsuarioCuentaDAO()->prepare($data_cuenta, $data_cuenta['id']);
        DAOFactory::getUsuarioCuentaDAO()->update($cuenta);
        
        DAOFactory::getAfiliadoHotelDAO()->deleteByAfiliadoId($idAfiliado);
        foreach ($hoteles as $hotel_id) {
            $afiliado_hotel = DAOFactory::getAfiliadoHotelDAO()->prepare(array(
                'afiliadoId' => $idAfiliado,
                'hotelId' => $hotel_id
            ));
            DAOFactory::getAfiliadoHotelDAO()->insert($afiliado_hotel);
        }

        DAOFactory::getAfiliadoEventoDAO()->deleteByAfiliadoId($idAfiliado);
        foreach ($productos as $producto_id) {
            $afiliado_evento = DAOFactory::getAfiliadoEventoDAO()->prepare(array(
                'afiliadoId' => $idAfiliado,
                'eventoId' => $producto_id
            ));
            DAOFactory::getAfiliadoEventoDAO()->insert($afiliado_evento);
        }
    

        $transaction->commit();

        return $afiliado;
    } catch (Exception $e) {
    	var_dump($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}
function getAfiliado($idAfiliado) {
    try {
        $afiliado = DAOFactory::getAfiliadoDAO()->load($idAfiliado);
        
        $afiliado->usuario = DAOFactory::getUsuarioDAO()->load($afiliado->usuarioId);
        $cuentas = DAOFactory::getUsuarioCuentaDAO()->queryByUsuarioId($afiliado->usuarioId);
        $afiliado->cuenta = array_pop($cuentas);

        if($afiliado->cuenta->direccionId) $afiliado->cuenta->direccion = DAOFactory::getDireccionDAO()->load($afiliado->cuenta->direccionId);
        if($afiliado->cuenta->paisId) $afiliado->cuenta->pais = DAOFactory::getPaisDAO()->load($afiliado->cuenta->paisId);

        $afiliado->hoteles = DAOFactory::getAfiliadoHotelDAO()->queryByAfiliadoId($idAfiliado);
        $afiliado->eventos = DAOFactory::getAfiliadoEventoDAO()->queryByAfiliadoId($idAfiliado);
        
        $afiliado->ganancias = DAOFactory::getReservaAfiliadoDAO()->queryByAfiliadoId($idAfiliado);

        return $afiliado;
    } catch (Exception $e) {
        return false;
    }
}
function getAfiliadoByIdUsuario($idUsuario){
    $afiliado = array_pop(DAOFactory::getAfiliadoDAO()->queryByUsuarioId($idUsuario));
    if($afiliado) {
        return getAfiliado($afiliado->id);
    }else{
        return false;
    }
}
function getAfiliados() {
    try {
        $afiliados = DAOFactory::getAfiliadoDAO()->queryAll();
        
        if(count($afiliados)){
        	foreach ($afiliados as $afiliado) {
        		$afiliado->usuario = DAOFactory::getUsuarioDAO()->load($afiliado->usuarioId);
        	}
        }
        return $afiliados;
    } catch (Exception $e) {
        return false;
    }
}

function deleteAfiliado($idAfiliado) {
    try {
        $transaction = new Transaction();

        DAOFactory::getAfiliadoHotelDAO()->deleteByAfiliadoId($idAfiliado);
        DAOFactory::getAfiliadoEventoDAO()->deleteByAfiliadoId($idAfiliado);

        $afiliado = DAOFactory::getAfiliadoDAO()->load($idAfiliado);
        $cuenta = array_pop(DAOFactory::getUsuarioCuentaDAO()->queryByUsuarioId($afiliado->usuarioId));

        if($cuenta){
            DAOFactory::getUsuarioCuentaDAO()->deleteByUsuarioId($afiliado->usuarioId);
            DAOFactory::getDireccionDAO()->delete($cuenta->direccionId);
        }

        DAOFactory::getAfiliadoDAO()->delete($idAfiliado);
        $result = DAOFactory::getUsuarioDAO()->delete($afiliado->usuarioId);

        $transaction->commit();

        return $result;
    } catch (Exception $e) {
        print_r($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}
function getAfiliadoDestinos($idAfiliado){
    try {
        $afiliado = DAOFactory::getAfiliadoDAO()->load($idAfiliado);
        
        $hoteles = DAOFactory::getAfiliadoHotelDAO()->queryByAfiliadoId($idAfiliado);

        $destinos_keys = array();

        foreach ($hoteles as $hotelAfiliado) {
            $hotel = getSimpleHotel($hotelAfiliado->hotelId);
            if(!in_array($hotel->destinoId, $destinos_keys)){
                if($hotel->destinoId){
                    $destinos_keys[] = $hotel->destinoId;
                }
            }
        }
        
        $destinos = array();

        foreach ($destinos_keys as $destino_key) {
            $destinos[] = getDestino($destino_key);
        }

        return $destinos;
    } catch (Exception $e) {
        return false;
    }
}
function getGananciasByArgs($args = array()) {
    try {
        
        $rows = DAOFactory::getReservaAfiliadoDAO()->queryByArgs($args);
        
        foreach ($rows as $pos=>$row) {
            $rows[$pos]['vigencia'] = date('d/m/Y', strtotime($row['inicio'])) . ' - ' . date('d/m/Y', strtotime($row['fin']));
        }
        
        return $rows;
        
    } catch (Exception $e) {
        print_r($e);
        return false;
    }   
}

function countGananciasByArgs($args) {
    try {
        $counts = DAOFactory::getReservaAfiliadoDAO()->countByArgs($args);
        return $counts[0][0];
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}
?>