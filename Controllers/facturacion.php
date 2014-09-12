<?php
if(isset($_REQUEST['login_code']) && isset($_REQUEST['fcode'])) {
    $login_code = $_REQUEST['login_code'];
    $fcode = $_REQUEST['fcode'];
    $hotelId = getHotelIdByLoginCode($login_code);
    $factura = getFactura(decryptId($fcode));

    if($hotelId && $factura && $factura->hotelId == $hotelId) {
        $moneda = 'EUR';
        $reservas = $factura->reservas;
        if(count($reservas)) {
            $hotel = getHotelById($hotelId);
            $hotel->empresa = getEmpresaById($hotel->empresaId);
            $totalFacturado = $factura->total;
            $totalComisiones = $factura->comision;
            $smarty->assign('factura', $factura);
            $smarty->assign('hotel', $hotel);
            $smarty->assign('reservas', $reservas);
            $reserva = $reservas[0];
            $smarty->assign('cliente', $reserva->usuario);
            $smarty->assign('totalFacturado', $totalFacturado);
            $smarty->assign('totalComisiones', $totalComisiones);
            $smarty->assign('backUrl', $base_url);
            if($factura->cliente == 'hotel'){
                $smarty->display('admin/factura1.tpl');    
            }else{
                $smarty->display('admin/factura_cliente.tpl');
            }
            
        } else {
           // header('Location:' . $base_url . '/admin-login');
        }
    } else {
       // header('Location:' . $base_url . '/admin-login');
    }
} else {
    //header('Location:' . $base_url . '/admin-login');
}

?>