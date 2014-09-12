<?php 
	$faq = getFaq(1);
	$contenido = json_decode($faq->contenido);
	$smarty->assign("contenido", $contenido->$lang_set);
	$smarty->display('faq.tpl');
?>