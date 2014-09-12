<?php

$action = $_POST['action'];

$result = array('msg' => 'error', 'data' => 'Acción no valida');

if (strcmp($action, 'buscar') == 0) {
    
    $args = $_POST;
    
    $rows = filtrarDisponibilidades($args);
    
    $cont = contarDisponibilidades($args);
    
    $result = array(
        "iTotalRecords"=> $cont,
        "iTotalDisplayRecords"=> $cont,
        'aaData' => $rows
    );
    
}

echo json_encode($result);

?>