<?php 

$logged = $usuario_core->validateUser();

if($logged) {
        
    //$hoteles = getAllHoteles();
    
    //$smarty->assign('hoteles',$hoteles);

    $smarty->display('admin/seo/lista.tpl');
}
?>