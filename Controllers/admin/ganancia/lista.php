<?php 
require 'Logic/afiliado.php';
$usuario_core->validateUser();
$usuario_core->hasAdminAccess('widgets');

$afiliado = getAfiliadoByIdUsuario($usuario_core->getUsuario()->id);
$ganancias_complete = array();
$ganancias = $afiliado->ganancias;

if(count($ganancias)){
	$comision_total = 0.0;
	$counter = 0;
	foreach ($ganancias as $ganancia) {
		$reserva = getReserva($ganancia->reservaId);
		$ganancias_complete[$counter]['reserva'] = $reserva;
		
		if($reserva->estado == 'Confirmada'){
			$ganancias_complete[$counter]['comision'] = '€'.number_format($ganancia->comision, 2, ',', '');	
			$comision_total += $ganancia->comision;
		}else{
			$ganancias_complete[$counter]['comision'] = '€0,0';	
		}
		
		$ganancias_complete[$counter]['porcentaje'] =  $ganancia->porcentaje.'%';
		$counter++;
	}
	$comision_total = 'Total: €'.number_format($comision_total, 2, ',', '');
	$ganancias_complete[$counter]['comision'] = $comision_total;
}

$smarty->assign('ganancias', $ganancias_complete);
$smarty->assign('afiliado', $afiliado);

$smarty->display('admin/ganancia/lista.tpl');
?>