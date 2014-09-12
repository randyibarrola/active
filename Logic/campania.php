<?php


function getCampania($idCampania) {
    try {
        $campania = DAOFactory::getCampaniaDAO()->load($idCampania);
        $campania->periodos = DAOFactory::getCampaniaPeriodoDAO()->queryByCampaniaId($idCampania);
        
        if($campania->empresaId) $campania->empresa = DAOFactory::getEmpresaDAO()->load($campania->empresaId);
        if($campania->empresaDistribuidoraId) $campania->empresaDistribuidora = DAOFactory::getEmpresaDAO()->load($campania->empresaDistribuidoraId);
        
        return $campania;
        
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

function getCampaniasByUsuario($idUsuario) {
    try {
        
        $usuario = DAOFactory::getUsuarioDAO()->load($idUsuario);
        
        if($usuario->usuarioGrupoId == 1){
            $campanias = DAOFactory::getCampaniaDAO()->queryAll();
        }else if($usuario->usuarioGrupoId == 3){
            $campanias = DAOFactory::getCampaniaDAO()->queryByDistribuidorIdORUsuarioId($idUsuario);
        }else{
            $campanias = DAOFactory::getCampaniaDAO()->queryByUsuarioId($idUsuario);
        }
        
        if($campanias){
            foreach ($campanias as $key => $campania) {
                $campanias[$key]->empresaDistribuidora = DAOFactory::getEmpresaDAO()->load($campania->empresaDistribuidoraId);
                if($campania->estado == 'Aprobada') {
                    $hoteles = getHotelByCampaniaId($campania->id);
                    if($hoteles && count($hoteles))
                        $campanias[$key]->hotel = $hoteles[0];
                } 
            }
        }
        //$campania->periodos = DAOFactory::getCampaniaPeriodoDAO()->queryByCampaniaId($idCampania);
        
        return $campanias;
        
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

function getCampaniasByDestinoAndUsuario($idDestino, $idUsuario) {
    try {
        
        
        $usuario = DAOFactory::getUsuarioDAO()->load($idUsuario);
        
        if($usuario->usuarioGrupoId == 1){
            $campanias = DAOFactory::getCampaniaDAO()->queryByDestinoId($idDestino);
        }else if($usuario->usuarioGrupoId == 3){
            $campanias = DAOFactory::getCampaniaDAO()->queryByDistribuidorIdORUsuarioIdAndDestinoId($idUsuario, $idDestino);
        }else{
            $campanias = DAOFactory::getCampaniaDAO()->queryByUsuarioIdAndDestinoId($idUsuario, $idDestino);
        }
        
        if($campanias){
            foreach ($campanias as $key => $campania) {
                $campanias[$key]->empresaDistribuidora = DAOFactory::getEmpresaDAO()->load($campania->empresaDistribuidoraId);
                if($campania->estado == 'Aprobada') {
                    $hoteles = getHotelByCampaniaId($campania->id);
                    if($hoteles && count($hoteles))
                        $campanias[$key]->hotel = $hoteles[0];
                } 
            }
        }
        //$campania->periodos = DAOFactory::getCampaniaPeriodoDAO()->queryByCampaniaId($idCampania);
        
        return $campanias;
        
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

function updateCampania($idCampania, $data = array(), $periodos = array(),
        $data_empresa = array(), $data_direccion_empresa = array()) {
    try {
        
        $transaction = new Transaction();
        $data['estado'] = 'Creada';
        
        $idDistribuidora = $data['empresaDistribuidoraId'];
        
        $distribuidora = DAOFactory::getEmpresaDAO()->load($idDistribuidora);
        //$data['porcentajeBeneficio'] = $distribuidora->porcentajeBeneficio;
        
        $campania = DAOFactory::getCampaniaDAO()->prepare($data, $idCampania);
        DAOFactory::getCampaniaDAO()->update($campania);
        
        DAOFActory::getCampaniaPeriodoDAO()->deleteByCampaniaId($idCampania);
        
        foreach ($periodos as $p) {
            $p['campaniaId'] = $idCampania;
            $periodo = DAOFactory::getCampaniaPeriodoDAO()->prepare($p);
            DAOFactory::getCampaniaPeriodoDAO()->insert($periodo);
        }
        
        $empresaId = $data['empresaId'];
        
        updateEmpresa($empresaId, $data_empresa, $data_direccion_empresa, false);
        
        $transaction->commit();
        
        return $idCampania;
        
    } catch(Exception $e) {
        var_dump($e);
        if($transaction) $transaction->rollback();
        return false;
    }
}

function insertCampania($data = array(), $periodos = array(),
        $data_empresa = array(), $data_direccion_empresa = array()) {
    try {
        
        $transaction = new Transaction();
        if(!isset($data['estado']))
            $data['estado'] = 'Creada';
        
        $idDistribuidora = $data['empresaDistribuidoraId'];
        
        $distribuidora = DAOFactory::getEmpresaDAO()->load($idDistribuidora);
        //$data['porcentajeBeneficio'] = $distribuidora->porcentajeBeneficio;
        
        $campania = DAOFactory::getCampaniaDAO()->prepare($data);
        $idCampania = DAOFactory::getCampaniaDAO()->insert($campania);
                
        foreach ($periodos as $p) {
            $p['campaniaId'] = $idCampania;
            $periodo = DAOFactory::getCampaniaPeriodoDAO()->prepare($p);
            DAOFactory::getCampaniaPeriodoDAO()->insert($periodo);
        }
        
        $empresaId = $data['empresaId'];
        
        updateEmpresa($empresaId, $data_empresa, $data_direccion_empresa, false);
        
        $transaction->commit();
        
        return $idCampania;
        
    } catch(Exception $e) {
        var_dump($e);
        if($transaction) $transaction->rollback();
        return false;
    }
}

function eliminarCampania($id, $transactional = true) {
    try {
        if($transactional)
        $transaction = new Transaction();
        DAOFactory::getCampaniaPeriodoDAO()->deleteByCampaniaId($id);
        
        
        $hoteles = DAOFactory::getHotelDAO()->queryByCampaniaId($id);
        if($hoteles && count($hoteles))
        foreach ($hoteles as $h) {
            $d = deleteHotel($h->id, false);
            if(!$d) throw new Exception('No se pudo borrar el hotel ' . $h->id);
        }
        DAOFactory::getCampaniaDAO()->delete($id);
        if($transactional)
        $transaction->commit();
        
        return true;
        
    } catch(Exception $e) {
        var_dump($e);
        if($transaction) $transaction->rollback();
        return false;
    }
}

function cambiarEstadoCampania($idCampania, $estado) {
    try {
        
        $transaction = new Transaction();
        $data = array('estado'=> $estado);
        $campania = DAOFactory::getCampaniaDAO()->prepare($data, $idCampania);
        DAOFactory::getCampaniaDAO()->update($campania);
                
        $transaction->commit();
        
        return true;
        
    } catch(Exception $e) {
        var_dump($e);
        if($transaction) $transaction->rollback();
        return false;
    }
}

function updateDominioCampania($idCampania, $dominio) {
    try {
        
        $transaction = new Transaction();
        $data = array('subdominio'=> $dominio);
        $campania = DAOFactory::getCampaniaDAO()->prepare($data, $idCampania);
        DAOFactory::getCampaniaDAO()->update($campania);
                
        $transaction->commit();
        
        return true;
        
    } catch(Exception $e) {
        var_dump($e);
        if($transaction) $transaction->rollback();
        return false;
    }
}

function generarLocalizador($digitos = 4) {
    $loc = uniqid();
    $len = strlen($loc);
    return substr($loc, $len - $digitos - 1, $digitos);
}

function buscarCampanias($term, $usuarioId = 0, $tipo = "hotel") {
    try {
        
        $campanias = DAOFactory::getCampaniaDAO()->queryByTerm($term, $usuarioId, $tipo);
        
        if($usuarioId)
            $configuraciones = getConfiguracionesByDistribuidor($usuarioId); 
        
        foreach ($campanias as $c) {
            $c->promociones = DAOFactory::getCampaniaPeriodoDAO()->queryByCampaniaId($c->id);
            $c->configuraciones = $configuraciones;
            $c->empresa = DAOFactory::getEmpresaDAO()->load($c->empresaId);
        }
        
        return $campanias;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

function getHotelByCampaniaId($id) {
    try {        
        $hoteles = DAOFactory::getHotelDAO()->queryByCampaniaId($id);                
        return $hoteles;        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

function generarDominioByNombreHotel($hotel, $default = "vikahotel.com") {
    try {        
        $h = strtolower(StringUtils::clean($hotel));
        $dominio = $h . '.'.$default;
        $campanias = DAOFactory::getCampaniaDAO()->queryBySubdominio($dominio);
        if(count($campanias)) {
            $dominios = getDominiosLike($h);
            $i = 1;
            foreach ($dominios as $d) {
                $dd = str_replace($h, '', str_replace('.'.$default, '', $d));
                if(is_numeric($dd)) $i = 1 + $dd;
            }
            
            $dominio = $h . $i . '.'.$default;
            
        }
        
        return $dominio;        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

function getDominiosLike($hotel) {
    try {        
        $dominios = DAOFactory::getCampaniaDAO()->getDominiosLike($hotel);                
        return $dominios;        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

function buscarHotelesAndDestinosActivos($term, $nodestinos = false ) {
    try { 
        if($nodestinos) return DAOFactory::getCampaniaDAO()->queryHotelesActivos($term);
        
        $hoteles = DAOFactory::getCampaniaDAO()->queryHotelesActivos($term);
        $dominios = DAOFactory::getCampaniaDAO()->queryDestinosHotelesActivos($term);
        
        return array_merge($hoteles, $dominios);        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

function filtrarCampaniasByDestinoAndUsuario($idUsuario, $idDestino = 0, $args = array()) {
    try {
        $usuario = DAOFactory::getUsuarioDAO()->load($idUsuario);
        $id = ($usuario->usuarioGrupoId == 1) ? 0 : $idUsuario;
        $destinoId = (strlen(trim($idDestino))) ? $idDestino : 0;
        $rows = DAOFactory::getCampaniaDAO()->filterByDestinoAndUsuario($id, $destinoId, $args);
        //print_r($rows);
        return $rows;
        
    } catch (Exception $e) {
        print_r($e);
        return false;
    }
}

?>