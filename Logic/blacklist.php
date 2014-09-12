<?php

function insertIntoBlacklist($data) {
    try {
        
        $bl = DAOFactory::getBlacklistDAO()->prepare($data);
        $bl_id = DAOFactory::getBlacklistDAO()->insert($bl);
        
        return $bl_id;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

function updateBlacklist($id, $data) {
    try {
        
        $bl = DAOFactory::getBlacklistDAO()->prepare($data, $id);
        DAOFactory::getBlacklistDAO()->update($bl);
        
        return $id;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}


function getBlacklistById($id) {
    try {
        
        $bl = DAOFactory::getBlacklistDAO()->load($id);
        
        
        return $bl;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

function getBlacklistByHoteles($ids = array()) {
    try {
        
        if($ids && count($ids)) 
            $bl = DAOFactory::getBlacklistDAO()->queryByHoteles($ids);
        else 
            return array();
        
        
        return $bl;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

function getAllBlacklist() {
    try {
        
        $bl = DAOFactory::getBlacklistDAO()->queryAll();
        
        
        return $bl;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

function getBlacklistWithoutHotel() {
    try {
        
        $bl = DAOFactory::getBlacklistDAO()->queryByHotelIsNull();
        
        
        return $bl;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

function getBlacklistByDistribuidor($usuarioId) {
    try {
       
        $bl = DAOFactory::getBlacklistDAO()->queryByDistribuidor($usuarioId);
        
        
        return $bl;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

function getBlacklistByHotel($hotelId) {
    try {
       
        $bl = DAOFactory::getBlacklistDAO()->queryByHotelId($hotelId);
        
        
        return $bl;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}


function deleteFromBlacklist($id) {
    try {
        
        DAOFactory::getBlacklistDAO()->delete($id);       
        
        return true;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

function getWordsInBlacklist() {
    try {
        
        $words = array();
        $bl = DAOFactory::getBlacklistDAO()->queryAll();
        
        foreach($bl as $b) {
            array_push($words, StringUtils::clean($b->palabra));
        }
        
        return $words;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

function getWordsInBlacklistToRemove($hotelId=0) {
    try {
        
        $words = array();
        $bl = DAOFactory::getBlacklistDAO()->queryByOcultarResultado(0, $hotelId);
        
        if($bl){
            foreach($bl as $b) {
                $palabras = explode(',', $b->palabra);
                foreach ($palabras as $p) {
                    $str = $p;
                    if(mb_detect_encoding ($str) != 'UTF-8' || !mb_check_encoding($str, 'UTF-8'))
                            $str = utf8_encode ($str);
                    $words[] = trim($str);
                }
            }
        }
        
        return $words;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

function isValidResult($blacklistNoResults = array(), $term = ''){
    foreach ($blacklistNoResults as $bi) {
        if (strpos($term, $bi) !== false) {
            return true;
        }
    }
    return false;
}

function getWordsInBlacklistToRemoveResult($hotelId = 0) {
    try {
        
        $words = array();
        $bl = DAOFactory::getBlacklistDAO()->queryByOcultarResultado(1, $hotelId);
        
        if($bl){
            foreach($bl as $b) {
                $palabras = explode(',', $b->palabra);
                foreach ($palabras as $p) {
                    $str = $p;
                    if(mb_detect_encoding ($str) != 'UTF-8' || !mb_check_encoding($str, 'UTF-8'))
                            $str = utf8_encode ($str);
                    $words[] = trim($str);
                }
            }
        }
        
        return $words;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

?>