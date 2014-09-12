<?php

$action = $_POST['action'];

$result = array('msg' => 'error', 'data' => 'Acción no valida');


if (strcmp($action, 'update') == 0) {
    $data = array(
        'backgroundColor' => NULL,
        'nombre' => NULL,
        'url' => NULL,
        //'descripcionCorta' => NULL,
        'estado' => NULL,
        'descripcionLarga' => NULL,
        'empresaId' => NULL,
        'configuracionId' => NULL,
        'tripAdvisor' => NULL,
        'contenidoHtml' => NULL,
        'dominio' => NULL,
        'ventaAnticipada' => 0,
        'estanciaMinima' => 0,
        'dominioOficial' => NULL,
        'dominioCampania' => NULL,
        'logoId' => NULL,
        'porcentageCobroAnticipado' => 0,
        'informacionCompra' => NULL,
        /*'tituloSeo' => NULL,
        'keywordsSeo' => NULL,*/
        'tipoReserva' => NULL,
        //'claveGoogleAnalytics' => NULL,
        'descuentoBooking' => 0,
        'tipoDescuentoBooking' => NULL,/*
        'inicioContrato' => NULL,
        'finContrato' => NULL,*/
        'emailReservas' => NULL,
        'emailContacto' => NULL,
        'telefonoReservas' => NULL,
        'campaniaId' => NULL,
        //'seo' => 0,
        'bookingOnrequest' => 0,
        'idiomaId' => NULL,
        'monedaId' => NULL,
        'chat' => 0,
        'headerVikahotel' => 0,
        'mostrarHotelesRelacionados' => 0,
        'respetarCupo' => 0,
        'destacado' => 0,
        'adwords' => NULL,
        'calidad' => 0,
        'webOficial' => 0,
        'lugares' => NULL
    );

    $data_direccion = array(
        'descripcion' => NULL,
        'lat' => NULL,
        'lon' => NULL
    );

    foreach ($data as $key => $value) {
        if (isset($_POST[$key])) {
            $data[$key] = $_POST[$key];
        }
    }
        
    if(isset($_POST['destinoId']) && $_POST['destinoId'])
        $data['destinoId'] = $_POST['destinoId'];
    else {
        $data['destinoId'] = NULL;
    }
    
    /*
    if($data['inicioContrato']) {
        $f = explode('-', $data['inicioContrato']);
        $f = $f[2] . '-' . $f[1] . '-' . $f[0];
        $data['inicioContrato'] = $f; 
    }
    
    if($data['finContrato']) {
        $f = explode('-', $data['finContrato']);
        $f = $f[2] . '-' . $f[1] . '-' . $f[0];
        $data['finContrato'] = $f; 
    }*/
    
    if(!is_numeric($data['logoId'])) $data['logoId'] = NULL;
    

    foreach ($data_direccion as $key => $value) {
        if (isset($_POST[$key])) {
            $data_direccion[$key] = $_POST[$key];
        }
    }
    
    if(isset($_POST['fechas']))
        $fechas = $_POST['fechas'];
    else $fechas = array();

    $idiomas = array();

    if (isset($_POST['idiomas']))
        $idiomas = $_POST['idiomas'];

    $monedas = array();

    if (isset($_POST['monedas']))
        $monedas = $_POST['monedas'];
    
    $condiciones = array();
    if(isset($_POST['condiciones']))
        $condiciones = $_POST['condiciones'];
    
    $dominios = array();
    if(isset($_POST['dominios']))
        $dominios = $_POST['dominios'];
    
    $promociones = array();
    if(isset($_POST['promociones'])) {
        $promociones = $_POST['promociones'];
        foreach ($promociones as $k=>$p) {
            $f = explode('-', $p['inicio']);
            $f = $f[2] . '-' . $f[1] . '-' . $f[0];
            $promociones[$k]['inicio'] = $f;
            
            $f = explode('-', $p['fin']);
            $f = $f[2] . '-' . $f[1] . '-' . $f[0];
            $promociones[$k]['fin'] = $f;
            
            if(!$p['condicionPagoOnline'])
                $promociones[$k]['condicionPagoOnline'] = 0;
        }
    }
    
    $precios = array();
    if(isset($_POST['precios'])) {
        $precios = $_POST['precios'];
        foreach ($precios as $k=>$p) {
            if(strlen(trim($p['inicio']))) {
                $f = explode('-', $p['inicio']);
                $f = $f[2] . '-' . $f[1] . '-' . $f[0];
                $precios[$k]['inicio'] = $f;
            } else {
                $precios[$k]['inicio'] = NULL;
            }
            
            if(strlen(trim($p['fin']))) {
                $f = explode('-', $p['fin']);
                $f = $f[2] . '-' . $f[1] . '-' . $f[0];
                $precios[$k]['fin'] = $f;
            } else {
                $precios[$k]['fin'] = NULL;
            }
            
            
        }
    }
    
    if($data['campaniaId']) {
        $campania = getCampania($data['campaniaId']);
        if($campania) {
            $data['inicioContrato'] = $campania->inicio;
            $data['finContrato'] = $campania->fin;
        }
    }
    
    $data_blacklist = array();
    if(isset($_POST['blacklist'])) {
        $data_blacklist = $_POST['blacklist'];
    }
    
    if (isset($_POST['idHotel'])) {
        $idHotel = $_POST['idHotel'];
        $hotel = updateHotel($idHotel, $data, $data_direccion, $idiomas, $monedas, $fechas, 
                $condiciones, $dominios, $promociones, $data_blacklist, $precios);
    } else {
        if(isset($_POST['clave']))
            $data['clave'] = $_POST['clave'];
        $hotel = insertHotel($data, $data_direccion, $idiomas, $monedas, $fechas, 
                $condiciones, $dominios, $promociones, $data_blacklist, $precios);
    }

    if ($hotel) {
        
        if($campania->subdominio != $data['dominioCampania']) {
            updateDominioCampania($campania->id, $data['dominioCampania']);
        }
        
        updateAdwordHotel($_POST['idAdword'], $hotel);
        
        $result['msg'] = 'ok';
        $result['data'] = 'Se guardaron los cambios correctamente';
        $result['hotelId'] = $hotel;
    } else {
        $result['data'] = 'No se guardaron los cambios. Verifique sus datos y vuelva  a intentarlo.';
    }
}

else if (strcmp($action, 'eliminar') == '0') {
    if (isset($_POST['id'])) {
        $id = $_POST['id'];
        $eliminar = deleteHotel($id);

        if ($eliminar) {
            $result['msg'] = 'ok';
            $result['data'] = 'Se eliminó el hotel';
        } else {
            $result['data'] = 'No se pudo eliminar el hotel';
        }
    }
}

else if (strcmp($action, 'favorito') == '0') {
    if($_POST['favoritoId']) {
        $h = getHotelById($_POST['favoritoId']);
        updateHotelData($h->id, array('destacado' => $h->destacado ? 0 : 1));
    }
    $result = array('msg'=>'ok');
}

else if (strcmp($action, "getFotos") == 0) {
    if (isset($_POST['idHotel'])) {
        $himages = getAllHotelImages($_POST['idHotel'], true);
    
        
        if ($himages) {
            $images = array();

            foreach ($himages as $image) {
                if($image->nombre && strlen(trim($image->nombre)))
                    array_unshift ($images, $image);
                else
                    array_push ($images, $image);
            }
            $smarty->assign('adjuntos', $images);
            $html = $smarty->fetch('admin/hotel/fotos.tpl');
            $smarty->assign('adjuntos', $images);
            $result['msg'] = 'ok';
            $result['data'] = 'Adjuntos encontrados';
            $result['html'] = $html;
        } else {
            $result['msg'] = 'ok';
            $result['data'] = 'Adjuntos no encontrados';
            $result['html'] = '<h1 class="text-center">Hotel no cuenta con adjuntos<br />Click aquí para continuar</h1>';
        }
    }
}

else if (strcmp($action, "deleteFoto") == 0) {
    if (isset($_POST['idArchivo'])) {
        $idArchivo = $_POST['idArchivo'];
        if (deleteFoto($idArchivo)) {
            $dir = str_replace($base_url, $app_dir, $_POST['ruta']);
            $dir = str_replace('//', '/', $dir);
                if(file_exists($dir))
                    unlink($dir);
                $result['msg'] = 'ok';
                $result['data'] = 'El archivo fue eliminado correctamente.';
            
        } else {
            $result['msg'] = 'error';
            $result['data'] = 'Archivo no encontrado.';
        }
    } else {
        $result['msg'] = 'error';
        $result['data'] = 'Apartamento o adjunto no encontrado.';
    }
}

else if (strcmp($action, 'uploadLogo') == 0) {
    $iWidth = 178;
    $iHeight = 130;
    $iJpgQuality = 90;
    
    if($_FILES){
        if(is_uploaded_file($_FILES['logo']['tmp_name'])) {
            
            $ext = explode('.',$_FILES['logo']['tmp_name']);
            
            
            $FileName =  md5(time().rand());
            
            $sTempFileName = $app_dir . '/cache/' . $FileName;
            //$st = opendir('cache/teatros/'. $_POST['edificioId'], "a");
            
            move_uploaded_file($_FILES['logo']['tmp_name'], $sTempFileName);
            
            @chmod($sTempFileName, 0644);
            
            if (file_exists($sTempFileName) && filesize($sTempFileName) > 0) {
                $aSize = getimagesize($sTempFileName); // try to obtain image info
                if (!$aSize) {
                    @unlink($sTempFileName);
                    return;
                }
                $isimage = true;
                // check for image type
                switch($aSize[2]) {
                    case IMAGETYPE_JPEG:
                        $sExt = '.jpg';

                        break;
                    
                    case IMAGETYPE_PNG:
                        $sExt = '.png';

                        break;
                    default:
                        @unlink($sTempFileName);
                        $isimage = false;
                }
                if($isimage) {
                    
                    if(!file_exists($template_dir . '/images/hotel'))
                        mkdir ($template_dir . '/images/hotel');
                    
                    $ext = $sExt;
                    copy($sTempFileName, $template_dir . '/images/hotel/' . $FileName . $ext);                    
                    $name = $FileName . $ext;
                    
                    $data_adjunto = array('nombre'=>$name,
                        'ruta'=> $template_url ."/images/hotel/". $FileName . $ext,
                        'extension'=>$ext,
                        'tipo' => 'logo'
                    );
                    if(isset($_REQUEST['idHotel']) && strlen($_REQUEST['idHotel']))
                        $idHotel = $_REQUEST['idHotel'];
                    else $idHotel = 0;
                    $id_logo = insertLogo($data_adjunto, $idHotel);
                    
                    @unlink($sTempFileName);
                    
                    $result['msg'] = 'ok';
                    $result['data'] = $data_adjunto['ruta'];
                    $result['idLogo'] = $id_logo;
                }
            }
        }
    }
}

else if (strcmp($action, 'recuperarClave') == 0) {
    $idHotel = $_POST['idHotel'];
    
    $clave = getClaveByHotel($idHotel);
    $hotel = getHotelById($idHotel);
    
    $subject = 'Recuperación de clave de encriptación del hotel ' . $hotel->nombre;
    $body = 'Clave de encriptación de datos: ' . $clave;
    $body .= '<br>Hotel: ' . $hotel->nombre;
    $body .= '<br><br> Enviado desde '.$smarty->getConfigVariable('sistema_nombre');
    
    
    $emails = explode(',', $hotel->distribuidor->emailReservas);
    foreach ($emails as $email) {
        if(strlen(trim($email)) > 3) {
            $mail = new Core_Mailer();
            $mail->send_email(trim($email), $subject, $body);
        }
    }
    
    $result['msg'] = 'ok';
    $result['data'] = 'Se ha enviado la clave de encriptación al distribuidor. Verifique su email.';
    
}

else if(strcmp($action, 'search') == 0) {

    $term = $_POST['term'];

    if($usuario->usuarioGrupoId == 1)
        $hoteles = buscarHoteles($term);   
    else if ($usuario->usuarioGrupoId == 3)
        $hoteles = buscarHoteles($term, $usuario->id);
    
    $hs = array();
    foreach ($hoteles as $hotel) {
        if($hotel->campania->estado == 'Aprobada')
            $hs[] = $hotel;
    }
    
    $result['msg'] = 'ok';
    $result['lista'] = $hs;
}

else if (strcmp($action, 'filtrarPorDestino') == 0) {
    $id = 0;
    if(isset($_POST['id']));
        $id = $_POST['id'];
    $args = $_POST;
    
    if($args['favoritoId']) {
        $h = getHotelById($args['favoritoId']);
        updateHotelData($h->id, array('destacado' => $h->destacado ? 0 : 1));
    }
    
    $usuario = $usuario_core->getUsuario();
    $hoteles = filtrarHotelesPorDestino($usuario->id, $id, $args);
    $cont = count(filtrarHotelesPorDestino($usuario->id, $id, array('sSearch' => $args['sSearch'], 'findDestacados' => $args['findDestacados'])));
    foreach ($hoteles as $p=>$h) {
        $dominios = getDominiosByHotel($h['id']);
        $domains = '';
        if($dominios) {
            foreach ($dominios as $d) {
                $domains .= ($d . '<br>');
            }
        }
        $hoteles[$p]['dominio'] = $domains;
        $hoteles[$p]['contrato'] = date('d/m/Y', strtotime($h['inicio'])) . ' - ' . date('d/m/Y', strtotime($h['fin']));
        $smarty->assign('hotel', $h);
        $hoteles[$p]['acciones'] = $smarty->fetch('admin/hotel/acciones.tpl');
    }
    
    if(isset($_POST['table'])) {
        $_SESSION['lastHoteles'] = $hoteles;
        
        $result = array(
            "iTotalRecords"=> $cont,
            "iTotalDisplayRecords"=> $cont,
            'aaData' => $hoteles
        );
    } else {
    
        $smarty->assign('hoteles', $hs);
        $html = $smarty->fetch('admin/hotel/filtros.tpl');
        $result['html'] = $html;
        $result['msg'] = 'ok';
    }
}

else if(strcmp($action, 'urlValidacion') == 0) {
    if(isset($_POST['id'])) {
        $id = $_POST['id'];
        $hotel_v = getHotelById($id);
        $login_code = getLoginCodeByHotelId($id);
        $nombre = $hotel_v->nombre;
        $body = "
            Hotel: $nombre <br>
            Para validar sus reservas haga click en el siguiente link o copie y pegue la dirección en su navegador:<br>
            <a href='$vikahotel_url/validar?login_code=$login_code'>$base_url/validar?login_code=$login_code</a><br>
            <i>Enviado desde ".$smarty->getConfigVariable('sistema_nombre')."</i>
        ";
        
        try {
        $mail = new Core_Mailer();
        $mail->send_email($hotel_v->distribuidor->emailReservas, 'Url de validación de reservas de ' . $nombre, $body);
        } catch (Exception $e) {
            print_r($e);
        }
        
        $result = array(
            'msg' => 'ok',
            'data' => 'Se le ha enviado un email al hotel con la url de validación de reservas'
        );
        
    }
}

else if(strcmp($action, 'updatefields') == 0) {
    if(isset($_POST['edit'])) {
        $edit = $_POST['edit'];
        foreach ($edit as $idHotel=>$data) {
            $updated = updateHotelData($idHotel, $data);
        }
        
        if($updated)
            $result = array(
                'msg'=>'ok',
                'data' => 'Los datos fueron actualizados correctamente'
            );
    }
}

else if($_FILES) {
    if(is_uploaded_file($_FILES['file']['tmp_name'])) {
        $iWidth = 0;
        $iHeight = 0;
        $iJpgQuality = 90;
        $FileName =  md5(time().rand());
        
        $sTempFileName = 'cache/' . $FileName;
        //$st = opendir('cache/teatros/'. $_POST['edificioId'], "a");

        move_uploaded_file($_FILES['file']['tmp_name'], $sTempFileName);

        @chmod($sTempFileName, 0644);
        
        if (file_exists($sTempFileName) && filesize($sTempFileName) > 0) {
            
            $aSize = getimagesize($sTempFileName); // try to obtain image info
            if (!$aSize) {
                @unlink($sTempFileName);
                return;
            }
            $iWidth = $aSize[0];
            $iHeight = $aSize[1];
            $isimage = true;
            // check for image type
            switch($aSize[2]) {
                case IMAGETYPE_JPEG:
                    $sExt = '.jpg';

                    // create a new image from file 
                    $vImg = @imagecreatefromjpeg($sTempFileName);
                    break;
                /*case IMAGETYPE_GIF:
                    $sExt = '.gif';

                    // create a new image from file 
                    $vImg = @imagecreatefromgif($sTempFileName);
                    break;*/
                case IMAGETYPE_PNG:
                    $sExt = '.png';

                    // create a new image from file 
                    $vImg = @imagecreatefrompng($sTempFileName);
                    break;
                default:
                    @unlink($sTempFileName);
                    $isimage = false;
            }
            if($isimage) {
                
                if(!file_exists($template_dir . '/images/hotel'))
                        mkdir ($template_dir . '/images/hotel');
                
                // create a new true color image
                $vDstImg = @imagecreatetruecolor( $iWidth, $iHeight );

                // copy and resize part of an image with resampling
                imagecopyresampled($vDstImg, $vImg, 0, 0, 0, 0, $iWidth, $iHeight, $iWidth, $iHeight);

                // define a result image filename
                $sResultFileName = $template_dir . '/images/hotel/' .$FileName . $sExt;

                // output image to file
                imagejpeg($vDstImg, $sResultFileName, $iJpgQuality);

                @unlink($sTempFileName);
                
                if(isset($_REQUEST['idHotel'])) {
                    $hotel_id = $_REQUEST['idHotel'];
                    $name = $FileName;
                    $ext = $sExt;
                    $data_adjunto = array('nombre'=>$name,
                        'ruta'=> $template_url . '/images/hotel/' .$FileName . $sExt,
                        'extension'=>$ext,
                        'tipo'=>'imagen');
                    $imagenId = insertHotelImage($data_adjunto, $hotel_id);
                    
                    $result['msg'] = $imagenId;
                }
            }
        }
    }
}

echo json_encode($result);
?>