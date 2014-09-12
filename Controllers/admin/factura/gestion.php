<?php
$logged = $usuario_core->validateUser();

if($logged) {
    if(isset($_GET['id'])) {
        
        $factura = getFactura($_GET['id']);
        $hotel = getHotelById($factura->hotelId);
        if($hotel && $factura) {
            
            $moneda = 'EUR';
            $reservas = $factura->reservas;
            if(count($reservas)) {
                $hotel->empresa = getEmpresaById($hotel->empresaId);
                $totalFacturado = $factura->total;
                $totalComisiones = $factura->comision;
                $smarty->assign('factura', $factura);
                $smarty->assign('hotel', $hotel);
                $smarty->assign('reservas', $reservas);
                $smarty->assign('totalFacturado', $totalFacturado);
                $smarty->assign('totalComisiones', $totalComisiones);
                $smarty->assign('backUrl', $base_url . '/admin-factura-lista');
                $smarty->display('admin/factura1.tpl');
                
            } else {
               // header('Location:' . $base_url . '/admin-login');
            }
        } else {
           // header('Location:' . $base_url . '/admin-login');
        }
    } else {
        //header('Location:' . $base_url . '/admin-login');
    }
}
?>