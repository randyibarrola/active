<?php 

$logged = $usuario_core->validateUser();

if($logged) {
    
    $usuario_core->hasAdminAccess('hotel');
    
    $idiomas = getAllIdiomas();
    $monedas = getAllMonedas();

    if(isset($_GET["id"])){
        
        $hotel = getHotelById($_GET["id"]);
        if($hotel->campaniaId) {
            $hotel->campania = getCampania($hotel->campaniaId);
            $hotel->dominioCampania = $hotel->campania->subdominio;
        }
        if($hotel->idiomas && count($hotel->idiomas)) {
            foreach ($hotel->idiomas as $i) {
                foreach ($idiomas as $idioma) {
                    if($idioma->id == $i->id)
                        $idioma->selected = true;

                }
            }
        }

        if($hotel->monedas && count($hotel->monedas)) {
            foreach ($hotel->monedas as $m) {
                foreach ($monedas as $moneda) {
                    if($moneda->id == $m->id)
                        $moneda->selected = true;

                }
            }
        }
        
        if(!strlen(trim($hotel->tituloSeo))) {
            $seo = $hotel->nombre;
            if($hotel->destinoId)
                $seo .= " | " . $hotel->destino->nombre;
            $hotel->tituloSeo = json_encode(array(
                'es' => $seo
            ));
        }


        $smarty->assign('hotel',$hotel);
        $smarty->assign('edit',true);
        
    }

    $smarty->assign('idiomas', $idiomas);


    $smarty->display('admin/seo/gestion.tpl');
}
?>