<?php 

$logged = $usuario_core->validateUser();

if($logged) {
    
    $usuario_core->hasAdminAccess('campania');
    $usuario = $usuario_core->getUsuario();
    /*
    $campanias = getCampaniasByUsuario($usuario->id);
    
    foreach ($campanias as $c) {
        
    }

    $smarty->assign('campanias',$campanias);
    
    $smarty->assign('estadosCampania', array(
        'Pendiente',
        'Creada',
        'Aprobada',
        'Cancelada',
        'Suspendida'
    ));
    
    $destinos = getAllDestinos();
    
    $smarty->assign('destinos', $destinos);*/
    $smarty->assign('estadosCampania', array(
        'Pendiente',
        'Creada',
        'Aprobada',
        'Cancelada',
        'Suspendida'
    ));

    $smarty->display('admin/contrato/lista.tpl');
}
?>