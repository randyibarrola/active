<?php

$server = new nusoap_server();
$server->configureWSDL('hoteles', 'urn:hoteles');
$server->wsdl->schemaTargetNamespace = 'urn:hoteles';
$server->register("findHotelesDestinos",
        array('params'=>'xsd:Array'),
        array('return'=>'xsd:Array'));
$server->register("searchHoteles",
        array('params'=>'xsd:Array'),
        array('return'=>'xsd:Array'));

$HTTP_RAW_POST_DATA = (isset($HTTP_RAW_POST_DATA))? $HTTP_RAW_POST_DATA : '';
$server->service($HTTP_RAW_POST_DATA);

function findHotelesDestinos($params = array()) {
    $result = array('result' => 'error', 'msg' => '', 'data' => null);
    
    $term = $params['term'];
    $resultados = buscarHotelesAndDestinosActivos($term);
    
    $result = array(
        'result' => 'ok',
        'data' => $resultados
    );
    
    return json_encode($result);
}

function searchHoteles($params = array()) {
    $result = array('result' => 'error', 'msg' => '', 'data' => null);
    
    $term = $params['term'];
    $start = 0;
    if(isset($params['start']))
        $start = intval($params['start']);
    
    $hotelId = 0;
    if(isset($params['hotelId']))
        $hotelId = $params['hotelId'];
    
    $itemsByPage = 10;
    if(isset($params['itemsByPage']))
        $itemsByPage = intval($params['itemsByPage']);
    
    $hoteles = getHotelesCampaniasActivas($term, ((isset($params['paginar_otros'])) ? 0 : $start), $itemsByPage, $hotelId);
    
    if(count($hoteles) == 4) {
        foreach ($hoteles as $hotel) {
            
            if($hotel['nombre'] == $term && $hotel['destino']['nombre']) {
                $un_hotel = $hotel;
                break;
                
                
            }
        }
    }
    
    if(isset($un_hotel))
        $hoteles = getHotelesCampaniasActivas($un_hotel['destino']['nombre'], $start, $itemsByPage, $un_hotel['id']);
    
    
    $result = array(
        'result' => 'ok',
        'hoteles' => $hoteles
    );
    
    if($un_hotel)
        $result['un_hotel'] = $un_hotel;
        
    return json_encode($result);
}


?>