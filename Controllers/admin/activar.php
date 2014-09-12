<?php 

if(isset($_GET['id'])) {
    
    $usuario = getUsuario($_GET['id']);
    
    if($usuario) {
        if(strcmp(strtolower($usuario->status), 'pendiente') == 0) {
            activarUsuario($usuario->id);
            
            try {
                
                $mail = new Core_Mailer();
                
                $body = '<h3>Su cuenta ha sido activada</h3><br>';
                $body .= 'Inicie sesión con su cuenta y administre sus datos en ';
                $body .= '<a href="' . $base_url .'/admin-login">' . $base_url .'/admin-login</a>';
                
                $mail->send_email($usuario->email, 'Su cuenta ha sido activada', $body);
                
                $body = '<h3>Su cuenta ha sido activada</h3><br>';
                $body .= 'Usted será redireccionado a la página de login<br>';                
                $body .= 'Si la página no redirecciona automáticamente haga click <a href="' . $base_url .'/admin-login">aquí</a>';
                $body .= '<script>setTimeout(function(){window.location = "' . $base_url .'/admin-login"}, 3500);</script>';
                echo $body;
                
            } catch (Exception $e) {
                var_dump($e);
            }
            
        } else {
            echo 'El link ha caducado';
        }
    } else {
        echo 'El link ha caducado';
    }
    
} else {
    echo 'El link ha caducado';
}

?>