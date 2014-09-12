<?php
	$result = array('msg' => 'error', 'data' => 'Acción no valida');
	$hotel = $_POST['hotel'];
	$domain = generarDominioByNombreHotel($hotel, $smarty->getConfigVariable('sistema_nombre_web'));
	$result['data'] = $domain;
	echo json_encode($result);
?>