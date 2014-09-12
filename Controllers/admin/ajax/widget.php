<?php
$action = $_POST['action'];
$result = array('msg' => 'error', 'data' => 'Acción no válida');
require 'Logic/widget.php';
require 'Logic/afiliado.php';

if (strcmp($action, 'get') == 0) {
	if(isset($_POST['configuracion'])){
		$configuracion = $_POST['configuracion'];
		$smarty->assign("configuracion", (object) $configuracion);
		$afiliado_id = $_POST['afiliado_id'];

		$afiliado_id_encriptado = urlencode(Encrypter::encrypt($afiliado_id, 'afiliado'));
		$smarty->assign("code", $afiliado_id_encriptado);

		$result['msg'] = 'ok';
		$enlace = $base_url.'?a='.$afiliado_id_encriptado;
		$smarty->assign("enlace", $enlace);

		if($_POST['tipo'] == "completo"){
			$destinos = getAfiliadoDestinos($afiliado_id);
			$smarty->assign("destinos", $destinos);
			
			$widget = $smarty->fetch('admin/widget/widget.tpl');
		}else if($_POST['tipo'] == "banner"){
			$rgb = Core_Util_General::hex2rgb($configuracion['backgroundBody']);
			$images = getAllHotelImages($_POST['hotel']);
			$smarty->assign('image', array_pop($images));

			$hotel_h = getHotelById($_POST['hotel']);
			
			$enlace = 'http://'.$hotel_h->dominioCampania.'?a='.$afiliado_id_encriptado;
			$smarty->assign("enlace", $enlace);

			$smarty->assign("hotel_h", $hotel_h);

			$destino = getDestino($hotel->destinoId);
			$smarty->assign("destino", $destino);

			$smarty->assign("rgb", implode(",", $rgb));

			$widget = $smarty->fetch('admin/widget/banner.tpl');
		}

    	$result['data'] = array('html'=> $widget,'msg' => 'Se guardaron los cambios correctamente', 'enlace' => $enlace);
	}
}else if (strcmp($action, 'insert') == 0) {
	if(isset($_POST['configuracion'])){
		$configuracion = $_POST['configuracion'];

		$configuracion['hotelId'] = $_POST['hotel'];

		$widget = array(
			'configuracion' => serialize($configuracion),
			'nombre' => $_POST['nombre'],
			'afiliadoId' => $_POST['afiliado_id'],
			'tipo' => $_POST['tipo']);

		insertWidget($widget);

		$result = array('msg' => 'ok', 'data' => 'Se guardaron los cambios correctamente');
	}
}else if (strcmp($action, 'eliminar') == 0) {
	if(isset($_POST['id'])){
		deleteWidget($_POST['id']);
		$result = array('msg' => 'ok', 'data' => 'Se ha eliminado correctamente.');
	}
}

echo json_encode($result);
?>