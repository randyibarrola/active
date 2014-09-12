<?php

$action = $_POST["action"];
$result = array("msg" => "error", "data" => "Tu no tienes suficientes permisos.");

if(strcmp($action, "eliminar") == 0) {
    $excursion_id = $_POST['id'];
    
    $excursiones = $_SESSION['excursiones'];
    
    $new_excursiones = array();
    
    $precioApto = str_replace(array('€','$'), '', trim($_POST['precio_apartamento'])) ;
    $cobroAnticipado = $hotel->porcentageCobroAnticipado / 100;
    $precio = 0;
    $moneda = "";
    
    //if(is_numeric(str_replace(",", ".", $precio))) 
    $precio = str_replace(",", ".", $precioApto);
    //else if(strlen(trim($p))) $moneda = $precio;

    /*foreach ($precioApto as $p) {
        echo 'precio-apto->'.$p;    
        if(is_numeric(str_replace(",", ".", $p))) $precio = str_replace(",", ".", $p);
        else if(strlen(trim($p))) $moneda = $p;
    }*/
    

    $cobroAnticipado *= $precio;
    $smarty->assign('cobro_anticipado_hotel', number_format($cobroAnticipado, 2, ',', ''));

    foreach ($excursiones as $e_k => $exc) {
        if($exc['timeId'] != $excursion_id) {
            $precio += $exc['total'];
            if($exc['forma_cobro'] == 'online'){
                //$cobroAnticipado += ($exc['total'] * $exc['porcientoInicial'] / 100);;
                $precio_anticipado = $exc['total'] * $exc['porcientoInicial'] / 100; 
                $exc['totalInicial'] = $hotel->moneda->simbolo.convertFromMonedaToMoneda($precio_anticipado, $hotel->moneda->codigo, $hotel->moneda->codigo).' <span class="subprice">('.$currency.convertFromMonedaToMoneda($precio_anticipado, $hotel->moneda->codigo, $money).')</span>';
                $cobroAnticipado += $precio_anticipado;
            }
            
            array_push($new_excursiones, $exc);
        }
    }
    
    $_SESSION['excursiones'] = $new_excursiones;
    
    $cart = getCart($_SESSION['cartID']);
    updateCart($cart->id, array('excursiones'=>$new_excursiones));
    
    $result['msg'] = 'ok';
    $result['data'] = array('precioTotal'=> $hotel->moneda->simbolo.convertFromMonedaToMoneda($precio, $hotel->moneda->codigo, $hotel->moneda->codigo).' <span class="subprice">('.$currency.convertFromMonedaToMoneda($precio, $hotel->moneda->codigo, $money).')</span>');
    $result['online'] = ($cobroAnticipado > 0 || $hotel->tipoReserva == 'online');
    $apartamento = $cart->apartamentoObj;
    $smarty->assign('pagar_ahora', $cobroAnticipado > 0);
    $smarty->assign('cobro_anticipado', $moneda . " " . number_format($cobroAnticipado, 2, ',', ''));
    $smarty->assign('apartamento', $apartamento);
    $smarty->assign('reservas_excursiones', $new_excursiones);
    $smarty->assign('currencyHotel', $hotel->moneda->simbolo);
    $html = $smarty->fetch('cobraremos.tpl');
    
    $result['html'] = $html;
    
}

else if (strcmp($action, "validarCupon") == 0) {
    /*$data = array(
        'codigo' => NULL,
        'tarifaId' => NULL,
        'sesion' => NULL,
        'fecha' => NULL
    );
    */

    $cupon = getCuponByCodigo($_POST['codigo']);
    if($cupon && $cupon->estado == 'activo') {
        $regla = getRegla($cupon->reglasCuponesId);
        
        $result['result'] = 'ok';
        
        if($regla->tipoDescuento == '%'){
            $result['data'] = array('descuento' => $regla->descuento, 'descuentoTipo' => $regla->tipoDescuento);
        }else{
            $result['data'] = array('descuento' => $regla->monto, 'descuentoTipo' => $regla->tipoDescuento);
        }
        
        $result['msg'] = 'ok';
        
        $excursiones = $_SESSION['excursiones'];
        foreach($excursiones as $excursion) {
            if(strcmp(strtolower($excursion['cupon']), strtolower($cupon->codigo)) == 0) {
                $result['result'] = 'error';
                $result['msg'] = 'El Código de cupón no es valido o ya fue utilizado.';
                $result['data'] = null;
                break;
            }
        }
        
        
        
        /*if(strcmp($result->data->descuentoTipo, '%') != 0){
            $result->data->descuento = convertFromMonedaToMoneda($result->data->descuento, 'EUR', $_GET['m']);
        }else{
            $result->data->descuento = convertFromMonedaToMoneda($result->data->descuento, 'EUR', $_GET['m']);
        }*/
    } else {
        $result['msg'] = 'El Código de cupón no es valido o ya fue utilizado.';
    }
}

else if (isset($_POST['eventoId'])) {
    $eventoId = $_POST['eventoId'];
    
    /*
        $client = new nusoap_client($service_url."/soap-evento");
        $distribuidor = getParametrosVikaByHotelId($hotel->id);
        $params  = $distribuidor;
        $params['id'] = $eventoId;
        $client->debug_flag = true;
        $results = $client->call('get', array('params' => $params));    
        $results = json_decode($results);
        $evento = $results->data;
    */
    $evento = getEvento($eventoId);

    
    $data = array(
        'timeId' => time(),
        'eventoId' => $evento->id,
        'evento' => $evento->nombre,
        'fecha' => null,
        'tarifaId' => null,
        'canal' => 'hotel',
        'sesion' => null,
        'cupon' => NULL,
        'total' => 0,
        'forma_cobro' => $evento->tipoReserva,
        'porcientoInicial' => $evento->porcentajeCobroAnticipado,
        'forma_cobro_offline' => $evento->tipoReserva=='online' ? 0 : 1,
        'eventoTpv' => $evento->sugerenciasTpv,
        'direccion' => $evento->direccion->descripcion,
        'emails' => $evento->emails,
        'telefonoReservas' => $evento->telefonoReservas
    );
    
    foreach(array_keys($data) as $key) {
        if(isset($_POST[$key]))
            $data[$key] = $_POST[$key];
    }
    
    if(!is_null($data['fecha'])) {
        $fecha = explode("/", $data['fecha']);
        $data['fecha'] = $fecha[2]."-".$fecha[1]."-".$fecha[0];
    }
    
    if(isset($data['cupon']))
        $data['cupon'] = strtolower ($data['cupon']);
    
    $total_format = $hotel->moneda->simbolo.convertFromMonedaToMoneda($_POST['total'], $hotel->moneda->codigo, $hotel->moneda->codigo).' <span class="subprice">('.$currency.convertFromMonedaToMoneda($_POST['total'], $hotel->moneda->codigo, $money).')</span>';
    $data['total_format'] = $_POST['total_format'] = $total_format;
    //$params = $distribuidor;
    
    /*if(isset($distribuidor['canalId']))
        $data['canalId'] = $distribuidor['canalId'];
    else*/
    //$params['canal'] = 'hotel';
    
    $data_entradas = array();
    
    if(isset($_POST['entradas'])) {
        $entradas = $_POST['entradas'];
        foreach ($entradas as $key=>$value) {
            if($value > 0) {
                $entrada = array('tarifaEntradaId'=>$key, 'entradas'=>$value);
                if($evento->tickets && is_array($evento->tickets))
                    foreach ($evento->tickets as $ticket) {
                        if($ticket->id == $key) {
                            $ticket_nombre = json_decode($ticket->nombre);
                            
                            //foreach ($ticket->zonas as $zona) {
                                //if($zona->id == $key) {
                                    $entrada['descripcion'] = $ticket_nombre->$lang_set . ": " . $value;
                                    break;
                                //}
                            //}
                            //break;
                        }
                    }
                array_push($data_entradas, $entrada);
            }
        }
    }
    
    
    
    $data['entradas'] = $data_entradas;
     
    
    if(!isset($_SESSION['excursiones'])) {
        $_SESSION['excursiones'] = array();
    }
    
    $excursiones = $_SESSION['excursiones'];
    array_push($excursiones, $data);
    
    $_SESSION['excursiones'] = $excursiones;
    
    $entradas_resp = $data_entradas;

    $precioApto = str_replace(array('€','$'), '', trim($_POST['precio_apartamento']));
    $cobroAnticipado = $hotel->porcentageCobroAnticipado / 100;
    $precio = 0;
    $moneda = "";
    /*foreach ($precioApto as $p) {
        if(is_numeric(str_replace(",", ".", $p))) $precio = str_replace(",", ".", $p);
        else if(strlen(trim($p))) $moneda = $p;
    }*/
    $precio = $precio = str_replace(",", ".", $precioApto);

    $cobroAnticipado *= $precio;
    $smarty->assign('cobro_anticipado_hotel', number_format($cobroAnticipado, 2, ',', ''));
    
    foreach($excursiones as $e_k => $exc) {
        if($exc['forma_cobro']=='online'){
            $precio_anticipado = $exc['total'] * $exc['porcientoInicial'] / 100; 
            $excursiones[$e_k]['totalInicial'] = $hotel->moneda->simbolo.convertFromMonedaToMoneda($precio_anticipado, $hotel->moneda->codigo, $hotel->moneda->codigo).' <span class="subprice">('.$currency.convertFromMonedaToMoneda($precio_anticipado, $hotel->moneda->codigo, $money).')</span>';
            $cobroAnticipado += $precio_anticipado;
        }
        $precio += $exc['total'];
    }
    
    $precioApto = $hotel->moneda->simbolo.convertFromMonedaToMoneda($precio, $hotel->moneda->codigo, $hotel->moneda->codigo).' <span class="subprice">('.$currency.convertFromMonedaToMoneda($precio, $hotel->moneda->codigo, $money).')</span>';
    
    $data_resp = array(
        
        'id' => $data['timeId'],
        'evento' => $evento->nombre,
        'fecha' => $_POST['fecha'],
        'hora' => $data['sesion'],
        'entradas' => $entradas_resp,
        'total' => $_POST['total'],
        //'total_format' => $_POST['total_format'],
        'total_format' => $total_format,
        'precioTotal' => $precioApto,
        'cobroAnticipado' => $moneda . " " . number_format($cobroAnticipado, 2, ',', ''),
        'forma_cobro' => $evento->cobro->forma
    );
    
    $cart = getCart($_SESSION['cartID']);
    updateCart($cart->id, array('excursiones'=>$excursiones));
    $apartamento = $cart->apartamentoObj;
    
    $result['msg'] = 'ok';
    $result['data'] = $data_resp;
    $result['online'] = ($cobroAnticipado > 0 || $hotel->tipoReserva == 'online');
    
    $smarty->assign('pagar_ahora', $cobroAnticipado > 0 || $hotel->tipoReserva == 'online');
    $smarty->assign('cobro_anticipado', $moneda . number_format($cobroAnticipado, 2, ',', ''));
    $smarty->assign('apartamento', $apartamento);
    $smarty->assign('currencyHotel', $hotel->moneda->simbolo);
    $smarty->assign('reservas_excursiones', $excursiones);
    $html = $smarty->fetch('cobraremos.tpl');
    
    $result['html'] = $html;
    
} else {
    $result['data'] = "Faltan datos";
}



echo json_encode($result);



?>
