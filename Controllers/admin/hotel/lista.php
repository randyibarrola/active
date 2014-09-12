<?php 

$logged = $usuario_core->validateUser();

if($logged) {
    
    $usuario_core->hasAdminAccess('hotel');
    $usuario = $usuario_core->getUsuario();
    
    actualizarSeo();
    /*
    $hoteles = getHotelesByUsuario($usuario->id);
    
    $hs = array();
    foreach ($hoteles as $hotel) {
        if($hotel->campania->estado == 'Aprobada')
            $hs[] = $hotel;
    }
    
    $destinos = getAllDestinos();
    
    $smarty->assign('destinos', $destinos);

    $smarty->assign('hoteles',$hs);
    */
    $smarty->display('admin/hotel/lista.tpl');
}
?>