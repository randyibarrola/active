<?php

if($hotel) {
    if(strlen($hotel->lugares)){
        $lugares = explode(',', $hotel->lugares);
        $smarty->assign("lugares", $lugares);
    }else{
        $smarty->assign("lugares", false);
    }
    $himages = getAllHotelImages($hotel->id, true);
    
    $images = array();
    
    foreach ($himages as $image) {
        if($image->nombre && strlen(trim($image->nombre)))
            array_unshift ($images, $image);
        else
            array_push ($images, $image);
    }
    
    
    
    $smarty->assign('images',$images);
    
    if($hotel->destinoId) {
        $imagesDestino = getAllDestinoImages($hotel->destinoId);
        $smarty->assign('imagesDestino',$imagesDestino);
    }
    
    $servicios = getAllHotelServicios($hotel->id);
    
    $smarty->assign('servicios',$servicios);
    
    $condiciones = getAllHotelCondiciones($hotel->id);
    $smarty->assign('condiciones',$condiciones);

    if($hotel->config->id) {
        $productos = getProductosFullByConfiguracionId($hotel->config->id, 5, true);
        if($productos && is_array($productos) && count($productos)>0){
            $smarty->assign('excursiones', $productos);
        }
        /*$params = getParametrosVikaByHotelId($hotel->id);

        if($params) {
            $client = new nusoap_client($service_url."/soap-evento");

            $client->debug_flag = true;
            $result = $client->call('excursiones', array('params' => $params));

            $result = json_decode($result);

            $excursiones = $result->data;

            $destacados = array();
            if($excursiones && count($excursiones))
                foreach ($excursiones as $exc) {
                    if($exc->destacado) {
                        array_push($destacados, $exc);
                    }
                }

            $smarty->assign('excursiones', $destacados);
        }*/
    }



$smarty->assign('active_menu', 'home');

$smarty->display('home.tpl');

} else {
   header('Location: '.$redirect_to);
}
?>