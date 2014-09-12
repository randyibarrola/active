<?php





function updateDireccion($idDireccion, $data = array()) {
    try {
        $transaction = new Transaction();

        $dir = DAOFactory::getDireccionDAO()->prepare($data, $idDireccion);
        DAOFactory::getDireccionDAO()->update($dir);
        
        $transaction->commit();

        return $idDireccion;
    } catch (Exception $e) {
        print_r($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function updateDireccionByHotelId($idHotel, $data = array()) {
    try {
        $transaction = new Transaction();

        $hotel = getHotelById($idHotel);
        if($hotel->direccion) {
            updateDireccion($hotel->direccion->id, $data);
        } else {
            $dir = DAOFactory::getDireccionDAO()->prepare($data);
            $dir_id = DAOFactory::getDireccionDAO()->insert($dir);
            
            $hd = DAOFactory::getHotelDireccionDAO()->prepare(array('hotelId'=>$hotel->id, 'direccionId'=>$dir_id));
            DAOFactory::getHotelDireccionDAO()->insert($hd);
        }
        $transaction->commit();

        return $idDireccion;
    } catch (Exception $e) {
        print_r($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}





?>