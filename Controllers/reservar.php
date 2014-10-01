<?php
if($hotel) {
    require_once 'Logic/paises.php';
    
    if(isset($_POST['cartID'])) {
        /** registrar reserva **/
        $invalid = false;
        $cartId = $_POST['cartID'];
        $cart = getCart($cartId);
        $apartamento = $cart->apartamentoObj;
        $excursiones = $cart->excursionesArray;
        
        $hotel = getHotelById($cart->hotelId);
    
        $offline = ($hotel->tipoReserva == 'offline');
        if($offline) {
            if($excursiones) {
                if(is_array($excursiones) && count($excursiones)) {
                    foreach ($excursiones as $excur) {

                        if($excur->forma_cobro == 'online') {
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
                    $smarty->assign('error_msg' , 'Captcha incorrecto, por favor, escriba de nuevo la frase de la imagen, o vuelva a recargarla.');       
                    $invalid = true;
                }
            } else {
                $smarty->assign('error_msg' , 'El Captcha es obligatorio');       
                $invalid = true;
            }
        }

        if(!$invalid) {
        
            set_time_limit(0);
            $data_user = array(
                'nombre' => NULL,
                'apellido' => NULL,
                'email' => NULL,
                'telefono' => NULL,
                'pais' => NULL
            );
            
            $navs = array(
                'Mozilla', 'Firefox', 'IE', 'Opera', 'Safari'
            );
            
            foreach ($navs as $nav) {
                if(eregi($nav, $_SERVER['HTTP_USER_AGENT']))
                    break;
            }

            $data_reserva = array(
                'peticionesEspeciales' => NULL,
                'urlOrigen' => $cart->url,
                'monedaId' => $hotel->monedaId,
                'recibirFactura' => 0,
                'cartId' => $cart->id,
                'ip' => $_SERVER['REMOTE_ADDR'],
                'navegador' => $nav,
                'requestTime' => time(),
                'adultos' => $apartamento->adultos,
                'ninios' => $apartamento->ninios
            );

            foreach ($data_reserva as $k=>$val) {
                if(isset($_POST[$k]))
                    $data_reserva[$k] = $_POST[$k];
            }

            foreach ($data_user as $k=>$val) {
                if(isset($_POST[$k]))
                    $data_user[$k] = $_POST[$k];
            }
            
            if($data_user['pais']) {
                $data_user['paisId'] = getPaisByCodigo($data_user['pais'])->id;
            }

            $data_pago = array(
                'formaPago' => 'tarjeta',
                'origen' => $cart->url,
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

            $data_apartamento = array();

            $data_apartamento['tipo'] = 'apartamento';
            $data_apartamento['nombre'] = $apartamento->titulo;
            if($apartamento->condicion)
                $data_apartamento['condicion'] = $apartamento->condicion;

            if($apartamento->pension)
                $data_apartamento['pension'] = $apartamento->pension;

            //$apartamento->precio = str_replace(".", "", $apartamento->precio);
            
            $moneda = getMoneda($cart->monedaId)->simbolo;
            
            /*
            $precioApto = trim(str_replace($moneda, '',$apartamento->precio));
            
            $precio = 0;

            $precio = getNumberFromStr(str_replace(',','.',$precioApto));*/
            
            $precio = $currencyDetector->getAmount($apartamento->precio);
            
            $cobroAnticipado = $hotel->porcentageCobroAnticipado / 100;
            /*
            if($hotel->tipoReserva == 'cobro anticipado de comisiones')
                $cobroAnticipado = 0;
            */
            if($cart->apartamentoObj->pagoOnline) {
                $hotel->porcentageCobroAnticipado += $cart->apartamentoObj->pagoOnline;
                $cobroAnticipado += ($cart->apartamentoObj->pagoOnline / 100);
            }
            
            $cobroAnticipado *= $precio;
            $data_apartamento['precioUnitario'] = str_replace(',', '.', (string) $precio);
            $data_apartamento['cantidad'] = $_POST['cantidad'];

            $data_apartamento['inicio'] = date('Y-m-d', strtotime($cart->inicio));
            $data_apartamento['final'] = date('Y-m-d', strtotime($cart->salida));
            $data_apartamento['porcientoInicial'] = $hotel->porcentageCobroAnticipado;
            $data_apartamento['importeInicial'] = str_replace(',', '.', (string) $cobroAnticipado);
            $data_apartamento['pagoOffline'] = (($hotel->tipoReserva == 'offline')  && $cart->apartamentoObj->pagoOnline) ? 1 : 0;
            

            $apartamento->precioTotal_format = number_format($precio, 2, ',', ' ');

            $data_excursiones = array();

            if($excursiones && count($excursiones)) {
                foreach ($excursiones as $excursion) {
                    $data_excursion = array(
                        'tipo' => 'excursion',
                        'nombre' => $excursion->evento,
                        'precioUnitario' => $excursion->total,
                        'cantidad' => 1,
                        'inicio' => $excursion->fecha,
                        'final' => $excursion->fecha,
                        'pagoOffline' => ($excursion->forma_cobro != 'online')? 1 : 0,
                        'modoPagoOffline' => $excursion->forma_cobro_offline,
                        'eventoTpv' => $excursion->eventoTpv,
                        'eventoId' => $excursion->eventoId,
                        'sesion' => $excursion->sesion,
                        'direccion' => $excursion->direccion,
                        'emails' => $excursion->emails,
                        'hotel' => $hotel->nombre,
                        'telefonoContacto' => $excursion->telefonoReservas,
                        'localizador' => strtoupper(generarLocalizador(5))
                    );


                    $precio += $excursion->total;
                    if($excursion->forma_cobro=='online'){
                        $cobroAnticipado += ($excursion->total * $excursion->porcientoInicial / 100);
                        $data_excursion['porcientoInicial'] = $excursion->porcientoInicial;
                        $data_excursion['importeInicial'] = $excursion->total * $excursion->porcientoInicial / 100;
                    }

                    //No se que es esto -> $data_excursion['entradas'] = json_encode($reservacion->entradas);

                    array_push($data_excursiones, $data_excursion);
                }
            }

            $data_pago['importe'] = str_replace(',', '.', (string) $cobroAnticipado);


        /* Solo para vikahotel
            foreach ($excursiones as $pos=>$excursion) {
                $distribuidor = getParametrosVikaByHotelId($hotel->id);
                $data_excursion_ws = array(
                    'nombre' => $data_user['nombre'],
                    'apellidoPaterno' => $data_user['apellido'],
                    'email' => $data_user['email'],
                    'eventoId' => $excursion->eventoId,
                    'fecha' => $excursion->fecha,
                    'tarifaId' => $excursion->tarifaId,
                    'entradas' => $excursion->entradas,            
                    'telefono' => $data_user['telefono'],
                    'sesion' => $excursion->sesion,
                    'cupon' => $excursion->cupon,
                    'hotel' => $excursion->hotel,
                    'canal' => 'hotel',
                    'noContactEmail' => 1
                );
                
                
                if($excursion->forma_cobro=='online'){
                    $cobro_excursion = ($excursion->total * $excursion->porcientoInicial / 100);
                    $data_pago_excursion = array_merge($data_pago, array('importe' => $cobro_excursion));
                    $data_excursion_ws['pago'] = $data_pago_excursion;
                }


                $params_ws = array_merge($distribuidor, array());
                $params_ws['reservacion'] = $data_excursion_ws;
                
                $client = new nusoap_client($service_url."/soap-reservacion");
                $client->timeout = 1000000000;
                $client->response_timeout = 1000000000;
                $results = $client->call('insert', array('params' => $params_ws));

                $results = json_decode($results);

                $reservacion = $results->data;

                $data_excursiones[$pos]['localizador'] = strtoupper(generarLocalizador(5));
                $data_excursiones[$pos]['telefonoContacto'] = $reservacion->evento->telefono;
                $data_excursiones[$pos]['entradas'] = json_encode($reservacion->entradas);
            }*/
            /** **/
            
            $idioma_actual = isset($lang_set) ? getIdiomaByCodigo($lang_set) : getIdioma($hotel->idiomaId);
            $data_reserva['idiomaId'] = $idioma_actual->id;
            $idReserva = insertReserva($hotel->id, $data_reserva, $data_apartamento, $data_excursiones, $data_user, $data_pago, str_replace(',', '.', (string) $precio));



            if($idReserva) {
                $result = array();
                $result['msg'] = 'ok';
                $result['data'] = 'Se guardaron los datos correctamente';
                $result['reserva_id'] = encryptId($idReserva);
                //$_SESSION['data_usuario'] = $data_user;
                
                $smarty->assign('usuario', $data_user);
                $reservacion = getReserva($idReserva);
                $reservacion->id = encryptId($idReserva);
                $smarty->assign('reserva', $reservacion);

                $subject = 'New Booking ' . $hotel->nombres->es . ' [' . $reservacion->localizador . ']';
                
                $smarty->assign('entrada', $data_apartamento['inicio']);
                $smarty->assign('salida', $data_apartamento['final']);
                
                $noches = ceil((strtotime($data_apartamento['final']) - strtotime($data_apartamento['inicio']))/(24*60*60));
                $smarty->assign('noches', $noches);
                
                $pais = getPais($data_user['paisId']);
                $smarty->assign('pais', $pais->nombre);
                $smarty->assign('base_url', $cart->url);
                
                //$smarty->assign('currency', $moneda);
                $campania = false;
                $smarty->assign('hotel', $hotel);
                if($hotel && $hotel->campaniaId){
                    $campania = getCampania($hotel->campaniaId);
                    $smarty->assign('campania',$campania); 
                }
                
                //nueva maqueta para mail
                //$body = $smarty->fetch('confirmacionEmail_nodesign.tpl');
                $body = $smarty->fetch('confirmacionEmail.tpl');
                
                //generar factura
                if($cobroAnticipado && $reservacion->estado == 'Aprobada') {
                    $factura = generarFactura($reservacion, $hotel);
                } else {
                    $factura = 0;
                }

                $mail = new Core_Mailer();                               
                /* enviando email al usuario */
                $enviado = $mail->send_email($data_user['email'], $subject, $body, $factura);

                if($factura) {
                    //TODO: eliminar pdf
                    $mail = new Core_Mailer();
                    @unlink($factura);
                }

                
                    
                $emails = $hotel->emailReservas;
                $emails = explode(',', $emails);

                $reserva_url = getReservaUrl($idReserva);
                $smarty->assign('reserva_url', $reserva_url);
                
                //nueva maqueta para mail
                $body = $smarty->fetch('reservaEmail_nodesign.tpl');
                //$body = $smarty->fetch('reservaEmail.tpl');

                if($campania){
                    $subject = 'New Booking ' . $reservacion->localizador . ' [contrato '.$campania->localizador.']';
                }else{
                    $subject = 'New Booking '. $hotel->nombres->es . ' ' . $reservacion->localizador;    
                }

                $emailDistribuidor = explode(',', $hotel->distribuidor->emailReservas);

                $mail = new Core_Mailer();
                if($emailDistribuidor && count($emailDistribuidor)) {                        
                    foreach ($emailDistribuidor as $email) {
                        if(strlen(trim($email)) > 0) {
                            $enviado = $mail->send_email($email, $subject, $body);
                        }
                    }                        
                }
                    
                if($reservacion->estado == 'Aprobada') {//cuando no es onrequest
                    $mail = new Core_Mailer();
                    foreach ($emails as $email) {
                        if(strlen(trim($email)) > 0) {
                            $enviado = $mail->send_email($email, $subject, $body);
                        }
                    }
                    
                    if($reservacion->extras) {

                        foreach ($reservacion->extras as $excursion) {
                            if($excursion->emails && explode(',', $excursion->emails)) {
                                $mail = new Core_Mailer();
                                $smarty->assign('excursion', $excursion);
                                $body = $smarty->fetch('confirmacionExcursion_nodesign.tpl');
                                $emails = explode(',', $excursion->emails);
                                $subject = 'New Booking ' . $excursion->localizador;
                                foreach ($emails as $email) {
                                    if(strlen(trim($email))) {
                                        $mail->send_email($email, $subject, $body);
                                    }
                                }
                            }
                        }
                    }
                }
                header('Location:'. $base_url . '/'.$lang_set.'/confirmacion/r_id:' . $result['reserva_id'] . $end_url);

            } else {
                $result['data'] = 'Hay errores en los datos. Revíselos por favor.';
            }
        
        }
        
        /** end registrar reserva **/
    } 
    if(isset($_GET['id']) || $invalid){
            if(isset($_GET['id'])) {
                $cartId = $_GET['id'];
                $cartId = hexdec($cartId) / 999;
                //echo $cartId;
                $cart = getCart($cartId);

                if(!$cart) {
                    header('Location:'.$base_url);
                    return;
                }
                $_SESSION['cartID'] = $cart->id;
                $excursiones = array();
                if($cart->excursionesArray)
                foreach ($cart->excursionesArray as $exc) {
                    $entradas = $exc->entradas;
                    $earray = array();
                    foreach ($entradas as $en) {
                        $earray[] = get_object_vars($en);
                    }
                    $excur = get_object_vars($exc);
                    $excur['entradas'] = $earray;
                    $excursiones[] = $excur;
                }
                $_SESSION['excursiones'] = $excursiones;
                
            } else {
                $cart = getCart($_POST['cartID']); 
                if(!$cart) {
                    header('Location:'.$base_url);
                    return;
                }
            }
            
            if($cart) {
                $apartamento = get_object_vars($cart->apartamentoObj);
                $inicio = $cart->inicio;
                $salida = $cart->salida;
                $noches = $cart->noches;

                $time_inicio = strtotime($inicio);
                $time_salida = strtotime($salida);

                $inicio = strftime("%A, %d-%m-%G", strtotime($inicio));
                $salida = strftime('%A, %d-%m-%G', strtotime($salida));

                $smarty->assign('inicio',$inicio);
                $smarty->assign('salida',$salida);
                $smarty->assign('noches',$noches);

                if($cart->monedaId){
                    $moneda = getMoneda($cart->monedaId);
                    $smarty->assign("moneda", $moneda);
                    $currency = $moneda->simbolo;
                    $smarty->assign("currency", $currency);
                    $smarty->assign("currencyHotel", $hotel->moneda->simbolo);
                    $money = $moneda->codigo;
                    $smarty->assign("money", $money);
                    $smarty->assign("showSubPrice", $currency != $hotel->moneda->simbolo);
                    $_SESSION['money'] = $money;
                }

                //precio del apartamento
                /*if(isset($_REQUEST['m'])) {
                    $moneda = getMonedaByCodigo($_REQUEST['m']);
                } else {
                    $moneda = getMonedaByCodigo('EUR');
                }*/
                //$moneda = getMonedaByCodigo($money);

                $precioApto = $currencyDetector->getAmount($apartamento['precio']);

                $precio = 0;

                if($hotel->tipoReserva == 'Offline')
                    $cobro_anticipado = 0;
                else
                    $cobro_anticipado = ($hotel->porcentageCobroAnticipado) / 100;
                
                if($cart->apartamentoObj->pagoOnline) {
                    $hotel->porcentageCobroAnticipado += $cart->apartamentoObj->pagoOnline;
                    $cobro_anticipado += ($cart->apartamentoObj->pagoOnline / 100);
                }
                
                $precio = $precioApto;

                //$precio *= $c;
                $cobro_anticipado *= $precio;
                $smarty->assign('cobro_anticipado_hotel', number_format($cobro_anticipado, 2, ',', ''));
                $apartamento['precioTotal'] = str_replace(',', '.', (string) $precio); 
                $apartamento['precioTotal_format'] = $hotel->moneda->simbolo . number_format($precio, 2, ',', ''); 

                $apartamento['precioTotal_format_usuario'] =  $currency  . convertFromMonedaToMoneda($precio, $hotel->moneda->codigo, $money);

                if($hotel->moneda->codigo != $money){
                    $smarty->assign('precioTotal_format_moneda', $currency . convertFromMonedaToMoneda($precio, $hotel->moneda->codigo, $money));    
                }

                $smarty->assign('cantidad', $c);
                $smarty->assign('apartamento',$apartamento);
                
                $reservas_excursiones = $cart->excursionesArray;

                $smarty->assign('reservas_excursiones', $reservas_excursiones);

                foreach ($reservas_excursiones as $rexc) {
                    $precio += $rexc->total;
                    if($rexc->forma_cobro=='online'){
                        $cobro_anticipado += ($rexc->total * $rexc->porcientoInicial / 100);
                    }
                }
                
                $smarty->assign('precio_total', $hotel->moneda->simbolo. number_format($precio, 2, ',', ''));
                
                if($hotel->moneda->codigo != $money){
                    $smarty->assign('precio_total_moneda', $currency  . convertFromMonedaToMoneda($precio, $hotel->moneda->codigo, $money));    
                }

                $smarty->assign('pagar_ahora', $cobro_anticipado > 0);
                $smarty->assign('cobro_anticipado', $hotel->moneda->simbolo . " " . number_format($cobro_anticipado, 2, ',', ''));


                //buscar excursiones
                if($hotel->config->id) {
                    //$params = getParametrosVikaByHotelId($hotel->id);
                    $excursiones = getProductosFullByConfiguracionId($hotel->config->id);
                    /*
                        $client = new nusoap_client($service_url."/soap-evento");
                        $client->debug_flag = true;
                        $result = $client->call('excursiones', array('params' => $params));
                        $result = json_decode($result);
                        $excursiones = $result->data;
                    */
                    $excursiones_interval = array();

                    if($excursiones)
                    foreach ($excursiones as $excursion) {
                        $excursion->precio_minimo_custom  = $currency.convertFromMonedaToMoneda($excursion->precio_minimo, $hotel->moneda->codigo, $money);
                        $excursion->precio_minimo  = $hotel->moneda->simbolo.convertFromMonedaToMoneda($excursion->precio_minimo, $hotel->moneda->codigo, $hotel->moneda->codigo);
                    
                        $in_interval = false;
                        /*Restricción de compra:
                        if($excursion->restriccionCompra)
                            $time = strtotime("+" . $excursion->restriccionCompra - 1 . " days");
                        else*/
                        $time = strtotime (date("Y-m-d"));
                        $horarios = array();

                        foreach ($excursion->tickets as $ticket) {
                            $fechas = array();
                            
                            foreach ($ticket->horario as $horario) {
                                if(!in_array($horario, $horarios)) array_push($horarios, $horario);
                            }

                            foreach ($ticket->fechas as $fecha) {
                                $time_fecha = strtotime($fecha->fecha);
                                if($time_fecha >= $time_inicio && $time_fecha <= $time_salida && $time_fecha >= $time) {
                                    array_push($fechas, $fecha);
                                    $in_interval = true;
                                }
                            }
                            $ticket->fechas = $fechas;

                            //if(isset($_GET['m']) && strcmp($_GET['m'], 'EUR') != 0){
                            $ticket->total_custom  = $currency.convertFromMonedaToMoneda($ticket->precio, $hotel->moneda->codigo, $moneda->codigo);
                            $ticket->total  = $hotel->moneda->simbolo.convertFromMonedaToMoneda($ticket->precio, $hotel->moneda->codigo, $hotel->moneda->codigo);
                            $ticket->total_plano  = $ticket->precio;
                    
                             //   $ticket->total = $ticket->precio;
                           // }

                            $ticket->horarios_json = json_encode($ticket->horario);
                        }
                        $excursion->horarios = $horarios;
                        

                        if($in_interval) {
                            array_push ($excursiones_interval, $excursion);
                        }
                    }

                    $excursiones = $excursiones_interval;
                    $smarty->assign('excursiones', $excursiones);

                    //registrar cupon para excursiones

                    $reglas = $hotel->config->reglas;

                    if($reglas && count($reglas)) {

                        $reglas_order = array_reverse($reglas);
                        $regla = false;
                        foreach ($reglas_order as $ro) {
                            if($ro->monto < $apartamento['precioTotal']) {
                                $regla = $ro;
                                break;
                            }
                        }
                        
                        //$smarty->assign('cupon', $cupon);
                        $smarty->assign('regla_cupon', $regla);
                        //Temporal arreglar...
                        if($regla && count($regla->cupones)) {
                            $cupon = false;
                            foreach ($regla->cupones as $c) {
                                if($c->estado == 'activo') $cupon = $c; 
                            }

                            if($cupon){
                                $smarty->assign('cupon', $cupon);
                                $smarty->assign('regla_cupon', $regla);   
                            }
                        }
                        /*if($regla) {
                            $client = new nusoap_client($service_url."/soap-cupon");
                            $params = getParametrosVikaByHotelId($hotel->id);
                            $params['descuento'] = $regla->descuento;
                            $params['descuentoTipo'] = $regla->tipoDescuento;
                            $client->debug_flag = true;
                            $result = $client->call('registrarPorCanal', array('params' => $params));

                            $result = json_decode($result);

                            $cupon = $result->data;

                            $smarty->assign('cupon', $cupon);
                            $smarty->assign('regla_cupon', $regla);
                        }*/
                    }
                }

                $smarty->assign('cart', $cart);

                $paises = getPaises();
                $smarty->assign('paises', Core_Util_General::countries());

                if($invalid) {
                    $backData = array(
                        'nombre' => NULL,
                        'apellido' => NULL,
                        'email' => NULL,
                        'telefono' => NULL,
                        'paisId' => NULL,
                        'peticionesEspeciales' => NULL
                    );

                    foreach ($backData as $k=>$val) {
                        if(isset($_POST[$k]))
                            $backData[$k] = $_POST[$k];
                    }

                    $smarty->assign('backData', $backData);
                }

                $smarty->display('reservar.tpl');
            }
    } else if (!isset ($_POST['cartID'])){
            header('Location: '.$base_url);
    }

} else {
   header('Location: '.$redirect_to);
}


	
?>