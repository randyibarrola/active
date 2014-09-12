<?php

if(isset($_REQUEST['login_code']) && isset($_REQUEST['rloc'])) {
    $login_code = $_REQUEST['login_code'];

    $hotelId = getHotelIdByLoginCode($login_code);
    
    if($hotelId) {
        
        $reserva = getReservaByLocalizador($_REQUEST['rloc']);
        
        $reserva->hotel = getHotelById($hotelId);
        
        if(!$reserva->pagos || !count($reserva->pagos)) {
            $reserva->pagos = array();
            $reserva->pagos[0]->importe = $reserva->productos[0]->precioUnitario;
            $reserva->pagos[0]->formaPago = 'efectivo';
        } else {
            $reserva->pagos[0]->importe = $reserva->productos[0]->precioUnitario;
        }
        
        if($reserva->pagos) {
            $beneficio = $reserva->productos[0]->porcientoInicial;
            /*if(!$beneficio)
                $beneficio = $reserva->hotel->distribuidor->porcentajeBeneficio;
            */
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
        
        if($reserva && $reserva->hotelId == $hotelId) {
            $smarty->assign('edit',true);
            $smarty->assign('meses', array('Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
        'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'));

        $smarty->assign('estadosPago', array('Pendiente', 'Denegado', 'Confirmado'));
        $smarty->assign('estadosReserva', Core_Util_General::getEstadosReserva($reserva->tipoCobro));

            if(isset($_REQUEST['print']))
                $smarty->display('admin/reserva/ver_print.tpl');
            else
                $smarty->display('admin/reserva/ver.tpl');
            
        } else {
            header('Location:' . $base_url);
        }

        
    } else {
        header('Location:' . $base_url);
    }
} else {
    header('Location:' . $base_url);
}

?>