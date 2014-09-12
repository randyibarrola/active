<?php
$logged = $usuario_core->validateUser();

if($logged) {
	$smarty->display('admin/factura/lista.tpl');
}
?>