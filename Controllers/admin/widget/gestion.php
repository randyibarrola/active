<?php 
$usuario_core->validateUser();
require 'Logic/widget.php';
require 'Logic/afiliado.php';

if(isset($_GET["id"])){
    $afiliado = getAfiliado($_GET["id"]);
    $hoteles = $afiliado->hoteles;
    $hoteles_array = array();

    if(count($hoteles)){
    	foreach ($hoteles as $hotel) {
    		$hoteles_array[] = getSimpleHotel($hotel->hotelId);
    	}
    }

    $smarty->assign("hoteles", $hoteles_array);
    
    $smarty->assign('afiliado',$afiliado);
}

$smarty->display('admin/widget/gestion.tpl');
?>