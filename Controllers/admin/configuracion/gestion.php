<?php
$usuario_core->validateUser();
$eventos = getEventos();

if(isset($_GET["id"])){
    
    $config = getConfiguracionById($_GET["id"]);

    $eventosConfiguracion = getProductosByConfiguracion($_GET["id"]);

    if($eventos && $eventosConfiguracion) {
        foreach ($eventosConfiguracion as $ec) {
            foreach ($eventos as $e) {
                if($e->id == $ec->eventoId) {
                    if($ec->favorito) $e->favorito = 1;
                    $e->selected = 1;
                    break;
                }
            }
        }
    }
        
    $smarty->assign('configuracion',$config);
    $smarty->assign('edit',true);
}else{
    $smarty->assign('edit',false);
}

$smarty->assign('productos',$eventos);
$smarty->display('admin/configuracion/gestion.tpl');
?>