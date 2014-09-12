<?php

$usuario_core->validateUser();
$usuario = $usuario_core->getUsuario();

if($usuario->usuarioGrupoId == 1)
    $palabras = getBlacklistWithoutHotel();
else if ($usuario->usuarioGrupoId == 3)
    $palabras = getBlacklistByDistribuidor($usuario->id);

$smarty->assign('palabras', $palabras);

$smarty->display('admin/blacklist/lista.tpl');

?>