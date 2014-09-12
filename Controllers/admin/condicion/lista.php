<?php 

$usuario_core->validateUser();

$usuario = $usuario_core->getUsuario();
$condiciones = getCondicionesByDistribuidor($usuario->id);

$smarty->assign('condiciones',$condiciones);

$smarty->display('admin/condicion/lista.tpl');
?>