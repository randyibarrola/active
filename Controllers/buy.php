<?php


$id = $_REQUEST['id'];
$apartamentos = $_SESSION['apartamentos'];
//$c = isset($_GET['c']) ? $_GET['c'] : 1;
$apartamento = $apartamentos[$id];
$apartamento['id'] = $id;

$inicio = $smarty->tpl_vars['inicio'];
$salida = $smarty->tpl_vars['salida'];
$noches = trim($smarty->tpl_vars['noches']);
$moneda = $smarty->tpl_vars['moneda'];


$time_inicio = strtotime($inicio);
$time_salida = strtotime($salida);

$inicio = date('Y-m-d',strtotime($inicio));
$salida = date('Y-m-d',strtotime($salida));
/*
if(isset($_REQUEST['m'])) {
    $moneda = getMonedaByCodigo($_REQUEST['m']);
} else {
    $moneda = getMonedaByCodigo('EUR');
}
*/

$data = array(
    'hotelId' => $hotel->id,
    'apartamento' => $apartamento,
    'inicio' => $inicio,
    'salida' => $salida,
    'noches' => $noches,
    'url' => $base_url . $end_url,
    'excursiones' => array(),
    'monedaId' => $moneda->value->id
);

$cartid = insertCart($data);


if($cartid) {
    $cartid = dechex($cartid * 999);
    header('Location:' . 'https://' . $hotel->campania->subdominio . '/'.$lang_set.'/reservar/id:' . $cartid . $end_url);
}
    


?>