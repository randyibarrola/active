<?php

    $reserva = getReserva(decryptId($_GET['id']));
    
    
    if(!$reserva) {
        
        header('Location:'.$base_url);
    }
    else {
        $reserva->id = $_GET['id'];
        $hotel = getHotelById($reserva->hotelId);
        $smarty->assign('hotel',$hotel);
        
        if($reserva->alojamiento && count($reserva->alojamiento))
            $apartamento = $reserva->alojamiento[0];
        else $apartamento = NULL;

        $smarty->assign('id', $_GET['id']);

        $smarty->assign('usuario', $usuario);
        $smarty->assign('apartamento', $apartamento);
        $smarty->assign('cart', $reserva->cart);

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
        $campania = $hotel->campania;
        $hotel->distribuidor = $hotel->distribuidor;
        $cart = getCart($reserva->cartId);
        
        if($cart->apartamentoObj->pagoOnline) {
            $hotel->porcentageCobroAnticipado += $cart->apartamentoObj->pagoOnline;
            $cobroAnticipado += ($cart->apartamentoObj->pagoOnline / 100);
            $hotel->tipoReserva = 'online';
            $smarty->assign('hotel', $hotel);
        }
        //$smarty->assign('hotel', $hotel);
        $images = getAllHotelImages($hotel->id);
        $servicios = getAllHotelServicios($hotel->id);
        $smarty->assign('images',$images);
        $smarty->assign('servicios',$servicios);

        if(isset($_REQUEST['print']))
            $smarty->display('cancelacionPrint.tpl');
        else
            $smarty->display('cancelacion.tpl');
    }
?>