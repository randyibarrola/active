<?php 
	ini_set('max_execution_time', 2000);

	$hoteles = getAllHoteles();
	if($hoteles){
		foreach ($hoteles as $hotel) {
			$dominio_campania = $hotel->dominioCampania;
			$dominio_adwords = str_replace('.'.$smarty->getConfigVariable('sistema_nombre_web'), '.com', trim($dominio_campania)).'-'.$smarty->getConfigVariable('sistema_nombre_web');
			updateHotelSingle($hotel->id, array('adwords' => $dominio_adwords, 'respetarCupo' => 0, 'idioma' => 1));
		}
	}
?>