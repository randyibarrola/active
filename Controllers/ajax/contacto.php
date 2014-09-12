<?php


$result = array("msg" => "error", "data" => "Tu no tienes suficientes permisos.");

if(isset($_POST['nombre']) && isset($_POST['email']) && isset($_POST['mensaje'])) {
    /*
    if (isset($_POST["recaptcha_response_field"])){
        require_once('Lib/recaptcha/recaptchalib.php');
        $resp = recaptcha_check_answer($reprivatekey,
                                            $_SERVER["REMOTE_ADDR"],
                                            $_POST["recaptcha_challenge_field"],
                                            $_POST["recaptcha_response_field"]);
        if(!$resp->is_valid){
            echo json_encode(array('data'=>'Captcha incorrecto, por favor, escriba de nuevo la frase de la imagen, o vuelva a recargarla.','msg' => 'error'));       
            exit();
        }
    } else {
        echo json_encode(array('data'=>'El Captcha es obligatorio','msg' => 'error'));       
        exit();
    }*/
    $data = array();
    $data['nombre'] = $_POST['nombre'];
    $data['email'] = $_POST['email'];
    $data['mensaje'] = $_POST['mensaje'];
    $data['desde'] = $base_url;
    $data['asunto'] = intval($_POST['asunto']);
    
    try {
        $mail = new Core_Mailer();
        
        $emails = array();
        
        $asuntos = array(
            'Disponibilidad_y_tarifas',
            'Reservas',
            'Informacion_general_del_hotel',
            'Sugerencias',
            'Otros'
        );
        $subject = $asuntos[$data['asunto']];
        
        /*if($data['asunto'] > 1 ) {//Informacion_general_del_hotel,Sugerencias,Otros'
            $emails[] = $hotel->emailReservas;
        } else {//Disponibilidad_y_tarifas,Reservas
            if(count(explode(',', $hotel->emailReservas)))
                $emails = explode(',', $hotel->emailReservas);
            else if(count(explode(':', $hotel->emailReservas)))
                $emails = explode(':', $hotel->emailReservas);
            //$emails[] = 'booking-online@vikahotel.com';
        }*/
        $emails[] = $hotel->emailContacto;
        
        
        
        $body = " Enviado el " . date("d-m-Y") . "<br/>";
        $body .= "por el usuario " . $data['nombre'] . "<br/>";
        $body .= "con el email " . $data['email'] . "<br/>";
        
        if(isset($_POST['inicio']) && isset($_POST['final'])) {
            $inicio = $_POST['inicio'];
            $final = $_POST['final'];
            $body .= "desde el $inicio hasta $final <br>";
            if(isset($_POST['adultos']) && intval($_POST['adultos'])) {
                $adultos = $_POST['adultos'];
                $body .= "$adultos adultos ";
                if(isset($_POST['ninios']) && intval($_POST['ninios'])) {
                    $ninios = $_POST['ninios'];
                    $body .= "$ninios niños ";

                }
                $body .= '<br>';
            }
            
            if(isset($_POST['fechasFlexibles']))
                $body .= '<strong>(Mis fechas son flexibles)</strong><br>';
        }
        
        $body .= "Mensaje: " . $data['mensaje'] . " <br/>";
        $body .= 'Enviado desde ' . $base_url;
        
                
        $subject = str_replace('_', ' ', $subject);
        foreach ($emails as $email) {
            if(strlen(trim($email))) {
                $mail->send_email(trim($email), $subject . ' ' . $hotel->nombre, $body, false, array(
                    'reply-to' => array(
                        $data['email'],
                        $data['nombre']
                    )
                ));
            }
        }
                
    } catch (Exception $e) {
        
    }
    
    $result['msg'] = 'ok';
    $result['data'] = 'Hemos recibido tu mensaje. Gracias por contactarnos';
}

echo json_encode($result);
?>
