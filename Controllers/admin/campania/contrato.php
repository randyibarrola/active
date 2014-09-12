<?php 

$logged = $usuario_core->validateUser();

if($logged) {
    
    $usuario_core->hasAdminAccess('campania');
    $tipoUsuario = $usuario_core->getUsuario()->usuarioGrupoId;
    if($tipoUsuario == 3)
        $distribuidoras = getEmpresasByTipoAndUsuarioId(1, $usuario_core->getUsuario()->id);
    else
        $distribuidoras = getEmpresasByTipo(1);
    
    $smarty->assign('distribuidoras', $distribuidoras);
    
    if(isset($_GET['id'])) {
        $campania = getCampania($_GET['id']);
        if(!$campania->localizador)
            $campania->localizador = generarLocalizador();
        
        if(!$campania->subdominio && $campania->nombreHotel) {
            $campania->subdominio = generarDominioByNombreHotel($campania->nombreHotel);
        }
        
        if(!$campania->email) {
            $campania->email = $usuario_core->getUsuario()->email;
        }
        
        
    } else {
        $campania = new Campania();
        $campania->localizador = generarLocalizador();
    }
    
    
    $smarty->assign('usuario', $usuario_core->getUsuario());
    
    if($campania->periodos) {
        $smarty->assign('edit', true);
    }
    
    
    $campania->porcentajeBeneficio = $distribuidoras[0]->porcentajeBeneficio;
    $smarty->assign('campania', $campania);
    
    $empresas = array();
    $empresasU = getEmpresasByUsuario($usuario_core->getUsuario()->id);
    foreach ($empresasU as $empresa) {
        if($empresa->empresaTipoId == 2)
            $empresas[] = $empresa;
    }
    if(($empresas[0])){
        $empresas[0] = getEmpresaById($empresas[0]->id);
        
        if(!$empresas[0]->contactoNombre || !strlen($empresas[0]->contactoNombre)) {
            $usuario = $usuario_core->getUsuario();
            
            $empresas[0]->contactoNombre = $usuario->nombre;
            $empresas[0]->contactoApellidos = $usuario->apellido;
            $empresas[0]->contactoEmail = $usuario->email;
            $empresas[0]->contactoDni = $usuario->dni;
        }
        
        $smarty->assign('empresas', $empresas);
    }

    $smarty->display('admin/campania/contrato.tpl');
}
?>