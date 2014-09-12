<?php



function getAllCondiciones() {
    try {
        
        $condiciones = DAOFactory::getCondicionDAO()->queryAll();
        
        foreach ($condiciones as $condicion) {
            $condicion->nombres = json_decode(trim($condicion->nombre));
            $condicion->descripciones = json_decode(trim($condicion->descripcion));

            if($condicion->condicionCategoriaId)
            $condicion->tipo = DAOFactory::getCondicionCategoriaDAO()->load($condicion->condicionCategoriaId);
        }
        
        return $condiciones;
        
    } catch(Exception $e) {
        return false;
    }
}

function getCondicionesByDistribuidor($usuarioId) {
    try {
        
        $usuario = DAOFactory::getUsuarioDAO()->load($usuarioId);
        
        if($usuario->usuarioGrupoId == 1) return getAllCondiciones();
        
        $condiciones = DAOFactory::getCondicionDAO()->queryByDistribuidorId($usuarioId);
        
        foreach ($condiciones as $condicion) {
            $condicion->nombres = json_decode(trim($condicion->nombre));
            $condicion->descripciones = json_decode(trim($condicion->descripcion));

            if($condicion->condicionCategoriaId)
            $condicion->tipo = DAOFactory::getCondicionCategoriaDAO()->load($condicion->condicionCategoriaId);
        }
        
        return $condiciones;
        
    } catch(Exception $e) {
        return false;
    }
}

function getCondicionById($id) {
    try {
        
        $condicion = DAOFactory::getCondicionDAO()->load($id);
        
        $condicion->nombres = json_decode(trim($condicion->nombre));
        $condicion->descripciones = json_decode(trim($condicion->descripcion));
        
        return $condicion;
        
    } catch(Exception $e) {
        return false;
    }
}

function insertCondicion($data) {
    try {
        
        $data['condicionCategoriaId'] = 2;
        
        $condicion = DAOFactory::getCondicionDAO()->prepare($data);
        
        $condicion_id = DAOFactory::getCondicionDAO()->insert($condicion);
        
        return $condicion_id;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

function updateCondicion($id, $data) {
    try {
        
        $condicion = DAOFactory::getCondicionDAO()->prepare($data, $id);
        
        DAOFactory::getCondicionDAO()->update($condicion);
        
        return $id;
        
    } catch(Exception $e) {
        var_dump($e);
        return false;
    }
}

function deleteCondicion($id, $transactional = true) {
    try {
        
        if($transactional)
            $transaction = new Transaction();
        
        DAOFactory::getHotelCondicionDAO()->deleteByCondicionId($id);
        
        DAOFactory::getCondicionDAO()->delete($id);
        
        if($transactional)
            $transaction->commit();
        
        return $id;
        
    } catch(Exception $e) {
        var_dump($e);
        if($transactional && $transaction)
            $transaction->rollback();
        return false;
    }
}





?>