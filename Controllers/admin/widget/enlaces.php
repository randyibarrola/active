<?php 
require 'Logic/afiliado.php';
require 'Logic/widget.php';
$usuario_core->validateUser();
$afiliado = getAfiliadoByIdUsuario($usuario_core->getUsuario()->id);

$afiliado_id = $afiliado->id;
$afiliado_id_encriptado = urlencode(Encrypter::encrypt($afiliado_id, 'afiliado'));

$hoteles = $afiliado->hoteles;
$enlaces = array();

if(count($hoteles)){
	foreach ($hoteles as $hotel_h) {
		$h = getSimpleHotel($hotel_h->hotelId);
		
		$h->enlace = 'http://'.$h->dominioCampania.'?a='.$afiliado_id_encriptado;
		$enlaces[] = $h;
	}
}

$smarty->assign("enlaces", $enlaces);
$smarty->assign('afiliado', $afiliado);

$smarty->display('admin/widget/enlaces.tpl');
?>