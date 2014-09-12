<?php 
$usuario_core->validateUser();
require 'Logic/afiliado.php';
$hoteles = getHotelesByUsuario($usuario_core->getUsuario()->id);
$productos = getEventos();
$monedas = getAllMonedas();
$idiomas = getAllIdiomas();

if(isset($_GET["id"])){
    $afiliado = getAfiliado($_GET["id"]);

    if($afiliado->hoteles && count($afiliado->hoteles)) {
        foreach ($afiliado->hoteles as $c) {
            foreach ($hoteles as $hotel) {
                if($hotel->id == $c->hotelId)
                    $hotel->selected = true;
            }
        }
    }
    if($afiliado->eventos && count($afiliado->eventos)) {
        foreach ($afiliado->eventos as $c) {
            foreach ($productos as $evento) {
                if($evento->id == $c->eventoId)
                    $evento->selected = true;
            }
        }
    }
    $smarty->assign('afiliado',$afiliado);
    $smarty->assign('edit',true);
    
}else{
    $smarty->assign('edit',false);
}

$paises = getPaises();
$smarty->assign('paises', $paises);
$smarty->assign('monedas', $monedas);
$smarty->assign('idiomas', $idiomas);
$smarty->assign('hoteles', $hoteles);
$smarty->assign('productos', $productos);

$smarty->display('admin/afiliado/gestion.tpl');
?>