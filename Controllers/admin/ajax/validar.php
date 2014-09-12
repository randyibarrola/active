<?php


$action = $_POST['action'];

$result = array('msg' => 'error', 'data' => 'Acción no valida');

if(strcmp($action, 'validar') == 0) {
    $reservas = array();
    if(isset($_POST['reservas']))
        $reservas = $_POST['reservas'];
    $importes = array();
    if(isset($_POST['importe'])) 
        $importes = $_POST['importe'];
    
    if($importes && count($importes)) {
        $v = validarReservas($reservas, $importes);
        
        if($v) {
            $lista = getReservasActualesByHotel($_POST['hotelId']);
            $smarty->assign('reservas', $lista);
            $html = $smarty->fetch('admin/validar_reservas.tpl');
            //Temporal enviarEmailFacturacion($_POST['hotelId'], $idFactura);
            $result = array(
                'msg' => 'ok',
                'html' => $html
            );
        }
    }
}

echo json_encode($result);

?>