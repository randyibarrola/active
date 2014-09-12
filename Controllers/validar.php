<?php
    
if(isset($_REQUEST['login_code'])) {
    $login_code = $_REQUEST['login_code'];

    $hotelId = getHotelIdByLoginCode($login_code);
    if($hotelId) {
        $moneda = 'EUR';
        $reservas = getReservasActualesByHotel($hotelId, $moneda);
        
        $hotel = getHotelById($hotelId);
        $smarty->assign('hotel', $hotel);
        $smarty->assign('reservas', $reservas);
        $smarty->display('admin/validar.tpl');
        
    } else {
        header('Location:' . $base_url . '/admin-login');
    }
} else {
    header('Location:' . $base_url . '/admin-login');
}

?>