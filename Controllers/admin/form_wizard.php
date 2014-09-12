<?php

$logged = $usuario_core->validateUser();

if($logged) {
    
    $usuario = $usuario_core->getUsuario();
    
    if(strcmp(strtolower($usuario->status), 'activado') == 0) {
    
        $idiomas = getAllIdiomas();
        $monedas = getAllMonedas();

        $smarty->assign('idiomas', $idiomas);
        $smarty->assign('monedas', $monedas);

        $empresas = getEmpresasByUsuario($usuario->id);

        if($empresas) {
            $empresa = $empresas[0];
            $empresa->direccion = getDireccion($empresa->direccionId);
            $smarty->assign('empresa', $empresa);
        }

        $smarty->display('admin/form_wizard.tpl');
    } else {
    
        header('Location:'.$base_url.'/admin-hotel-lista');
    }
    
}

?>