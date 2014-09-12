<?php 
$usuario_core->validateUser();
require 'Logic/widget.php';
require 'Logic/afiliado.php';

if(isset($_GET["id"])){
    $widget = getWidget($_GET["id"]);
    $usuario_id = $usuario->id;
    $afiliado = getAfiliadoByIdUsuario($usuario_id);
	$afiliado_id = $afiliado->id;
	
    $configuracion = $widget->configuracion;
    $smarty->assign("configuracion", (object) $configuracion);

    $afiliado_id_encriptado = urlencode(Encrypter::encrypt($afiliado_id, 'afiliado'));
	$smarty->assign("code", $afiliado_id_encriptado);
	
	$enlace = $base_url.'?a='.$afiliado_id_encriptado;
	$smarty->assign("enlace", $enlace);

    if($widget->tipo == 'banner'){
		$rgb = Core_Util_General::hex2rgb($configuracion['backgroundBody']);
		$images = getAllHotelImages($configuracion['hotelId']);
		$smarty->assign('image', array_pop($images));

		$hotel_h = getHotelById($configuracion['hotelId']);
		$smarty->assign("hotel_h", $hotel_h);

		$destino = getDestino($hotel->destinoId);
		$smarty->assign("destino", $destino);

		$smarty->assign("rgb", implode(",", $rgb));
		$enlace = 'http://'.$hotel_h->dominioCampania.'?a='.$afiliado_id_encriptado;
		$smarty->assign("enlace", $enlace);

		$widget_html = $smarty->fetch('admin/widget/banner.tpl');
    }else{
		$destinos = getAfiliadoDestinos($afiliado_id);
		$smarty->assign("destinos", $destinos);
    	$widget_html = $smarty->fetch('admin/widget/widget.tpl');	
    }
    
    $smarty->assign('widget', $widget_html);
}

$smarty->display('admin/widget/ver.tpl');
?>