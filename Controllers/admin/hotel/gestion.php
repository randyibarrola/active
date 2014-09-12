<?php 

$logged = $usuario_core->validateUser();

if($logged) {
    
    $usuario_core->hasAdminAccess('hotel');
    
    $idiomas = getAllIdiomas();
    $monedas = getAllMonedas();
    $destinos = getAllDestinos();

    $condiciones = getCondicionesByDistribuidor($usuario_core->getUsuario()->id);
    
    $smarty->assign('logged_user', $usuario_core->getUsuario());

    if(isset($_GET["id"])){
        
        getWordsInBlacklistToRemove($_GET["id"]);
        getWordsInBlacklistToRemoveResult($_GET["id"]);
        $acceso = userCanAccessHotel($_GET["id"], $usuario_core->getUsuario()->id);
        
        

        if($acceso) {
            $hotel = getHotelById($_GET["id"], false);
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

            if($hotel->condiciones && count($hotel->condiciones)) {
                foreach ($hotel->condiciones as $c) {
                    foreach ($condiciones as $cond) {
                        if($cond->id == $c->id)
                            $cond->selected = true;

                    }
                }
            }
            
            $configuraciones = getConfiguracionesByCampania($hotel->campaniaId);
            $smarty->assign('configuraciones', $configuraciones);

            $smarty->assign('hotel',$hotel);
            $smarty->assign('edit',true);
            
            $otrosHoteles = array();
            $hoteles = getHotelesByUsuario($usuario_core->getUsuario()->id);
            set_time_limit(0);
            foreach ($hoteles as $h) {
                if($hotel->id != $h->id && count(getBlacklistByHotel($h->id))) {
                    $otrosHoteles[] = $h;
                }
            }
            $smarty->assign('hoteles', $otrosHoteles);
            
            $adword = getAdwordByHotel($hotel->id);
            if($adword) $smarty->assign('adword', $adword);
            
        } else {
            header('Location:'.$base_url.'/admin-hotel-lista');
        }
    }else{
        $hotel = new Hotel();
        $hotel->clave = substr(uniqid(), 6, 6);
        if(isset($_GET['c'])) {
            $campania = getCampania($_GET['c']);
            //$hotel = new Hotel();
            $hotel->campania = $campania;
            $hotel->campaniaId = $campania->id;
            $hotel->inicioContrato = $campania->inicio;
            $hotel->finContrato = $campania->fin;
            
            $hotel->empresaId = $campania->empresaId;
            $hotel->emailReservas = $campania->empresa->emailReservas;
            $hotel->telefonoReservas = $campania->empresa->telefonoReservas;
            
            $hotel->dominioCampania = $campania->subdominio;
            
            $hotel->promociones = $campania->periodos;
            if($hotel->promociones && count($hotel->promociones)) {
                foreach ($hotel->promociones as $p) {
                    $p->tipoDescuentoBooking = $p->tipoDescuento;
                }
                $hotel->ventaAnticipada = $p->ventaAnticipada;
                $hotel->estanciaMinima = $p->estanciaMinima;
            }
            
            $hotel->nombre = $campania->nombreHotel;
            $hotel->porcentageCobroAnticipado = $campania->porcentajeBeneficio;
            
            $hotel->tituloSeo = json_encode(array('es'=>$hotel->nombre));

            $hotel->mostrarHotelesRelacionados = 1;
            $hotel->headerVikahotel = 1;
            $hotel->dominioOficial = $smarty->getConfigVariable('sistema_web');
            
            $hotel->bookingOnrequest = 1;
            
            $configuraciones = getConfiguracionesByCampania($campania->id);
            $smarty->assign('configuraciones', $configuraciones);
            
            $smarty->assign('edit',true);
        } else {
            $smarty->assign('edit',false);
        }
        
        $smarty->assign('hotel', $hotel);
        
        $defaultLanguages = array(
            'es', 'en', 'it', 'pt'
        );

        foreach ($defaultLanguages as $i) {
            foreach ($idiomas as $idioma) {
                if($idioma->codigo == $i){
                    $idioma->selected = true;
                }
                if($idioma->codigo == 'en'){
                    $idioma->default = true;   
                }

            }
        }

        $defaultCurrencies = array(
            'EUR'
        );
        
        foreach ($defaultCurrencies as $i) {
            foreach ($monedas as $moneda) {
                if($moneda->codigo == $i)
                    $moneda->selected = true;

            }
        }
        
        $hoteles = getHotelesByUsuario($usuario_core->getUsuario()->id);
        $otrosHoteles = array();
        foreach ($hoteles as $h) {
            if(count(getBlacklistByHotel($h->id))) {
                $otrosHoteles[] = $h;
            }
        }
        $smarty->assign('hoteles', $otrosHoteles);
    }
    
    

    $empresas = getEmpresasByUsuario($usuario_core->getUsuario()->id);
    $smarty->assign('empresas', $empresas);

    $smarty->assign('idiomas', $idiomas);

    $smarty->assign('condiciones', $condiciones);

    $smarty->assign('destinos', $destinos);
    $smarty->assign('monedas', $monedas);

    $smarty->display('admin/hotel/gestion.tpl');
}
?>