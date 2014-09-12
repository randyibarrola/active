<?php 

if(isset($_REQUEST['print']) && isset($_REQUEST['rloc']) && isset($_REQUEST['login_code'])) {
    $login_code = $_REQUEST['login_code'];

    $hotelId = getHotelIdByLoginCode($login_code);
}

if(!$hotelId)
$usuario_core->validateUser(); 

$tipo_cobro = "";

if(isset($_GET["id"])){
    
    $reserva = getReserva($_GET["id"]);
    $tipo_cobro = $reserva->tipoCobro;
    
    $reserva->hotel = getHotelById($reserva->hotelId);
    
    if(!$reserva->pagos || !count($reserva->pagos)) {
        $reserva->pagos = array();
        $reserva->pagos[0]->importe = $reserva->productos[0]->precioUnitario;
        $reserva->pagos[0]->formaPago = 'efectivo';
    } else {
        $reserva->pagos[0]->importe = $reserva->productos[0]->precioUnitario;
    }
    
    $hotel = getHotelById($reserva->hotelId);
    
    if($reserva->productos[0]->porcientoInicial){
        $reserva->productos[0]->comision = $reserva->productos[0]->precioUnitario * $reserva->productos[0]->porcientoInicial / 100;
    }else{
        $reserva->productos[0]->comision = $reserva->productos[0]->precioUnitario * $hotel->distribuidor->porcentajeBeneficio / 100;
    }
    
    
    if($reserva->pagos) {
        $beneficio = $reserva->productos[0]->porcientoInicial;
        /*if(!$beneficio)
            $beneficio = $reserva->hotel->distribuidor->porcentajeBeneficio;*/
        
        if($usuario_core->getUsuario()->usuarioGrupoId == 2)
            $beneficio = 100 - $beneficio;
        
        
        
        foreach ($reserva->pagos as $k=>$pago) {
            $reserva->pagos[$k]->importe = $pago->importe * $beneficio / 100;
        }
    }
    
    $smarty->assign('reserva',$reserva);
    
    if($reserva->usuario && is_numeric($reserva->usuario->paisId)){
        $pais = getPais($reserva->usuario->paisId);
        $smarty->assign('pais',$pais);
    }
    if($reserva->hotel && $reserva->hotel->campaniaId){
        $campania = getCampania($reserva->hotel->campaniaId);
        $smarty->assign('campania',$campania); 
    }
    
    $smarty->assign('edit',true);
}else{
    $smarty->assign('edit',false);
}
$smarty->assign('meses', array('Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
        'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'));

$smarty->assign('estadosPago', array('Pendiente', 'Denegado', 'Confirmado'));

$smarty->assign('estadosReserva', Core_Util_General::getEstadosReserva($tipo_cobro));

if(isset($_GET['print'])){
    $smarty->display('admin/reserva/gestion_print.tpl');
}else{
    if(isset($_GET["id"]))
        $smarty->display('admin/reserva/gestion.tpl');
    else {
        $paises = getPaises();
        $smarty->assign('paises', $paises);
        $smarty->display('admin/reserva/add.tpl');
    }
}
?>