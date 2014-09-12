<?php

$usuario_core->validateUser();

if(isset($_GET['id'])) {
    $palabra = getBlacklistById($_GET['id']);
    $edit = true;
    $smarty->assign('palabra', $palabra);
} else {
    $edit = false;
}
$smarty->assign('edit', $edit);

$smarty->display('admin/blacklist/gestion.tpl');

?>