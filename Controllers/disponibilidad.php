<?php

if($hotel) {
    if(isset($_REQUEST['inicio'])) {
            setcookie("inicio", $_REQUEST['inicio']);
            $smarty->assign('inicio',$_REQUEST['inicio']);
    }	
    if(isset($_REQUEST['salida'])) {
            setcookie("salida", $_REQUEST['salida']);
            $smarty->assign('salida',$_REQUEST['salida']);
    }

    if($hotel->config->id) {
        $productos = getProductosFullByConfiguracionId($hotel->config->id, 5, true);
        if($productos && is_array($productos) && count($productos)>0){
            $smarty->assign('excursiones', $productos);
        }
    }


    $smarty->assign('active_menu', 'apartamentos');

    $smarty->display('apartamentos.tpl');

} else {
   header('Location: '.$redirect_to);
} 
?>