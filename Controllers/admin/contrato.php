<?php 
	$months = array ("", "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
	$month_now = date ("n");

	$smarty->assign('mes', $months[$month_now]);
	$smarty->assign('dia', date('d'));
	$smarty->assign('ciudad', $_POST['ciudad']);
	$smarty->assign('cif', $_POST['cif']);
	$smarty->assign('nif', $_POST['nif']);
	$smarty->assign('apellido', $_POST['apellido']);
	$smarty->assign('empresa', $_POST['empresa']);
	$smarty->assign('nombre', $_POST['nombre']);
	$smarty->assign('hotel', $_POST['hotel']);
	$smarty->assign('direccion', $_POST['direccion']);
	
	$smarty->assign('comision', isset($_GET['comision'])?$_GET['comision']:15);

	$smarty->display('admin/contrato.tpl');
?>