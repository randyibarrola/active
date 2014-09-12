<?php 
	$reservas = getAllReservas();
	$reservas_hotel = array();
	$reservas_cliente_positivas = array();
	$reservas_cliente_negativas = array();

	foreach ($reservas as $reserva) {
		$facturar = true;
		switch ($reserva->estado) {
			case 'Stayed':
				$reservas_hotel[$reserva->hotelId][] = $reserva->id;
				$facturar = false;
				break;
			case 'No show':
				$facturar = false;
				break;
			case 'Cancelada por el administrador':
				$facturar = false;
				$id_factura = insertFactura($reserva->hotelId, array($reserva->id), "cobrada", false, date('Y-m-d H:i:s' , strtotime($reserva->tiempoCreacion)), 'usuario');
				insertFactura($reserva->hotelId, array($reserva->id), "cobrada", $id_factura , date('Y-m-d H:i:s' , strtotime($reserva->tiempoCreacion)), 'usuario');
				break;
			default:
				
				break;
		}

		if($facturar) insertFactura($reserva->hotelId, array($reserva->id), "cobrada", false, date('Y-m-d H:i:s' , strtotime($reserva->tiempoCreacion)), 'usuario');
	}

	foreach ($reservas_hotel as $h_k => $r_h) {
		insertFactura($h_k, $r_h, "pendiente de cobro", false, null, 'hotel');
	}
?>