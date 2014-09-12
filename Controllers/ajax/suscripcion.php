<?php


$result = array("msg" => "error", "data" => "Tu no tienes suficientes permisos.");

if(isset($_POST['email'])) {
    $data = array();
    $data['email'] = $_POST['email'];
    
    
    //suscribir
    
    $result['msg'] = 'ok';
    $result['data'] = 'Gracias por suscribirte a nuestro boletín';
}

echo json_encode($result);
?>
