<?php 

$logged = $usuario_core->validateUser();

if($logged) {
    
    $usuario_core->hasAdminAccess('campania');
    
    
    $campania = getCampania($_GET['id']);
    $smarty->assign('campania', $campania);
    

    $smarty->display('admin/contrato/ver.tpl');
}
?>