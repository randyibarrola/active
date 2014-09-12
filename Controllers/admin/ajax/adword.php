<?php

$action = $_POST['action'];

$result = array('msg' => 'error', 'data' => 'Acción no valida');


if(strcmp($action, 'update') == 0) {
    $data = array(
        'nombreCampania' => NULL,
        'presupuesto' => 0,
        'inicio' => NULL,
        'fin' => NULL,
        'palabrasClave' => NULL
    );
    
    foreach ($data as $k=>$val) {
        if(isset($_POST[$k])) {
            $data[$k] = $_POST[$k];
        }
    }
    
    if($data['inicio'] && strlen($data['inicio'])) {
        $f = explode('/', $data['inicio']);
        $f = implode('-', array_reverse($f));
        $data['inicio'] = $f;
    }
    
    if($data['fin'] && strlen($data['fin'])) {
        $f = explode('/', $data['fin']);
        $f = implode('-', array_reverse($f));
        $data['fin'] = $f;
    }
    
    $paises = array();
    if(isset($_POST['paises']))
        $paises = $_POST['paises'];
    
    if(isset($_POST['idAdword'])) {
        $id = updateAdword($_POST['idAdword'], $data, $paises);
    } else {
        $id = insertAdword($data, $paises);
    }
    
    if($id) {
        $result = array(
            'msg' => 'ok',
            'data' => 'Se guardaron los datos correctamente'
        );
    } else {
        $result['data'] = 'No se guardaron los datos correctamente';
    }
}

if(strcmp($action, 'buscar') == 0) {

    $args = $_POST;
    
    $adwords = getAdwordsByArgs($args);
    
    $c = countAdwordsByArgs($args);
    
    $result = array(
        "iTotalRecords"=> $c,
        "iTotalDisplayRecords"=> $c,
        'aaData' => $adwords
    );
}

if(strcmp($action, 'search') == 0) {

    $term = $_POST['term'];
    
    $adwords = getAdwordsByNombreCampania($term);
    
    $result = array(
        'msg' => 'ok',
        'lista' => $adwords
    );
}

echo json_encode($result);

?>