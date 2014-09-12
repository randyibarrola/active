<?php 
$action = $_POST['action'];
$result = array('msg' => 'error', 'data' => 'Acción no valida');

if (strcmp($action, 'update') == 0) {
    $data = array(
        'nombre' => NULL,
        'monedaId' => NULL,
        'direccionId' => NULL,
        'campaniaId' => NULL,
        'descripcionBreve' => NULL,
        'descripcionExtendida' => NULL,
        'sugerenciasTpv' => NULL,
        'instruccionesConsumo' => NULL,
        'youtube' => NULL,
        'tituloSeo' => NULL,
        'release' => 0,
        'porcentajeComision' => 15,
        'tipoReserva' => NULL,
        'porcentajeCobroAnticipado' => NULL,
        'bookingOnrequest' => NULL,
        'emailReservas' => NULL,
        'telefonoReservas' => NULL,
        'transfer' => NULL,
        'destinoTuristicoId' => NULL,
        'ventaAnticipada' => 0,
        'duracion' => NULL
    );

    foreach ($data as $key => $value) {
        if (isset($_POST[$key])) {
            $data[$key] = $_POST[$key];
        }
    }

    if(isset($_POST['duracionIndefinida'])){
        if(isset($_POST['duracion_medida']) && $_POST['duracion_medida'] == 'horas'){
            $dura = explode(":", $_POST['duracion']);
            $data['duracion'] = $dura[0]+($dura[1]/60);
        }else{
            $dias = $_POST['dias'];
            $duracion = $dias*24;
            $data['duracion'] = $duracion;
        }
    }else{
        $data['duracion'] = 0;
    }

    $data["guias"] = serialize($_POST["guias"]);

    $data_direccion = array(
        'descripcion' => NULL,
        'lat' => NULL,
        'lon' => NULL
    );

    foreach ($data_direccion as $key => $value) {
        if (isset($_POST[$key])) {
            $data_direccion[$key] = $_POST[$key];
        }
    }

    $condiciones = array();
    if(isset($_POST['condiciones']))
        $condiciones = $_POST['condiciones'];

    $tickets = array();
    if(isset($_POST['tickets']))
        $tickets = $_POST['tickets'];

    if (isset($_POST['idEvento'])) {
        $idEvento = $_POST['idEvento'];
        $evento = updateEvento($idEvento, $data, $data_direccion, $tickets, $condiciones);
    } else {
        $evento = insertEvento($data, $data_direccion, $tickets, $condiciones);
    }

    if ($evento) {
        $result['msg'] = 'ok';
        $result['data'] = 'Se guardaron los cambios correctamente';
        $result['eventoId'] = $evento;
    } else {
        $result['data'] = 'No se guardaron los cambios. Verifique sus datos y vuelva  a intentarlo.';
    }

}
else if(strcmp($action, 'updatefields') == 0) {
    if(isset($_POST['edit'])) {
        $edit = $_POST['edit'];
        foreach ($edit as $idEvento=>$data) {
            $updated = updateEventoData($idEvento, $data);
        }
        
        if($updated)
            $result = array(
                'msg'=>'ok',
                'data' => 'Los datos fueron actualizados correctamente'
            );
    }
}
else if(strcmp($action, 'eliminar') == '0') {
    if(isset($_POST['id'])) {
        $id = $_POST['id'];
        $eliminar = deleteEvento($id);
        
        if($eliminar) {
            $result['msg'] = 'ok';
            $result['data'] = 'Se guardaron los cambios correctamente';
        } else {
            $result['data'] = 'No se pudo eliminar la empresa';
        }
    }
}
else if (strcmp($action, "getFotos") == 0) {
    if (isset($_POST['idEvento'])) {
        $himages = getAllEventoImages($_POST['idEvento'], true);
    
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
            $result['html'] = '<h1 class="text-center">Este evento no cuenta con adjuntos<br />Click aquí para continuar</h1>';
        }
    }
}
else if (strcmp($action, "deleteFoto") == 0) {
    if (isset($_POST['idArchivo'])) {
        $idArchivo = $_POST['idArchivo'];
        if (deleteEventoFoto($idArchivo)) {
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
else if($_FILES) {
    if(is_uploaded_file($_FILES['file']['tmp_name'])) {
        $iWidth = 0;
        $iHeight = 0;
        $iJpgQuality = 90;
        $FileName =  md5(time().rand());
        
        $sTempFileName = 'cache/' . $FileName;
        move_uploaded_file($_FILES['file']['tmp_name'], $sTempFileName);

        @chmod($sTempFileName, 0644);
        
        if (file_exists($sTempFileName) && filesize($sTempFileName) > 0) {
            
            $aSize = getimagesize($sTempFileName);
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
                    $vImg = @imagecreatefromjpeg($sTempFileName);
                    break;
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
                
                if(!file_exists($template_dir . '/images/evento'))
                        mkdir ($template_dir . '/images/evento');
                $vDstImg = @imagecreatetruecolor( $iWidth, $iHeight );
                imagecopyresampled($vDstImg, $vImg, 0, 0, 0, 0, $iWidth, $iHeight, $iWidth, $iHeight);

                $sResultFileName = $template_dir . '/images/evento/' .$FileName . $sExt;

                // output image to file
                imagejpeg($vDstImg, $sResultFileName, $iJpgQuality);

                @unlink($sTempFileName);
                
                if(isset($_REQUEST['idEvento'])) {
                    $evento_id = $_REQUEST['idEvento'];
                    $name = $FileName;
                    $ext = $sExt;
                    $data_adjunto = array('nombre'=>$name,
                        'ruta'=> $template_url . '/images/evento/' .$FileName . $sExt,
                        'extension'=>$ext,
                        'tipo'=>'imagen');
                    $imagenId = insertEventoImage($data_adjunto, $evento_id);
                    
                    $result['msg'] = $imagenId;
                }
            }
        }
    }
}
echo json_encode($result);
?>