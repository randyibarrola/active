<?php

function insertFactura($idHotel, $reservas, $estado = "pendiente de cobro", $factura_negativa = false, $creacion = null, $cliente = 'usuario') {
    try {

        if(is_null($creacion)) $creacion = date('Y-m-d H:i:s');
        
        $transaction = new Transaction();
        
        $total = 0;
        $comision = 0;
        $hotel = getHotelById($idHotel);
        $campania = getCampania($hotel->campaniaId);

        foreach ($reservas as $reserva_id) {
            $reserva = getReserva($reserva_id);
            $total += $reserva->alojamiento[0]->precioUnitario;
        }
        
        $comision = $total * $campania->porcentajeBeneficio / 100;
        
        if($factura_negativa){
            $factura = getFactura($factura_negativa);
            $numero = 'R-'.$factura->numero;
            $comision = $comision * -1;
            $total = $total * -1;

        }else{
            $count = DAOFactory::getFacturaDAO()->countByYear(intval(date('Y')), $campania->localizador);
            $count = '' . $count[0][0];
            $count ++;
            while(strlen($count) < 4) $count = ('0' . $count);
            $numero = $count . '-' . $campania->localizador . '-' . date('Y');
        }

        $factura = DAOFactory::getFacturaDAO()->prepare(array(
            'hotelId' => $idHotel,
            'monedaId' => $hotel->monedaId,
            'estado' => $estado,
            'total' => str_replace(',', '.', $total),
            'comision' => str_replace(',', '.', $comision),
            'tiempoCreacion' => $creacion,
            'contrato' => $campania->localizador,
            'numero' => $numero,
            'cliente' => $cliente
        ));

        $id_factura = DAOFactory::getFacturaDAO()->insert($factura);

        foreach ($reservas as $reserva_id) {
            $rf = DAOFactory::getFacturaReservaDAO()->prepare(array(
                'facturaId' => $id_factura,
                'reservaId' => $reserva_id
            ));
            DAOFactory::getFacturaReservaDAO()->insert($rf);
        }
        
        $transaction->commit();
        return $id_factura;
        
    } catch (Exception $e) {
        var_dump($e);
        if($transaction)$transaction->rollback();
        return false;
    }
}

function updateFactura($id, $data = array(), $trasactional = true) {
        try {
            if($trasactional)   
            $transaction = new Transaction();
            
            $factura = getFactura($id);
            $factura = DAOFactory::getFacturaDAO()->prepare($data, $id);
            DAOFactory::getFacturaDAO()->update($factura);
            
            if($trasactional)
            $transaction->commit();

            return true;
        } catch (Exception $e) {
            var_dump($e);
            if ($transaction)
                $transaction->rollback();
            return false;
        }
    }

function getFactura($idFactura) {
    try {
        
        $factura = DAOFactory::getFacturaDAO()->load($idFactura);
        $hotel = getHotelById($factura->hotelId);
        $campania = getCampania($hotel->campaniaId);

        $frs = DAOFactory::getFacturaReservaDAO()->queryByFacturaId($idFactura);
        $reservas = array();
        foreach ($frs as $fr) {
            $reservas[] = getReserva($fr->reservaId);
        }
        $factura->reservas = $reservas;
        $factura->moneda = getMoneda($factura->monedaId);
        
        return $factura;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

function getFacturaByIdReserva($idReserva) {
    try {
        $frs = DAOFactory::getFacturaReservaDAO()->queryByReservaId($idReserva);
        $factura = false;
        if($frs){
            foreach ($frs as $fr) {
                $factura = DAOFactory::getFacturaDAO()->load($fr->facturaId);
                break;
            }
        }

        return $factura;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

function getFacturasByArgs($args = array()) {
    try {
        
        $facturas = DAOFactory::getFacturaDAO()->queryByArgs($args);
        
        foreach ($facturas as $pos=>$f) {
            $facturas[$pos]['tiempoCreacion'] = date('Y-m-d', strtotime($facturas[$pos]['tiempoCreacion']));
        }
        
        return $facturas;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

function countFacturasByArgs($args = array()) {
    try {
        
        $facturas = DAOFactory::getFacturaDAO()->queryByArgs($args);
        
        if($facturas)
            return $facturas[0][0];
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

function getAllFacturas() {
    try {
        
        $facturas = DAOFactory::getFacturaDAO()->queryAll();
        
        
        
        return $facturas;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

function cambiarEstadoFactura($id, $estado) {
    try {
        
        $factura = DAOFactory::getFacturaDAO()->prepare(array('estado'=>$estado), $id);
        DAOFactory::getFacturaDAO()->update($factura);
        
        
        
        return true;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

?>