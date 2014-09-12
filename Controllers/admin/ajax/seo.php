<?php

$action = $_POST['action'];

$result = array('msg' => 'error', 'data' => 'Acción no valida');


if (strcmp($action, 'update') == 0) {
    $data = array(
        'descripcionCorta' => NULL,
        'tituloSeo' => NULL,
        'keywordsSeo' => NULL,
        'claveGoogleAnalytics' => NULL,
        'seo' => 0
    );

    
    foreach ($data as $key => $value) {
        if (isset($_POST[$key])) {
            $data[$key] = $_POST[$key];
        }
    }
    
    
    
    if (isset($_POST['idHotel'])) {
        $idHotel = $_POST['idHotel'];
        $hotel = updateHotelData($idHotel, $data);
    } 

    if ($hotel) {
        $result['msg'] = 'ok';
        $result['data'] = 'Se guardaron los cambios correctamente';
        $result['hotelId'] = $hotel;
    } else {
        $result['data'] = 'No se guardaron los cambios. Verifique sus datos y vuelva  a intentarlo.';
    }
}


else if(strcmp($action, 'search') == 0) {

    $term = $_POST['term'];

    if($usuario->usuarioGrupoId == 1)
        $hoteles = buscarHoteles($term);   
    else if ($usuario->usuarioGrupoId == 3)
        $hoteles = buscarHoteles($term, $usuario->id);
    $result['msg'] = 'ok';
    $result['lista'] = $hoteles;
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