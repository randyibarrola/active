<?php 

$usuario_core->validateUser();

require_once 'Logic/paises.php';

$empresas = getEmpresasByUsuario($usuario_core->getUsuario()->id, false);

if(isset($_GET["id"])){
    
    $usuario = getUsuario($_GET["id"]);    
    $smarty->assign('usuario',$usuario);
    $smarty->assign('edit',true);
    
    $empresasCliente = getEmpresasByEmpresaUsuarioId($usuario->id, false);
    
    if($empresas && $empresasCliente) {
        foreach ($empresasCliente as $ec) {
            foreach ($empresas as $e) {
                if($e->id == $ec->id) {
                    $e->selected = 1;
                    break;
                }
            }
        }
    }
    
}else{
    $smarty->assign('edit',false);
}

$paises = getPaises();
$smarty->assign('paises', $paises);



$smarty->assign('empresas', $empresas);

$smarty->display('admin/usuario/gestion.tpl');
?>