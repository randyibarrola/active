<?php 

$logged = $usuario_core->validateUser();

if($logged) {
    
    $usuario_core->hasAdminAccess('empresa');
    
    if(isset($_GET["id"])){

        $empresas = getEmpresasByUsuario($usuario_core->getUsuario()->id);
        
        $access = false;
        
        foreach ($empresas as $empresa)
            if($empresa->id == $_GET['id']) {
                $access = true;
                break;
            }
        
        if(!$access)
            header ('Location:' . $base_url . '/admin-empresa-lista');
        $empresa = getEmpresaById($_GET["id"]);
        $propietario = getEmpresasPropietario($_GET["id"]);
        
        $smarty->assign('propietario',$propietario);
        $smarty->assign('empresa',$empresa);
        $smarty->assign('edit',true);
    }else{
        $smarty->assign('edit',false);
    }

    $smarty->assign('usuario',$usuario_core->getUsuario());

    $empresa_tipos = getAllEmpresaTipos();

    $smarty->assign('empresa_tipos', $empresa_tipos);

    $distribuidoras = getEmpresasByTipo(1);
    $smarty->assign('distribuidoras', $distribuidoras);

    $smarty->display('admin/empresa/gestion.tpl');
}
?>