<?php

function insertDestino($data = array(), $data_direccion = array()) {
    try {
        
        $transaction = new Transaction();
        
        $direccion = DAOFactory::getDireccionDAO()->prepare($data_direccion);
        $id_direccion = DAOFactory::getDireccionDAO()->insert($direccion);
        
        $data['direccionId'] = $id_direccion;
        
        $destino = DAOFactory::getDestinoTuristicoDAO()->prepare($data);
        $id_destino = DAOFactory::getDestinoTuristicoDAO()->insert($destino);
        
        $lugares = $data['lugares'];
        if($lugares){
            $lugares = explode(',', $lugares);
            if(count($lugares)){
                foreach ($lugares as $lugar) {
                    $l = DAOFactory::getDestinoLugaresDAO()->prepare(array('destinoTuristicoId'=>$id_destino, 'nombre'=>$lugar));
                    DAOFactory::getDestinoLugaresDAO()->insert($l);
                }
            }
        }
        
        $transaction->commit();
        
        return $id_destino;
        
    } catch (Exception $e) {
        var_dump($e);
        if($transaction) $transaction->rollback();
        return false;
    }
}

function updateDestino($idDestino, $data = array(), $data_direccion = array()) {
    try {
        
        $transaction = new Transaction();
        
        $destino = DAOFactory::getDestinoTuristicoDAO()->prepare($data, $idDestino);
        DAOFactory::getDestinoTuristicoDAO()->update($destino);
        
        $direccion = DAOFactory::getDireccionDAO()->prepare($data_direccion, $destino->direccionId);
        DAOFactory::getDireccionDAO()->update($direccion);

        $lugares = $data['lugares'];
        DAOFactory::getDestinoLugaresDAO()->deleteByDestinoTuristicoId($destino->id);

        if($lugares){
            $lugares = explode(',', $lugares);
            if(count($lugares)){
                foreach ($lugares as $lugar) {
                    $l = DAOFactory::getDestinoLugaresDAO()->prepare(array('destinoTuristicoId'=>$destino->id, 'nombre'=>$lugar));
                    DAOFactory::getDestinoLugaresDAO()->insert($l);
                }
            }
        }
        
        $transaction->commit();
        
        return $idDestino;
        
    } catch (Exception $e) {
        print_r($e);
        if($transaction) $transaction->rollback();
        return false;
    }
}

function getAllDestinos() {
    try {
        
        $destinos = DAOFactory::getDestinoTuristicoDAO()->queryAll();
        
        return $destinos;
        
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

function getDestino($id) {
    try {
        
        $destino = DAOFactory::getDestinoTuristicoDAO()->load($id);
        if($destino->direccionId) {
            $destino->direccion = DAOFactory::getDireccionDAO()->load($destino->direccionId);
        }
        $lugares = DAOFactory::getDestinoLugaresDAO()->queryByDestinoTuristicoId($id);
        $lugares_array = array();
        if(count($lugares)){
            foreach ($lugares as $lugar) {
                $lugares_array[] = $lugar->nombre;
            }
        }
        $destino->lugares = join(',',$lugares_array);

        return $destino;
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

function deleteDestino($id) {
    try {
        
        $transaction = new Transaction();
        
        $destino = DAOFactory::getDestinoTuristicoDAO()->load($id);
        
        $destinos_archivos = DAOFactory::getDestinoArchivoDAO()->queryByDestinoId($id);
        foreach($destinos_archivos as $da) {
            DAOFactory::getDestinoArchivoDAO()->delete($da->id);
            DAOFactory::getArchivoDAO()->delete($da->archivoId);
            
        }
        
        $hoteles = DAOFactory::getHotelDAO()->queryByDestinoId($id);
        foreach ($hoteles as $hotel) {
            $hotel->destinoId = NULL;
            DAOFactory::getHotelDAO()->update($hotel);
        }
        
        DAOFactory::getDestinoTuristicoDAO()->delete($id);
        
        DAOFactory::getDireccionDAO()->delete($destino->direccionId);
        
        $transaction->commit();
        
        return true;
        
    } catch (Exception $e) {
        var_dump($e);
        if($transaction) $transaction->rollback();
        return false;
    }
}

function insertDestinoImage($data = array(), $idDestino) {
    try {
        
        $transaction = new Transaction();
        
        
        $archivo = DAOFactory::getArchivoDAO()->prepare($data);
        $archivo_id = DAOFactory::getArchivoDAO()->insert($archivo);
        
        $destino_archivo = DAOFactory::getDestinoArchivoDAO()->prepare(array(
            'destinoId' => $idDestino,
            'archivoId' => $archivo_id
        ));
        DAOFactory::getDestinoArchivoDAO()->insert($destino_archivo);
        
        $transaction->commit();
        
        return true;
        
    } catch (Exception $e) {
        print_r($e);
        if($transaction) $transaction->rollback();
        return false;
    }
}

function getAllDestinoImages($idDestino) {
    try {
        
        $h_archivos = DAOFactory::getDestinoArchivoDAO()->queryByDestinoId($idDestino);
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

function deleteFotoDestino($id) {
    try {
        $transaction = new Transaction();

        DAOFactory::getDestinoArchivoDAO()->deleteByArchivoId($id);
                
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

function actualizarSEO($id = 0) {
    try {
        
        if($id) {
            
            $hotel = DAOFactory::getHotelDAO()->load($id);
            $hotel->descripciones = json_decode($hotel->descripcionLarga);
            $tituloSeo = $hotel->nombre;
            
            if($hotel->destinoId) {
                $destino = DAOFactory::getDestinoTuristicoDAO()->load($hotel->destinoId);
                $tituloSeo .= ( ' | ' . $destino->nombre);                
            }
            
            
            $descripcionesSeo = array();
            $keywordsSeo = array();
            
            foreach (get_object_vars($hotel->descripciones) as $k=>$value) {
                $endD = (strlen($value) > 150) ? '...' : '';
                $descripcionesSeo[$k] = strip_tags(substr($value, 0, 150)) . $endD;
                $keywordsSeo[$k] = $tituloSeo . ' ' . str_replace('...', '', $descripcionesSeo[$k]);
            }
            
            $hotel->tituloSeo = json_encode(array('es'=> $tituloSeo));
            $hotel->descripcionCorta = json_encode($descripcionesSeo);
            $hotel->keywordsSeo = json_encode($keywordsSeo);
            
            DAOFactory::getHotelDAO()->update($hotel);

        } else {
            $transaction = new Transaction();
            
            $hoteles = DAOFactory::getHotelDAO()->queryAll();
            
            foreach ($hoteles as $hotel) {
                actualizarSeo($hotel->id);
            }
            
            $transaction->commit();
        }
        
        return true;
    } catch (Exception $e) {
        var_dump($e);
        if($transaction) $transaction->rollback();
        return false;
    }
}

function searchDestinos($term) {
    try {
        
        $destinos = DAOFactory::getDestinoTuristicoDAO()->queryByTerm($term);
        
        return $destinos;
        
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

?>