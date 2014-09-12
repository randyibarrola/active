<?php

$results = array('msg' => 'error', 'data' => '');

if(isset($_POST['id'])) {
    $excursionId = $_POST['id'];
    
    $client = new nusoap_client($service_url."/soap-evento");
    $distribuidor = getParametrosVikaByHotelId($hotel->id);
    $params = $distribuidor;
    $params['id'] = $excursionId;
    $client->debug_flag = true;
    $result = $client->call('get', array('params' => $params));    
    $result = json_decode($result);
    $excursion = $result->data;
    if(isset($_GET['m']) && strcmp($_GET['m'], 'EUR') != 0) {
        $excursion->precio->precio = convertFromMonedaToMoneda($excursion->precio->precio, 'EUR', $_GET['m']);
        $smarty->assign('currency', getMonedaByCodigo($_GET['m'])->simbolo);
    }
    
    $smarty->assign('excursion', $excursion);
    $html = $smarty->fetch('detalle.tpl');
    
    $results['msg'] = 'ok';
    $results['html'] = $html;
}

echo json_encode($results);

?>