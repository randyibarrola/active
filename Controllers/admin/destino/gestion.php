<?php 

$logged = $usuario_core->validateUser();

if($logged) {
    $idiomas = getAllIdiomas();
    $smarty->assign('idiomas', $idiomas);
    if(isset($_GET["id"])){
        $destino = getDestino($_GET["id"]);
        $smarty->assign('destino',$destino);
        $smarty->assign('edit',true);
    }else{
        $smarty->assign('edit',false);
    }

    

    $smarty->display('admin/destino/gestion.tpl');
}
?>