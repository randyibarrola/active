<?php 

$usuario_core->validateUser();

$hoteles = getAllHoteles();

$smarty->assign('hoteles',$hoteles);

$smarty->display('admin/home.tpl');
?>