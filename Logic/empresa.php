<?php



function getAllEmpresas() {
    try {
        
        $empresas = DAOFactory::getEmpresaDAO()->queryAll();
        
        foreach ($empresas as $empresa) {
            $empresa->hoteles = count(DAOFactory::getHotelDAO()->queryByEmpresaId($empresa->id));
            $empresa->tipo = DAOFactory::getEmpresaTipoDAO()->load($empresa->empresaTipoId);
        }
        
        return $empresas;
        
    } catch(Exception $e) {
        return false;
    }
}

function getEmpresaById($id) {
    try {
        
        $empresa = DAOFactory::getEmpresaDAO()->load($id);
        
        if($empresa->direccionId) $empresa->direccion = DAOFactory::getDireccionDAO()->load($empresa->direccionId);
        
        
        return $empresa;
        
    } catch(Exception $e) {
        return false;
    }
}

function getEmpresasPropietario($idEmpresa){
    try {
        
        $usuario_empresa = DAOFactory::getUsuarioEmpresaDAO()->queryByEmpresaId($idEmpresa);
        
        if($usuario_empresa && count($usuario_empresa)>0){
            return DAOFactory::getUsuarioDAO()->load($usuario_empresa[0]->usuarioId);
        }else{
            return false;
        }
        
    } catch(Exception $e) {
        return false;
    }
}

function getEmpresasByUsuario($id, $allData = true) {
    try {
        
        $usuario = DAOFactory::getUsuarioDAO()->load($id);
        
        if($usuario->usuarioGrupoId == 1)
            return getAllEmpresas();
        
        $empresas = DAOFactory::getEmpresaDAO()->queryByUsuarioId($id);
        
        if($allData)
        foreach ($empresas as $empresa) {
            $empresa->hoteles = count(DAOFactory::getHotelDAO()->queryByEmpresaId($empresa->id));
            $empresa->tipo = DAOFactory::getEmpresaTipoDAO()->load($empresa->empresaTipoId);
        }
        
        return $empresas;
        
    } catch(Exception $e) {
        print_r($e);
        return false;
    }
}

function getEmpresasByEmpresaUsuarioId($idUsuario, $allData = true) {
    try {
        
        $empresas = DAOFactory::getEmpresaDAO()->queryByEmpresaUsuarioId($idUsuario);
        
        if($allData)
        foreach ($empresas as $empresa) {
            $empresa->hoteles = count(DAOFactory::getHotelDAO()->queryByEmpresaId($empresa->id));
            $empresa->tipo = DAOFactory::getEmpresaTipoDAO()->load($empresa->empresaTipoId);
        }
        
        return $empresas;
        
    } catch(Exception $e) {
        print_r($e);
        return false;
    }
}

function insertEmpresa($data = array(), $data_direccion = array(), $idUsuario = 0) {
    try {
        	
        $transaction = new Transaction();
        
        $direccion = DAOFactory::getDireccionDAO()->prepare($data_direccion);
        $id_direccion = DAOFactory::getDireccionDAO()->insert($direccion);
        
        $data['direccionId'] = $id_direccion;

        $empresa = DAOFactory::getEmpresaDAO()->prepare($data);
        $empresa_id = DAOFactory::getEmpresaDAO()->insert($empresa);
        
        if($idUsuario) {
            $usuario = DAOFactory::getUsuarioDAO()->load($idUsuario);
            
            //if($usuario->usuarioGrupoId == 2) {
            
            if(true){
                $ue = DAOFactory::getUsuarioEmpresaDAO()->prepare(array('empresaId'=>$empresa_id, 'usuarioId'=>$idUsuario));
                DAOFactory::getUsuarioEmpresaDAO()->insert($ue);
            }
        }
        
        

        $transaction->commit();

        return $empresa_id;
    } catch (Exception $e) {
        var_dump($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function updateEmpresa($id, $data = array(), $data_direccion = array(), $trasactional = true) {
    try {
        if($trasactional)	
        $transaction = new Transaction();
        
        $empresa = getEmpresaById($id);
            
        if($empresa->direccionId) {
            $direccion = DAOFactory::getDireccionDAO()->prepare($data_direccion, $empresa->direccionId);
            DAOFactory::getDireccionDAO()->update($direccion);
        } else {
            $direccion = DAOFactory::getDireccionDAO()->prepare($data_direccion);
            $id_direccion = DAOFactory::getDireccionDAO()->insert($direccion);
            $data['direccionId'] = $id_direccion;
        }
        
        $empresa = DAOFactory::getEmpresaDAO()->prepare($data, $id);
        DAOFactory::getEmpresaDAO()->update($empresa);
        
        

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

function updateEmpresaData($id, $data = array()) {
    try {
        if($trasactional)	
        $transaction = new Transaction();
        
        $empresa = DAOFactory::getEmpresaDAO()->prepare($data, $id);
        DAOFactory::getEmpresaDAO()->update($empresa);
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

function deleteEmpresa($idEmpresa, $transactional = true) {
    try {
        if($transactional)
        $transaction = new Transaction();
        
        $empresa = DAOFactory::getEmpresaDAO()->load($idEmpresa);
        
        $hoteles = DAOFactory::getHotelDAO()->queryByEmpresaId($idEmpresa);
        
        if($hoteles)
            foreach ($hoteles as $hotel) {
                $el = deleteHotel($hotel->id, false);
                if(!$el) throw new Exception ('No se pudo eliminar el hotel');
            }
            
        $campanias = DAOFactory::getCampaniaDAO()->queryByEmpresaId($idEmpresa);
        if($campanias && count($campanias)) {
            foreach ($campanias as $c) {
                $d = eliminarCampania($c->id, false);
                if(!$d) throw new Exception('No se pudo borrar la campaña ' . $c->id);
            }
        }
        
        $campanias = DAOFactory::getCampaniaDAO()->queryByEmpresaDistribuidoraId($idEmpresa);
        if($campanias && count($campanias)) {
            foreach ($campanias as $c) {
                $d = eliminarCampania($c->id, false);
                if(!$d) throw new Exception('No se pudo borrar la campaña ' . $c->id);
            }
        }
        
        DAOFactory::getUsuarioEmpresaDAO()->deleteByEmpresaId($idEmpresa);
        
        DAOFactory::getEmpresaDAO()->delete($idEmpresa);
        
        DAOFactory::getDireccionDAO()->delete($empresa->direccionId);

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

function getEmpresasByTipo($tipo) {
    try {
        
        $empresas = DAOFactory::getEmpresaDAO()->queryByEmpresaTipoId($tipo);
        
        foreach ($empresas as $empresa) {
            $empresa->hoteles = count(DAOFactory::getHotelDAO()->queryByEmpresaId($empresa->id));
            
        }
        
        return $empresas;
        
    } catch(Exception $e) {
        return false;
    }
}




function getEmpresasByTipoAndUsuarioId($tipo, $usuarioId) {
    try {
        
        $empresas = DAOFactory::getEmpresaDAO()->queryByUsuarioId($usuarioId);
        $emps = array();
        foreach ($empresas as $empresa) {
            if($empresa->empresaTipoId == $tipo)
                $emps[] = $empresa;            
        }
        
        return $emps;
        
    } catch(Exception $e) {
        return false;
    }
}

?>