<?php
    $reserva = getReserva(decryptId($_GET['r_id']));
    
    if(!$reserva) {
        header('Location:'.$base_url);
    }
    else if(strcmp(strtolower($reserva->estado), 'cancelada por el cliente') == 0 || strcmp(strtolower($reserva->estado), 'cancelada por el administrador') == 0) {
        header('Location:'. $base_url . '/'.$lang_set.'/cancelacion/id:'.$_GET['r_id'].$end_url);
    } else {
        $reserva->id = $_GET['r_id'];
        if($reserva->alojamiento && count($reserva->alojamiento))
            $apartamento = $reserva->alojamiento[0];
        else $apartamento = NULL;

        $smarty->assign('id', $_GET['id']);


        $smarty->assign('apartamento', $apartamento);
        $smarty->assign('cart', $reserva->cart);

        $smarty->assign('id', $_GET['r_id']);

        $usuario = getUsuario($reserva->usuarioId);
        $smarty->assign('usuario', $usuario);

        $smarty->assign('reserva', $reserva);

        $inicio = $apartamento->inicio;
        $salida = $apartamento->final;


        $time_inicio = strtotime($inicio);
        $time_salida = strtotime($salida);

        $noches = ceil(($time_salida - $time_inicio) / (24 * 60 * 60));

        $inicio = date('l, d-F-Y',strtotime($inicio));
        $salida = date('l, d-F-Y',strtotime($salida));

        $smarty->assign('inicio',$inicio);
        $smarty->assign('salida',$salida);
        $smarty->assign('noches',$noches);

        unset($_SESSION['data_usuario']);
        $hotel = getHotelById($reserva->hotelId);
        $campania = $hotel->campania;
        $hotel->distribuidor = $hotel->distribuidor;
        $smarty->assign('hotel', $hotel);
        $images = getAllHotelImages($hotel->id);
        $servicios = getAllHotelServicios($hotel->id);
        $smarty->assign('images',$images);
        $smarty->assign('servicios',$servicios); 
        
        $cart = getCart($reserva->cartId);
        
        if($cart->apartamentoObj->pagoOnline) {
            $hotel->porcentageCobroAnticipado += $cart->apartamentoObj->pagoOnline;
            $cobroAnticipado += ($cart->apartamentoObj->pagoOnline / 100);
            $hotel->tipoReserva = 'online';
            $smarty->assign('hotel', $hotel);
        }


        if(isset($_GET['go'])) {
            $url = $base_url.'/'.$lang_set.'/confirmacion/r_id:' . $_GET['r_id'];
            $smarty->assign('url', $url);
        }

        if(isset($_REQUEST['print']))
            $smarty->display('confirmacionPrint.tpl');
        else {
            $page = (isset($_GET['mail']))?'confirmacion.tpl':'confirmacionHotel.tpl';
            $smarty->display($page);
        }
    }
?>