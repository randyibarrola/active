<?php 

$usuario_core->validateUser();
$usuario = $usuario_core->getUsuario();

if($usuario->usuarioGrupoId == 1) {
    $configs = getAllConfiguraciones();
} else if ($usuario->usuarioGrupoId == 3) {
    $configs = getConfiguracionesByDistribuidor($usuario->id);
}

$smarty->assign('configuraciones',$configs);

$smarty->display('admin/configuracion/lista.tpl');
?>