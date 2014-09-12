<?php 

$logged = $usuario_core->validateUser();

if($logged) {

    $usuario_core->hasAdminAccess('reservas');
    
    $smarty->assign('estadosReserva', array(
        'Pendiente', 
        'Cancelada por el cliente', 
        'Cancelada por el administrador',
        'Aprobada',
        'Confirmada',
        'CheckOut',
        'Stayed',
        'No show'
        ));
    
    if(isset($_GET['id'])) {
        $hotel = getHotelById($_GET['id']);
        $smarty->assign('hotel', $hotel);
        $smarty->assign('edit', 1);
    }

    $smarty->display('admin/reserva/lista.tpl');
}
?>