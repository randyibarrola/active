<?php 
require 'Logic/afiliado.php';
$usuario_core->validateUser();
$usuario_core->hasAdminAccess('afiliados');

$afiliados = getAfiliados();

$smarty->assign('afiliados',$afiliados);

$smarty->display('admin/afiliado/lista.tpl');
?>