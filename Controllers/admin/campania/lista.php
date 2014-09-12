<?php 

$logged = $usuario_core->validateUser();

if($logged) {
    
    $usuario_core->hasAdminAccess('campania');
    $usuario = $usuario_core->getUsuario();
    
    $campanias = getCampaniasByUsuario($usuario->id);

    $smarty->assign('campanias',$campanias);

    $smarty->display('admin/campania/lista.tpl');
}
?>