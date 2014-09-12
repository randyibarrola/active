<?php 

$usuario_core->validateUser();
$usuario = $usuario_core->getUsuario();
if($usuario->usuarioGrupoId == 1)
    $usuarios = getAllUsuarios(true);
else if($usuario->usuarioGrupoId == 3)
    $usuarios = getAllUsuariosByDistribuidor($usuario->id, true);
else 
    $usuarios = array();

$smarty->assign('usuarios',$usuarios);

$smarty->display('admin/usuario/lista.tpl');
?>