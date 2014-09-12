<?php

$usuario_core->validateUser();
$usuario = $usuario_core->getUsuario();
$hoteles = getHotelesByUsuario($usuario->id);
echo '1';
if(isset($_GET['id'])) {
    $promo = getPromocionPalabrasClave($_GET['id']);
    $edit = true;
    $smarty->assign('promocion', $promo);
    $hoteles = getHotelesByUsuario($promo->usuarioId);
    
    foreach ($promo->hoteles as $hp) {
        foreach ($hoteles as $k=>$h) {
            if($h->id == $hp->id) {
                $hoteles[$k]->selected = true;
                break;
            }
        }
    }
    
} else {
    $smarty->assign('usuarioId', $usuario->id);
    $edit = false;
}
$smarty->assign('edit', $edit);
$smarty->assign('hoteles', $hoteles);
$smarty->display('admin/promocion/gestion.tpl');

?>