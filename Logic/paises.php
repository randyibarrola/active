<?php



function getPaises() {
    try {
        
        $paises = DAOFactory::getPaisDAO()->queryAll();
        
        
        return $paises;
        
    } catch(Exception $e) {
        return false;
    }
}

function getPais($id) {
    try {
        
        $pais = DAOFactory::getPaisDAO()->load($id);
        
        
        return $pais;
        
    } catch(Exception $e) {
        return false;
    }
}

function getPaisByCodigo($codigo) {
    try {
        
        $paises = DAOFactory::getPaisDAO()->queryByIso2($codigo);
        if($paises && count($paises))
            return $paises[0];
        
        return false;
        
    } catch(Exception $e) {
        return false;
    }
}

function getPaisesAdwords() {
    try {
        
        $nombres = array(
            'España',
            'Italia',
            'Alemania',
            'Reino Unido', 
            'Rusia',
            'Portugal',
            'Francia',
            'Holanda',
            'Polonia',
            'Bélgica',
            'Dinamarca',
            'Croacia',
            'Irlanda',
        );
        
        $paises = array();
        
        foreach ($nombres as $n) {
            $p = DAOFactory::getPaisDAO()->queryByNombre($n);
            if($p && count($p))
                $paises[] = $p[0];
        }
        
        return $paises;
        
    } catch (Exception $e) {
        var_dump($e);
        return false;
    }
}

?>