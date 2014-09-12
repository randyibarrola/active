<?php

function getAdwordsByArgs($args = array()) {
    try {
        
        $rows = DAOFactory::getAdwordDAO()->queryByArgs($args);
        
        foreach ($rows as $pos=>$row) {
            $rows[$pos]['vigencia'] = date('d/m/Y', strtotime($row['inicio'])) . ' - ' . date('d/m/Y', strtotime($row['fin']));
        }
        
        return $rows;
        
    } catch (Exception $e) {
        print_r($e);
        return false;
    }   
}

function countAdwordsByArgs($args) {
    try {
        $counts = DAOFactory::getAdwordDAO()->countByArgs($args);
        return $counts[0][0];
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

function insertAdword($data = array(), $paises = array()) {
    try {
        $transaction = new Transaction();
        $data['tiempoCreacion'] = date('Y-m-d H:i:s');
        $adword = DAOFactory::getAdwordDAO()->prepare($data);
        $id = DAOFactory::getAdwordDAO()->insert($adword);
        
        foreach ($paises as $idPais) {
            $adword_pais = DAOFactory::getAdwordPaisDAO()->prepare(array(
                'adwordId' => $id,
                'paisId' => $idPais
            ));
            DAOFactory::getAdwordPaisDAO()->insert($adword_pais);
        }
        
        $transaction->commit();
        return $id;
    } catch (Exception $e) {
        var_dump($e);
        if($transaction) $transaction->rollback();
        return false;
    }
}

function updateAdword($id, $data = array(), $paises = array()) {
    try {
        $transaction = new Transaction();
        $adword = DAOFactory::getAdwordDAO()->prepare($data, $id);
        DAOFactory::getAdwordDAO()->update($adword);
        
        DAOFactory::getAdwordPaisDAO()->deleteByAdwordId($id);
        foreach ($paises as $idPais) {
            $adword_pais = DAOFactory::getAdwordPaisDAO()->prepare(array(
                'adwordId' => $id,
                'paisId' => $idPais
            ));
            DAOFactory::getAdwordPaisDAO()->insert($adword_pais);
        }
        $transaction->commit();
        return $id;
    } catch (Exception $e) {
        var_dump($e);
        if($transaction) $transaction->rollback();
        return false;
    }
}

function getAdwordsById($id) {
    try {
        $adword = DAOFactory::getAdwordDAO()->load($id);
        
        $paises = DAOFactory::getAdwordPaisDAO()->queryByAdwordId($id);
        $adword->paises = $paises;
        
        return $adword;
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

function getAdwordsByNombreCampania($term) {
    try {
        
        $adwords = DAOFactory::getAdwordDAO()->queryByCampania($term);
        
        
        return $adwords;
        
    } catch (Exception $e) {
        print_r($e);
        return false;
    }   
}

function updateAdwordHotel($idAdword, $idHotel) {
    try {
        $transaction = new Transaction();
        
        $adwords = DAOFactory::getAdwordDAO()->queryByHotelId($idHotel);
        if($adwords) {
            foreach ($adwords as $adword) {
                $adword->hotelId = NULL;
                DAOFactory::getAdwordDAO()->update($adword);
            }
        }
        if(strlen(trim($idAdword))) {
            $adword = DAOFactory::getAdwordDAO()->load($idAdword);
            $adword->hotelId = $idHotel;
            DAOFactory::getAdwordDAO()->update($adword);
        }
        
        $transaction->commit();
        return true;
    } catch (Exception $e) {
        var_dump($e);
        if($transaction) $transaction->rollback();
        return false;
    }
}

function getAdwordByHotel($idHotel) {
    try {
        
        $adwords = DAOFactory::getAdwordDAO()->queryByHotelId($idHotel);
        if($adwords && count($adwords)) {
            return $adwords[0];
        }
        return false;
        
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

?>