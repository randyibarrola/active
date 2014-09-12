<?php
function insertConfiguracion($data_configuracion = array(), $data_reglas = array(), $productos = array()) {
    try {
        	
        $transaction = new Transaction();

        $config = DAOFactory::getConfiguracionDAO()->prepare($data_configuracion);
        $config_id = DAOFactory::getConfiguracionDAO()->insert($config);
        
        if(count($data_reglas)) {
            foreach ($data_reglas as $data_regla) {
                $data_regla['configuracionId'] = $config_id;
                $regla = DAOFactory::getReglasCuponesDAO()->prepare($data_regla);
                $id_regla = DAOFactory::getReglasCuponesDAO()->insert($regla);

                if(is_numeric($data_regla['cupones']) && $data_regla['cupones']>0){
                    for($i=0;$i < $data_regla['cupones'];$i++){
                        $codigo = generarLocalizador();
                        $cupon = DAOFactory::getCuponDAO()->prepare(array(
                            'codigo' => strtoupper($codigo),
                            'estado' => 'activo',
                            'reglasCuponesId' => $id_regla
                        ));
                        $id_cupon = DAOFactory::getCuponDAO()->insert($cupon);
                    }
                }
            }
        }

        if(count($productos)){
            foreach ($productos as $producto) {
                $producto = DAOFactory::getConfiguracionEventoDAO()->prepare(array("configuracionId" => $config_id, "eventoId"=>$producto));
                DAOFactory::getConfiguracionEventoDAO()->insert($producto);
            }
        }
        
        $transaction->commit();

        return $config_id;
    } catch (Exception $e) {
        var_dump($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}




function updateConfiguracion($idConfiguracion,  
        $data_configuracion = array(), $data_reglas = array(), $productos = array(), $favoritos = array()) {
    try {
        $transaction = new Transaction();

        $config = DAOFactory::getConfiguracionDAO()->prepare($data_configuracion, $idConfiguracion);
        DAOFactory::getConfiguracionDAO()->update($config);
        
        if(count($data_reglas)) {
            $reglas_keys = array();
            
            foreach ($data_reglas as $data_regla) {
                $data_regla['configuracionId'] = $idConfiguracion;
                $regla = DAOFactory::getReglasCuponesDAO()->prepare($data_regla);
                $reglas_keys[] = $data_regla['id'];

                if(is_numeric($data_regla['id'])){
                    $reglas_keys[] = $data_regla['id'];
                    $id_regla = DAOFactory::getReglasCuponesDAO()->update($regla);
                }else{
                    $id_regla = DAOFactory::getReglasCuponesDAO()->insert($regla);
                    $reglas_keys[] = $id_regla;
                    if(is_numeric($data_regla['cupones']) && $data_regla['cupones']>0){
                        for($i=0;$i< $data_regla['cupones'];$i++){
                            $codigo = generarLocalizador();
                            $cupon = DAOFactory::getCuponDAO()->prepare(array(
                                'codigo' => strtoupper($codigo),
                                'estado' => 'activo',
                                'reglasCuponesId' => $id_regla
                            ));
                            $id_cupon = DAOFactory::getCuponDAO()->insert($cupon);

                        }
                    }
                }
            }
            
            $reglas = DAOFactory::getReglasCuponesDAO()->queryByConfiguracionId($idConfiguracion);

            foreach ($reglas as $r) {
                if(!in_array($r->id, $reglas_keys)){
                    DAOFactory::getCuponDAO()->deleteByReglasCuponesId($r->id);
                    DAOFactory::getReglasCuponesDAO()->delete($r->id);
                }
            }
        }

        DAOFactory::getConfiguracionEventoDAO()->deleteByConfiguracionId($idConfiguracion);
        
        if(count($productos)){
            foreach ($productos as $producto) {
                $favorito = 0;
                if(in_array($producto, $favoritos)) $favorito = 1;
                $producto = DAOFactory::getConfiguracionEventoDAO()->prepare(array("configuracionId" => $idConfiguracion, "eventoId"=>$producto, "favorito" => $favorito));
                DAOFactory::getConfiguracionEventoDAO()->insert($producto);
            }
        }
        
        $transaction->commit();

        return $idConfiguracion;
    } catch (Exception $e) {
        print_r($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function deleteConfiguracion($idConfiguracion, $transactional = true) {
    try {
        if($transactional)
            $transaction = new Transaction();
        
        $hoteles = DAOFactory::getHotelDAO()->queryByConfiguracionId($idConfiguracion);
        
        foreach ($hoteles as $h) {
            $hotel = DAOFactory::getHotelDAO()->prepare(array('configuracionId' => NULL), $h->id);
            DAOFactory::getHotelDAO()->update($hotel);
        }

        $reglas = DAOFactory::getReglasCuponesDAO()->queryByConfiguracionId($id);
        if(count($reglas)){
            foreach ($reglas as $r_k => $regla) {
                DAOFactory::getCuponDAO()->deleteByReglasCuponesId($regla->id);
            }
        }
        
        DAOFactory::getReglasCuponesDAO()->deleteByConfiguracionId($idConfiguracion);
        DAOFactory::getConfiguracionDAO()->delete($idConfiguracion);
        
        if($transactional)
            $transaction->commit();

        return true;
    } catch (Exception $e) {
        print_r($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function getConfiguracionById($id) {
    try {
        $config = DAOFactory::getConfiguracionDAO()->load($id);
        $reglas = DAOFactory::getReglasCuponesDAO()->queryByConfiguracionIdMontoAsc($id);
        
        if(count($reglas)){
            foreach ($reglas as $r_k => $regla) {
                $reglas[$r_k]->cupones = DAOFactory::getCuponDAO()->queryByReglasCuponesId($regla->id);
            }
        }
        $config->reglas = $reglas;
        
        return $config;
        
    } catch(Exception $e) {
        return false;
    }
}

function getCuponesByRegla($id){
    try {
        $cupones = DAOFactory::getCuponDAO()->queryByReglasCuponesId($id);
        return $cupones;
    } catch(Exception $e) {
        return false;
    }
}

function getCuponByCodigo($codigo){
    try {
        $cupon = DAOFactory::getCuponDAO()->queryByCodigo($codigo);
        return array_pop($cupon);
    } catch(Exception $e) {
        return false;
    }
}

function getProductosByConfiguracion($id) {
    try {
        $productos = DAOFactory::getConfiguracionEventoDAO()->queryByConfiguracionId($id);
        return $productos;
        
    } catch(Exception $e) {
        return false;
    }
}


function getAllConfiguraciones() {
    try {
        
        $configs = DAOFactory::getConfiguracionDAO()->queryAll();
        
        return $configs;
        
    } catch(Exception $e) {
        return false;
    }
}

function getRegla($id){
     try {
        return DAOFactory::getReglasCuponesDAO()->load($id);
    } catch(Exception $e) {
        return false;
    }
}

function getConfiguracionesByDistribuidor($usuarioId) {
    try {
        $configs = DAOFactory::getConfiguracionDAO()->queryByUsuarioId($usuarioId);
        return $configs;
    } catch(Exception $e) {
        return false;
    }
}

function getConfiguracionesByCampania($campaniaId) {
    try {
        $configs = DAOFactory::getConfiguracionDAO()->queryByCampaniaId($campaniaId);
        return $configs;
    } catch(Exception $e) {
        return false;
    }
}
?>