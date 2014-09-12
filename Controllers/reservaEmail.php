<?php

/*
$reservaId = 276;
$reservacion = getReserva($reservaId);
$reservacion->id = encryptId($reservaId);
$hotel = getHotelById($reserva->hotelId);
print_r($reservacion->cart->apto);
$subject = 'New Booking ' . $hotel->nombres->es . ' [Confirmed]';
$smarty->assign('hotel', $hotel);
$smarty->assign('usuario', get_object_vars($reservacion->usuario));
$apartamento = $reservacion->alojamiento[0];
$smarty->assign('reserva', $reservacion);            
$smarty->assign('entrada', $apartamento->inicio);
$smarty->assign('salida', $apartamento->final);


$noches = ceil((strtotime($apartamento->final) - strtotime($apartamento->inicio))/(24*60*60));
$smarty->assign('noches', $noches);
if($hotel && $hotel->campaniaId){
    $campania = getCampania($hotel->campaniaId);
    $smarty->assign('campania',$campania); 
}
if($reservacion->idiomaId) {
    $smarty->configLoad($reservacion->idioma->codigo . '.conf');
}
$smarty->display('reservaEmail_nodesign.tpl');*/

$reserva = getReserva(432);
$hotel = getHotelById($reserva->hotelId);
$reserva->id = encryptId($reserva->id);
generarFactura($reserva, $hotel);


?>