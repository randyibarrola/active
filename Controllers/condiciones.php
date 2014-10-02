<?php

if($_GET['id']) {
    $idCondicion = hexdec($_GET['id']) / 9999;
    $condicion = getCondicionById($idCondicion);
    $condicion->id = $_GET['id'];
    $smarty->assign('condicion', $condicion);
}
if(isset($_REQUEST['print']))
    $smarty->assign('print', 1);

if($_GET['v'])
    $smarty->display('condicionesCompraModal.tpl');
else
    $smarty->display('condicionesCompra.tpl');
?>