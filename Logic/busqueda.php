<?php

function insertBusquedaDisponibilidad($data) {
    try {
        
        $transaction = new Transaction();
        
        
        $busqueda = DAOFactory::getBusquedaDisponibilidadDAO()->prepare($data);
        $id = DAOFactory::getBusquedaDisponibilidadDAO()->insert($busqueda);
        
        $transaction->commit();
        
        return $id;
        
    } catch (Exception $e) {
        var_dump($e);
        if($transaction) $transaction->rollback();
        return false;
    }
    
}

function filtrarDisponibilidades($args = array()) {
    try {
        
        $rows = DAOFactory::getBusquedaDisponibilidadDAO()->queryByArgs($args);
        foreach ($rows as $pos=>$row) {
            if($row['tiempo_creacion']) {
                $rows[$pos]['tiempo_creacion'] = date('d/m/Y H:i', strtotime($row['tiempo_creacion']));
            }
            if($row['inicio']) {
                $rows[$pos]['inicio'] = date('d/m/Y', strtotime($row['inicio']));
            }
            if($row['fin']) {
                $rows[$pos]['fin'] = date('d/m/Y', strtotime($row['fin']));
            }
        }
        return $rows;
        
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
    
}

function contarDisponibilidades($args = array()) {
    try {
        
        $rows = DAOFactory::getBusquedaDisponibilidadDAO()->countByArgs($args);
        
        return $rows[0][0];
        
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
    
}

?>