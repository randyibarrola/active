<?php 
require 'Logic/widget.php';
require 'Logic/afiliado.php';
$usuario_core->validateUser();
$usuario_core->hasAdminAccess('widgets');

$afiliado = getAfiliadoByIdUsuario($usuario_core->getUsuario()->id);

$widgets = getWidgets($afiliado->id);
$smarty->assign('widgets', $widgets);
$smarty->assign('afiliado', $afiliado);

$smarty->display('admin/widget/lista.tpl');
?>