<?php



function getAllPromociones() {
    try {
        
        $promociones = DAOFactory::getPromocionPalabrasClavesDAO()->queryAll();
        
        
        return $promociones;
        
    } catch(Exception $e) {
        return false;
    }
}

function getPromocionPalabrasClave($id) {
    try {
        
        $promo = DAOFactory::getPromocionPalabrasClavesDAO()->load($id);
        
        $hoteles = DAOFactory::getPromocionPalabrasClavesHotelDAO()->queryByPromocionId($id);
        $hs = array();
        if($hoteles) {
            foreach($hoteles as $hp) {
                $h = DAOFactory::getHotelDAO()->load($hp->hotelId);
                $hs[] = $h;
            }
        }
        $promo->hoteles = $hs;
        
        return $promo;
        
    } catch(Exception $e) {
        return false;
    }
}

function insertPromocionPalabrasClave($data = array(), $data_hoteles = array()) {
    try {
        
        $transaction = new Transaction();
        
        $promocion = DAOFactory::getPromocionPalabrasClavesDAO()->prepare($data);
        $promocion_id = DAOFactory::getPromocionPalabrasClavesDAO()->insert($promocion);
        
        if($data_hoteles && is_array($data_hoteles) && count($data_hoteles)) {
            foreach ($data_hoteles as $hid) {
                $hotel_promo = DAOFactory::getPromocionPalabrasClavesHotelDAO()->prepare(array('promocionId'=>$promocion_id, 'hotelId'=>$hid));
                DAOFactory::getPromocionPalabrasClavesHotelDAO()->insert($hotel_promo);
            }
        }
        
        $transaction->commit();
        
        return true;
        
    } catch (Exception $e) {
        error_log($e);
        if($transaction)$transaction->rollback();
        return false;
    }
}

function updatePromocionPalabrasClave($id, $data = array(), $data_hoteles = array()) {
    try {
        
        $transaction = new Transaction();
        
        $promocion = DAOFactory::getPromocionPalabrasClavesDAO()->prepare($data, $id);
        DAOFactory::getPromocionPalabrasClavesDAO()->update($promocion);
        DAOFactory::getPromocionPalabrasClavesHotelDAO()->deleteByPromocionId($id);
        if($data_hoteles && is_array($data_hoteles) && count($data_hoteles)) {
            foreach ($data_hoteles as $hid) {
                $hotel_promo = DAOFactory::getPromocionPalabrasClavesHotelDAO()->prepare(array('promocionId'=>$id, 'hotelId'=>$hid));
                DAOFactory::getPromocionPalabrasClavesHotelDAO()->insert($hotel_promo);
            }
        }
        
        $transaction->commit();
        
        return true;
        
    } catch (Exception $e) {
        error_log($e);
        if($transaction)$transaction->rollback();
        return false;
    }
}

function getPromocionesPorPalabrasByHotel($idHotel) {
    try {
        
        $promociones = DAOFactory::getPromocionPalabrasClavesDAO()->queryByHotelId($idHotel);
        
        return $promociones;
        
    } catch(Exception $e) {
        error_log($e);
        return false;
    }
}

function verificarPromocion($promociones, $texto) {
    try {
        $text = strtolower($texto);
        if($promociones && is_array($promociones)) {
            foreach ($promociones as $promocion) {
                $palabras = explode(',', $promocion->palabras);
                foreach ($palabras as $p) {
                    $palabra = trim(strtolower($p));
                    if(strlen($palabra) && strpos($text, $palabra) != false) {
                        //echo 'findit:'.$palabra . ' in:' . $text;
                        return $promocion;
                    }
                }
            }
            
        }
        
        return false;
        
    } catch(Exception $e) {
        error_log($e);
        return false;
    }
}

function getPromocionByHotelIdAndFechas($idHotel, $inicio, $fin) {
    try {
        
        $promociones = DAOFactory::getPromocionDAO()->queryByHotelIdAndFechas($idHotel, $inicio, $fin);
        
        if($promociones && count($promociones))            
            return $promociones;
        return false;
        
    } catch (Exception $e) {
        return false;
    }
}

?>