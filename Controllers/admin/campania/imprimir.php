<?php 

$id = $_GET['id'];
$campania = getCampania($id);
$smarty->assign('campania', $campania);

$smarty->display('admin/campania/imprimir.tpl');

?>