<?php

if($hotel) {
    if($hotel->config->id) {
        $productos = getProductosFullByConfiguracionId($hotel->config->id, 5, true);
        if($productos && is_array($productos) && count($productos)>0){
            $smarty->assign('excursiones', $productos);
        }
    }
    
    $asuntos = array(
        'Disponibilidad_y_tarifas',
        'Reservas',
        'Informacion_general_del_hotel',
        'Sugerencias',
        'Otros'
    );
    
    $smarty->assign('asuntos', $asuntos);

    $smarty->assign('active_menu', 'contacto');

    $smarty->display('contacto.tpl');
        
} else {
   header('Location: '.$redirect_to);
}
?>