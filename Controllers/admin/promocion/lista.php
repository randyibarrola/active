<?php

$usuario_core->validateUser();

$promociones = getAllPromociones();
$smarty->assign('promociones', $promociones);

$smarty->display('admin/promocion/lista.tpl');

?>