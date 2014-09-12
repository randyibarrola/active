<?php 
$logged = $usuario_core->validateUser();

if($logged) {
    
    $usuario_core->hasAdminAccess('evento');
   
    $monedas = getAllMonedas();
    $destinos = getAllDestinos();

    $condiciones = getCondicionesByDistribuidor($usuario_core->getUsuario()->id);
    
    $smarty->assign('logged_user', $usuario_core->getUsuario());

    if(isset($_GET["id"])){
        $eventoId = $_GET["id"];
        $evento = getEvento($eventoId);

        if($evento->condiciones && count($evento->condiciones)) {
            foreach ($evento->condiciones as $c) {
                foreach ($condiciones as $cond) {
                    if($cond->id == $c->condicionId)
                        $cond->selected = true;
                }
            }
        }

        $smarty->assign('edit',true);
        $smarty->assign('evento', $evento);
    }else{
        $evento = new Evento();
        $evento->clave = substr(uniqid(), 6, 6);
        if(isset($_GET['c'])) {
            $campania = getCampania($_GET['c']);

            $evento->campania = $campania;
            $evento->campaniaId = $campania->id;
            $evento->inicioContrato = $campania->inicio;
            $evento->finContrato = $campania->fin;
            
            $evento->empresaId = $campania->empresaId;
            $evento->emailReservas = $campania->empresa->emailReservas;
            $evento->telefonoReservas = $campania->empresa->telefonoReservas;
            
            $evento->nombre = $campania->nombreHotel;
            $evento->tituloSeo = $evento->nombre;
            $evento->porcentageCobroAnticipado = 0;
            $evento->bookingOnrequest = 1;
            
            $smarty->assign('edit',true);
        } else {
            $smarty->assign('edit',false);
        }
        
        $smarty->assign('evento', $evento);
       

        $defaultCurrencies = array(
            'EUR'
        );
        
        foreach ($defaultCurrencies as $i) {
            foreach ($monedas as $moneda) {
                if($moneda->codigo == $i)
                    $moneda->selected = true;

            }
        }
    }
    
    $empresas = getEmpresasByUsuario($usuario_core->getUsuario()->id);
    $smarty->assign('empresas', $empresas);

    $smarty->assign('idiomas', $idiomas);

    $smarty->assign('condiciones', $condiciones);

    $smarty->assign('destinos', $destinos);
    $smarty->assign('monedas', $monedas);
    $smarty->display('admin/evento/gestion.tpl');
}
?>