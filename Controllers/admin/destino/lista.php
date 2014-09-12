<?php 

$logged = $usuario_core->validateUser();

if($logged) {
        
    $destinos = getAllDestinos();
    
    $smarty->assign('destinos',$destinos);

    $smarty->display('admin/destino/lista.tpl');
}
?>