<?php

$logged = $usuario_core->validateUser();

$action = $_POST['action'];
$result = array('msg' => 'error', 'data' => 'Acción no valida');

if($logged) {
    
    $usuario = $usuario_core->getUsuario();
    
    if(strcmp($action, 'update') == 0) {
        
        if(isset($_POST['idioma']) && isset($_POST['traducciones'])) {
            $idioma = $_POST['idioma'];
            $traducciones = $_POST['traducciones'];
            $text = '';
            foreach ($traducciones as $key => $value) {
                if(strlen(trim($value)))
                    $text .= "$key=$value\n";
            }
            try {
            $file = $app_dir . '/configs/' . $idioma . '.conf';
            
            $fh = fopen($file, 'w');
            fwrite($fh, $text);
            fclose($fh);
            } catch (Exception $e){
                                
            }
            
            $result = array(
                'msg' => 'ok',
                'idioma' => $idioma,
                $idioma => $traducciones
            );
            
        }
        
    }
    
} else {
    $result['msg'] = 'Usted no está autenticado';
}

echo json_encode($result);

?>