<?php

$action = $_POST["action"];
$result = array("msg" => "error", "data" => "Tu no tienes suficientes permisos.");

    

if (strcmp($action, "insert") == 0) {
    
    $offline = ($hotel->tipoReserva == 'offline');
    if($offline) {
        if(isset($_SESSION['excursiones'])) {
            if(is_array($_SESSION['excursiones']) && count($_SESSION['excursiones'])) {
                foreach ($_SESSION['excursiones'] as $excur) {
                    
                    if($excur['forma_cobro'] == 'online') {
                        $offline = false;
                        break;
                    }
                    
                }
            }
        }
    }
    
    if($offline) {
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
        }
    }
    
    set_time_limit(0);
    $data_user = array(
        'nombre' => NULL,
        'apellido' => NULL,
        'email' => NULL,
        'telefono' => NULL,
        'paisId' => NULL
    );
    
    $data_reserva = array(
        'peticionesEspeciales' => NULL
    );
    
    foreach ($data_reserva as $k=>$val) {
        if(isset($_POST[$k]))
            $data_reserva[$k] = $_POST[$k];
    }
    
    foreach ($data_user as $k=>$val) {
        if(isset($_POST[$k]))
            $data_user[$k] = $_POST[$k];
    }
    
    $data_pago = array(
        'formaPago' => 'tarjeta',
        'origen' => $base_url,
        'tipo' => 'pago',
        'tarjetaTipo' => NULL,
        'tarjetaNumero' => NULL,
        'titular' => NULL,
        'caducidadMes' => NULL,
        'caducidadAnio' => NULL,
        'cvv' => NULL
    );
    
    foreach ($data_pago as $k=>$val) {
        if(isset($_POST[$k]))
            $data_pago[$k] = $_POST[$k];
    }
    
    $apartamentos = $_SESSION['apartamentos'];
    
    $apartamento = $apartamentos[$_POST['idApartamento']];
    
    $data_apartamento = array();
    
    $data_apartamento['tipo'] = 'apartamento';
    $data_apartamento['nombre'] = $apartamento['titulo'];
    
    $apartamento['precio'] = str_replace(".", "", $apartamento['precio']);
    $precioApto = explode(" ", trim($apartamento['precio']));
    $cobroAnticipado = $hotel->porcentageCobroAnticipado / 100;
    $precio = 0;
    $moneda = "";
    foreach ($precioApto as $p) {
        if(is_numeric(str_replace(",", ".", $p))) $precio = str_replace(",", ".", $p);
        else if(strlen(trim($p))) $moneda = $p;
    }
    $cobroAnticipado *= $precio;
    $data_apartamento['precioUnitario'] = str_replace(',', '.', (string) $precio);
    $data_apartamento['cantidad'] = $_POST['cantidad'];
    
    $data_apartamento['inicio'] = date('Y-m-d', strtotime($smarty->tpl_vars['inicio']));
    $data_apartamento['final'] = date('Y-m-d', strtotime($smarty->tpl_vars['salida']));
    $data_apartamento['porcientoInicial'] = $hotel->porcentageCobroAnticipado;
    $data_apartamento['importeInicial'] = str_replace(',', '.', (string) $cobroAnticipado);
    
    $apartamento['precioTotal_format'] = number_format($precio, 2, ',', ' ');
    
    $excursiones = $_SESSION['excursiones'];
    
    $data_excursiones = array();
    if($excursiones && count($excursiones)) {
        foreach ($excursiones as $excursion) {
            $data_excursion = array(
                'tipo' => 'excursion',
                'nombre' => $excursion['evento'],
                'precioUnitario' => $excursion['total'],
                'cantidad' => 1,
                'inicio' => $excursion['fecha'],
                'final' => $excursion['fecha'],
                'pagoOffline' => ($excursion['forma_cobro'] != 'online')? 1 : 0
            );
            
                        
            $precio += $excursion['total'];
            if($excursion['forma_cobro']=='online'){
                $cobroAnticipado += ($excursion['total'] * $excursion['porcientoInicial'] / 100);
                $data_excursion['porcientoInicial'] = $excursion['porcientoInicial'];
                $data_excursion['importeInicial'] = $excursion['total'] * $excursion['porcientoInicial'] / 100;
            }

            array_push($data_excursiones, $data_excursion);
        }
    }
    
    $data_pago['importe'] = $cobroAnticipado;
    
    
    /** **/
    //$excursiones_saved = array();
    foreach ($excursiones as $pos=>$excursion) {
        $distribuidor = getParametrosVikaByHotelId($hotel->id);
        $data_excursion_ws = array(
            'nombre' => $data_user['nombre'],
            'apellidoPaterno' => $data_user['apellido'],
            'email' => $data_user['email'],
            'eventoId' => $excursion['eventoId'],
            'fecha' => $excursion['fecha'],
            'tarifaId' => $excursion['tarifaId'],
            'entradas' => $excursion['entradas'],            
            'telefono' => $data_user['telefono'],
            'sesion' => $excursion['sesion'],
            'cupon' => $excursion['cupon'],
            'hotel' => $excursion['hotel'],
            'canal' => $distribuidor['canal']
        );
        
        /*
            $params_ws = array_merge($distribuidor, array());
            $params_ws['reservacion'] = $data_excursion_ws;
            
            $client = new nusoap_client($service_url."/soap-reservacion");
            $client->timeout = 1000000000;
            $client->response_timeout = 1000000000;
            $results = $client->call('insert', array('params' => $params_ws));
            
            $results = json_decode($results);

            $reservacion = $results->data;
        */
        //$data_excursiones[$pos]['localizador'] = $reservacion->codigo;
        //$data_excursiones[$pos]['telefonoContacto'] = $reservacion->evento->telefono;
    }
    /** **/
    
    $idReserva = insertReserva($hotel->id, $data_reserva, $data_apartamento, $data_excursiones, $data_user, $data_pago, $precio);
    
    
    
    if($idReserva) {
        $result['msg'] = 'ok';
        $result['data'] = 'Se guardaron los datos correctamente';
        $result['reserva_id'] = encryptId($idReserva);
        $_SESSION['data_usuario'] = $data_user;
        
        $subject = 'Confirmación de reserva';
        
        $smarty->assign('usuario', $data_user);
        $reservacion = getReserva($idReserva);
        $reservacion->id = encryptId($idReserva);
        $smarty->assign('reserva', $reservacion);
        $smarty->assign('apartamento', $apartamento);
        $smarty->assign('precioTotal', $moneda . ' ' . number_format($precio, 2, ",", ""));
        $smarty->assign('cantidad', $_POST['cantidad']);
        $smarty->assign('excursiones', $excursiones);
        $smarty->assign('entrada', $data_apartamento['inicio']);
        $smarty->assign('salida', $data_apartamento['final']);
        $pais = getPais($data_user['paisId']);
        $smarty->assign('pais', $pais->nombre);

        $campania = false;

        if($hotel && $hotel->campaniaId){
            $campania = getCampania($hotel->campaniaId);
            $smarty->assign('campania',$campania); 
        }
        
        $body = $smarty->fetch('confirmacionEmail_nodesign.tpl');
        
        $mail = new Core_Mailer();                               

        $enviado = $mail->send_email($data_user['email'], $subject, $body);
        
        $reserva_url = getReservaUrl($idReserva);
        $smarty->assign('reserva_url', $reserva_url);
        
        $emails = $hotel->empresa->emailReservas;
        $emails = explode(',', $emails);
        
        $body = $smarty->fetch('reservaEmail_nodesign.tpl');
        
        if($campania){
            $subject = 'Reserva en '.$smarty->getConfigVariable('sistema_nombre').' [contrato '.$campania->localizador.']';
        }else{
            $subject = 'Reserva en '.$smarty->getConfigVariable('sistema_nombre').'';    
        }
        
        
        foreach ($emails as $email) {
            if(strlen(trim($email)) > 0) {
                $enviado = $mail->send_email($email, $subject, $body);
            }
        }
        
    } else {
        $result['data'] = 'Hay errores en los datos. Revíselos por favor.';
    }
}

if(strcmp($action, 'cancelar') == 0) {
    if(isset($_POST['id'])) {
        
        $id = decryptId($_POST['id']);
                
        $estado = 'Cancelada por el cliente';
        
        $r = cambiarEstadoReserva($id, $estado);
        
        if($r) {
            
            $result['msg'] = 'ok';
            $result['data'] = 'La reserva fue cancelada';
            
            
            try {
                
                $reservacion = getReserva($id);
                
                
                /** cancelar excursiones **/
                /*
                if($reservacion->extras) {
                    foreach ($reservacion->extras as $excursion) {
                        set_time_limit(0);
                        $distribuidor = getParametrosVikaByHotelId($reservacion->hotelId);
                        $params_ws = array_merge($distribuidor, array());
                        $params_ws['codigo'] = $excursion->localizador;
                        $params_ws['noContactUser'] = 1;
                        $client = new nusoap_client($service_url."/soap-reservacion");
                        $client->timeout = 1000000000;
                        $client->response_timeout = 1000000000;
                        $results = $client->call('cancelar', array('params' => $params_ws));

                        $results = json_decode($results);
                        
                    }
                }*/
                
                /** fin cancelar excursiones **/
                
                $reservacion->id = $_POST['id'];
                $subject = 'Cancelación de reserva';
        
                $smarty->assign('usuario', $reservacion->usuario);
                $apartamento = $reservacion->alojamiento[0];
                $smarty->assign('reserva', $reservacion);
                $smarty->assign('apartamento', $apartamento);
                //$smarty->assign('precioTotal', $moneda . ' ' . number_format($precio, 2, ",", ""));
                $smarty->assign('cantidad', $_POST['cantidad']);
                $smarty->assign('excursiones', $reservacion->extras);
                $smarty->assign('entrada', $apartamento->inicio);
                $smarty->assign('salida', $apartamento->final);
                $pais = getPais($data_user['paisId']);
                $smarty->assign('pais', $pais->nombre);
                
                $noches = ceil((strtotime($apartamento->final) - strtotime($apartamento->inicio))/(24*60*60));
                $smarty->assign('noches', $noches);
                $campania = false;
                
                $hotel = getHotelById($reservacion->hotelId);

                if($hotel && $hotel->campaniaId){
                    $campania = getCampania($hotel->campaniaId);
                    $smarty->assign('campania',$campania); 
                }
                $smarty->assign('hotel', $hotel);
                $body = $smarty->fetch('cancelacionEmail_nodesign.tpl');

                $mail = new Core_Mailer();                               

                $enviado = $mail->send_email($reservacion->usuario->email, $subject, $body);

                $emails = $hotel->emailReservas;
                $emails = explode(',', $emails);

                $emails_distribuidor = explode(',', $hotel->distribuidor->emailReservas);
                $emails = array_merge($emails, $emails_distribuidor);

                $body = $smarty->fetch('reservaCancelacionEmail_nodesign.tpl');

                if($campania){
                    $subject = 'Reserva cancelada en '.$smarty->getConfigVariable('sistema_nombre').' [contrato '.$campania->localizador.']';
                }else{
                    $subject = 'Reserva cancelada en '.$smarty->getConfigVariable('sistema_nombre').'';    
                }


                foreach ($emails as $email) {
                    if(strlen(trim($email)) > 0) {
                        $enviado = $mail->send_email($email, $subject, $body);
                    }
                }
                
                //$result['email'] = $body;
                
            } catch (Exception $e) {
                print_r($e);
            }
            
            
        } else {
            $result['data'] = 'No se pudo cancelar la reserva';
        }
        
    } else {
        $result['data'] = 'Seleccione la reserva';
    }
}

if(strcmp($action, 'recuperar') == 0) {
    $email = $_POST['email'];
    
    if($email) {
        set_time_limit(0);
        $reservaciones = getReservasByUsuarioEmail($email);
        
        if($reservaciones && count($reservaciones)) {
            $usuario = $reservaciones[0]->usuario;
            $smarty->assign('usuario', $usuario);
            $smarty->assign('reservas', $reservaciones);
            $body = $smarty->fetch('recuperar.tpl');
            $subject = $usuario->nombre . ', estas son tus reservas';
            $mail = new Core_Mailer();
            $mail->send_email($email, $subject, $body);
            
            $result = array(
                'msg' => 'ok',
                'data' => 'Recibirás un correo electrónico con los datos de tus reservas'
            );
            
        } else {
            $result['data'] = 'No se encontraron reservas a tu nombre';
        }
        
    } else {
        $result['data'] = 'El email es obligatorio';
    }
}

echo json_encode($result);



?>
