<?php
$logged = $usuario_core->validateUser();

if($logged) {
	$smarty->display('admin/reporte/disponibilidad.tpl');
}
?>