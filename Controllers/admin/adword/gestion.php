<?php 

$logged = $usuario_core->validateUser();

if($logged) {
    
    $paises = getPaisesAdwords();
    
   
    
    if(isset($_GET["id"])){
        
        $adword = getAdwordsById($_GET["id"]);
        
        if($adword->paises) {
            foreach ($adword->paises as $ap) {
                foreach ($paises as $p) {
                    if($p->id == $ap->paisId) {
                        $p->selected = 1;
                        break;
                    }
                }
            }
        }

        $smarty->assign('adword',$adword);
        $smarty->assign('edit',true);
        
    }

    $smarty->assign('paises', $paises);

    $smarty->display('admin/adword/gestion.tpl');
}
?>