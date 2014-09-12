<?php

$action = $_POST['action'];

$result = array('msg' => 'error', 'data' => 'Acción no válida');


if (strcmp($action, 'update') == 0) {
    $data = array(
        'nombre' => NULL,
        'descripcion' => NULL,
        'lugares' => NULL
    );

    $data_direccion = array();

    foreach ($data as $key => $value) {
        if (isset($_POST[$key])) {
            $data[$key] = $_POST[$key];
        }
    }
    
    if (isset($_POST["direccion"])) {
        $data_direccion = $_POST["direccion"];
    }
    
       
    if (isset($_POST['idDestino'])) {
        $idDestino = $_POST['idDestino'];
        $destino = updateDestino($idDestino, $data, $data_direccion);
    } else {        
        $destino = insertDestino($data, $data_direccion);
    }

    if ($destino) {
        $result['msg'] = 'ok';
        $result['data'] = 'Se guardaron los cambios correctamente';
        $result['destinoId'] = $destino;
    } else {
        $result['data'] = 'No se guardaron los cambios. Verifique sus datos y vuelva  a intentarlo.';
    }
}

else if (strcmp($action, 'eliminar') == '0') {
    if (isset($_POST['id'])) {
        $id = $_POST['id'];
        $eliminar = deleteDestino($id);

        if ($eliminar) {
            $result['msg'] = 'ok';
            $result['data'] = 'Se eliminó el destino';
        } else {
            $result['data'] = 'No se pudo eliminar el destino';
        }
    }
}

else if (strcmp($action, "getFotos") == 0) {
    if (isset($_POST['idDestino'])) {
        $adjuntos = getAllDestinoImages($_POST['idDestino']);
        if ($adjuntos) {
            $smarty->assign('adjuntos', $adjuntos);
            $html = $smarty->fetch('admin/hotel/fotos.tpl');
            $smarty->assign('adjuntos', $adjuntos);
            $result['msg'] = 'ok';
            $result['data'] = 'Adjuntos encontrados';
            $result['html'] = $html;
        } else {
            $result['msg'] = 'ok';
            $result['data'] = 'Adjuntos no encontrados';
            $result['html'] = '<h1 class="text-center">Destino no cuenta con adjuntos<br />Click aquí para continuar</h1>';
        }
    }
}

else if (strcmp($action, "deleteFoto") == 0) {
    if (isset($_POST['idArchivo'])) {
        $idArchivo = $_POST['idArchivo'];
        if (deleteFotoDestino($idArchivo)) {
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

else if (strcmp($action, "search") == 0) {
    $term = $_POST['term'];
    $destinos = searchDestinos($term);
    $result = array(
        'msg' => 'ok',
        'lista' => $destinos
    );
}

else if (strcmp($action, "get") == 0) {
    $id = $_POST['id'];
    $destino = getDestino($id);
    $result = array(
        'msg' => 'ok',
        'destino' => $destino
    );
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
                
                if(!file_exists($template_dir . '/images/destino'))
                        mkdir ($template_dir . '/images/destino');
                
                // create a new true color image
                $vDstImg = @imagecreatetruecolor( $iWidth, $iHeight );

                // copy and resize part of an image with resampling
                imagecopyresampled($vDstImg, $vImg, 0, 0, 0, 0, $iWidth, $iHeight, $iWidth, $iHeight);

                // define a result image filename
                $sResultFileName = $template_dir . '/images/destino/' .$FileName . $sExt;

                // output image to file
                imagejpeg($vDstImg, $sResultFileName, $iJpgQuality);

                @unlink($sTempFileName);
                
                if(isset($_REQUEST['idDestino'])) {
                    $destino_id = $_REQUEST['idDestino'];
                    $name = $FileName;
                    $ext = $sExt;
                    $data_adjunto = array('nombre'=>$name,
                        'ruta'=> $template_url . '/images/destino/' .$FileName . $sExt,
                        'extension'=>$ext,
                        'tipo'=>'imagen');
                    $imagenId = insertDestinoImage($data_adjunto, $destino_id);
                    
                    $result['msg'] = $imagenId;
                }
            }
        }
    }
}

echo json_encode($result);
?>