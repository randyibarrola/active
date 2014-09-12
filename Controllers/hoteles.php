<?php 


$hoteles = getHotelesCampaniasActivas();


$smarty->assign('hoteles',$hoteles);

$locations = getLocationsHotelesCampaniasActivas('');

$smarty->assign('locations', json_encode($locations));

$precios = getPreciosHoteles('');

$count = count($precios);
$cant = $count > 6 ? 6 : $count;

$rangosPrecios = array();

for($i = 1; $i <= $cant; $i++) {
    $rangosPrecios[] = $precios[intval($count/$cant) * $i];
}

$smarty->assign('precios', $rangosPrecios);

$estrellas = getCalidadHoteles('');

if($estrellas && count($estrellas) > 1)
    $smarty->assign('estrellas', $estrellas);

$smarty->display('admin/hoteles.tpl');
?>