<?php 

$logged = $usuario_core->validateUser();

if($logged) {
    
    $usuario_core->hasAdminAccess('empresa');
    
    $empresas = getEmpresasByUsuario($usuario_core->getUsuario()->id);
    
    $smarty->assign('empresas',$empresas);

    $smarty->display('admin/empresa/lista.tpl');
}
?>