<?php 

$reservas = getAllReservas();

foreach ($reservas as $reserva) {
	foreach ($reserva->productos as $producto) {
		var_dump('inicio before:'.$producto->inicio);
		$producto->inicio = date('Y-m-d', strtotime($producto->inicio)+ 8*60*60);
		var_dump('inicio after:'.$producto->inicio);
		var_dump('final before:'.$producto->final);
		$producto->final = date('Y-m-d', strtotime($producto->final)+ 8*60*60);
		var_dump('final after:'.$producto->final);

		updateReservaProducto($producto);
	}
}

?>