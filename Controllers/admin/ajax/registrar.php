<?php


$action = $_POST['action'];

$result = array('msg' => 'error', 'data' => 'Acción no valida');

$data = array(
    'nombre' => NULL,
    'apellido' => NULL,
    'empresa' => NULL,
    'puestoTrabajo' => NULL,
    'telefono' => NULL,
    'movil' => NULL,
    'hotel' => NULL,
    'email' => NULL,
    'dni' => NULL
);

$valid = true;

foreach ($data as $key=>$value) {
    if(isset($_POST[$key])) {        
        $data[$key] = $_POST[$key];
        
    } else { 
        $valid = false;
        break;
    }
}

if(isset($data['hotel']) && !is_null($data['hotel']) && is_array($data['hotel'])) {
    $hoteles = array();
    foreach ($data['hotel'] as $hotel) {
        if(!is_null($hotel) && strlen(trim($hotel)))
            $hoteles[] = trim($hotel);
    }
    $data['hotel'] = $hoteles;
} else {
    $valid = false;
}

if($valid) {
    
    $usuario = getUsuarioByEmail($data['email']);
    
    if(count($usuario) == 0) {
        
        $usuario_id= registrarCliente($data);
        
        if($usuario_id) {
            $usuario = getUsuario($usuario_id);
            try {
                
                $to = $data['email'];
                $subject = 'Gracias por registrarse en Vika Hotel';
                $smarty->assign('usuario', $usuario);
                $smarty->assign('empresa', $data);
                $smarty->assign('hoteles', $data['hotel']);
                $body = $smarty->fetch('admin/confirmacionRegistroEmail.tpl');
                
                $mail = new Core_Mailer();
                
                $mail->send_email($to, $subject, $body);
                
            } catch (Exception $e) {
                print_r($e);
            }
            
            
            $usuario_core->setUsuario($usuario, false);
            
            
            $campanias = getCampaniasByUsuario($usuario_id);
            
            if($campanias && count($campanias)) {
                $url = $base_url . '/admin-campania-contrato/id:' . $campanias[0]->id;
                $result['url'] = $url;
                updateUsuario($usuario->id, array('status'=>'activado'));
            }
            
            $result['msg'] = 'ok';
            $result['data'] = 'Usted se ha registrado correctamente. Se le ha enviado su contraseña a su correo electrónico';
        } else {
            $result['data'] = 'Se produjo un error al guardar. Revise sus datos por favor';
        }
        
       
       
    } else {
        $result['data'] = 'El email ya está registrado';
    }
    
} else {
    $result['data'] = 'Faltan datos obligatorios';
}

echo json_encode($result);


?>