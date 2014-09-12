<?php 

$usuario_core->validateUser();

if(isset($_GET["id"])){
    
    $condicion = getCondicionById($_GET["id"]);
    
    $smarty->assign('condicion',$condicion);
    $smarty->assign('edit',true);
}else{
    $smarty->assign('edit',false);
}

$idiomas = getAllIdiomas();
$smarty->assign('idiomas', $idiomas);

$smarty->display('admin/condicion/gestion.tpl');
?>