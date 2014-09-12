<?php 

$logged = $usuario_core->validateUser();

if($logged) {
    $eventos = getEventos();
    $smarty->assign('eventos',$eventos);
    $smarty->display('admin/evento/lista.tpl');
}
?>