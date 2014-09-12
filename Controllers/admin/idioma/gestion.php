<?php

$logged = $usuario_core->validateUser();

if($logged && ($usuario_core->getUsuario()->usuarioGrupoId == 1 || $usuario_core->getUsuario()->usuarioGrupoId == 3)) {

$dir = $app_dir . '/configs/';
$files = scandir($dir);
$dictionary = array();
$idiomas = array();
foreach ($files as $file_dir) {
    if(strpos($file_dir, '.conf') && file_exists($dir . $file_dir)) {
        $lang = str_replace('.conf', '', $file_dir);
        
        $content = file($dir . $file_dir, FILE_IGNORE_NEW_LINES);
        $idioma = getIdiomaByCodigo($lang);
        if($idioma) {
            $dictionary[$lang] = array();
            $idiomas[] = $idioma;
            foreach ($content as $line) {
                $c = explode('=', $line);
                $dictionary[$lang][trim($c[0])] = trim($c[1]);
            }
        }
    }
}

$languages = getAllIdiomas();

$smarty->assign('languages', $languages);

$smarty->assign('idiomas', $idiomas);
$smarty->assign('config', $dictionary);
$smarty->assign('usuario',$usuario_core->getUsuario());
$smarty->display('admin/idioma/gestion.tpl');


} else {
    header('Location:'.$base_url . '/admin-login');
}

?>