<?php 
$logged = $usuario_core->validateUser();

if($logged) {
	$faq = getFaq(1);
	$smarty->assign('faq', $faq);
	$smarty->display('admin/faq/gestion.tpl');
}
?>