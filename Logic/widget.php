<?php 
function getWidgets($afiliadoId) {
    try {
        $widgets = DAOFactory::getAfiliadoWidgetDAO()->queryByAfiliadoId($afiliadoId);
        return $widgets;
    } catch (Exception $e) {
        return false;
    }
}
function insertWidget($data = array()) {
    try {
        $data["tiempoCreacion"] = date("Y-m-d H:i:s");
        $transaction = new Transaction();

        $widget = DAOFactory::getAfiliadoWidgetDAO()->prepare($data);
        $id = DAOFactory::getAfiliadoWidgetDAO()->insert($widget);
    
        $transaction->commit();

        return $id;
    } catch (Exception $e) {
        var_dump($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}

function updateWidget($idWidget, $data = array()) {
    try {
        $transaction = new Transaction();

        $widget = DAOFactory::getAfiliadoWidgetDAO()->prepare($data, $idWidget);
        DAOFactory::getAfiliadoWidgetDAO()->update($widget);    

        $transaction->commit();

        return $widget;
    } catch (Exception $e) {
    	var_dump($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}
function getWidget($idWidget) {
    try {
        $widget = DAOFactory::getAfiliadoWidgetDAO()->load($idWidget);
        $widget->configuracion = unserialize($widget->configuracion);
        
        return $widget;
    } catch (Exception $e) {
        return false;
    }
}
function deleteWidget($id) {
    try {
        $transaction = new Transaction();
        $result = DAOFactory::getAfiliadoWidgetDAO()->delete($id);
        $transaction->commit();
        return $result;
    } catch (Exception $e) {
        print_r($e);
        if ($transaction)
            $transaction->rollback();
        return false;
    }
}
?>