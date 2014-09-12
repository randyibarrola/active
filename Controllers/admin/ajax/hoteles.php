<?php

$result = array('msg' => 'error', 'data' => 'Acción no valida');

$action = $_POST['action'];

if(strcmp($action, 'search') == 0) {
    $term = $_POST['term'];
    $resultados = buscarHotelesAndDestinosActivos($term, $_POST['nodestinos']);
    
    $result = array(
        'msg' => 'ok',
        'lista' => $resultados
    );
    
}

if(strcmp($action, 'filter') == 0) {
    $term = $_POST['term'];
    $start = $_POST['start'];
    
    $hotelId = 0;
    if(isset($_POST['hotelId']))
        $hotelId = $_POST['hotelId'];
    
    $hoteles = getHotelesCampaniasActivas($term, ((isset($_POST['paginar_otros'])) ? 0 : $start), 10, $hotelId, $_POST);
    
    if(count($hoteles) == 4) {
        foreach ($hoteles as $hotel) {
            
            if($hotel['nombre'] == $term && $hotel['destino']['nombre']) {
                $un_hotel = $hotel;
                $smarty->assign('un_hotel', $un_hotel);
                break;
                
                
            }
        }
    }
    
    if(isset($un_hotel))
        $hoteles = getHotelesCampaniasActivas($un_hotel['destino']['nombre'], $start, 10, $un_hotel['id'], $_POST);
    
    
    
    $smarty->assign('hoteles', $hoteles);
    
    $html = $smarty->fetch('admin/hoteles_filtros.tpl');
    
    $result = array(
        'msg' => 'ok',
        'html' => $html,
        'hoteles' => $hoteles
    );
    
    if(!isset($_POST['paginar_otros']) && !$start) {
        $locations = getLocationsHotelesCampaniasActivas($term);
        $result['locations'] = $locations;
    }
}

if(strcmp($action, 'informacionMapa') == 0) {
    $id = $_POST['id'];
    $hotel = getHotelById($id);
    $smarty->assign('hotel', $hotel);
    $html = $smarty->fetch('admin/hotel_info.tpl');
    
    $result = array(
        'msg' => 'ok',
        'html' => $html
    );
    
}

echo json_encode($result);

?>