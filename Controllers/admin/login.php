<?php 
if(isset($_COOKIE['vikahotel'])) {
    $idUsuario = hexdec($_COOKIE['vikahotel'])/9999;
    $usuario = getUsuario($idUsuario);
    if($usuario) {
        $usuario_core->setUsuario($usuario);
        if($usuario->usuarioGrupoId == 5){
            $start_url = $base_url . '/admin-widget-lista';
        }else{
            $start_url = $base_url . '/admin-reserva-lista';
        }
        
        
        header('Location:' . $start_url);
    } else {
        $smarty->display('admin/login.tpl');
    }
    
} else {

    if (isset($_POST['username']) && isset($_POST['password'])) {
        $email = $_POST['username'];
        $password = $_POST['password'];
        $usuario = authenticateUsuario($email, $password);
        if ($usuario) {
            $usuario_core->setUsuario($usuario);
            
            $start_url = $base_url . '/admin-reserva-lista';

            if($usuario->usuarioGrupoId == 2 && $usuario->status == 'Pendiente') {
                updateUsuario($usuario->id, array('status'=>'activado'));
                $campanias = getCampaniasByUsuario($usuario->id);
                if($campanias && count($campanias))
                    $start_url = $base_url . '/admin-campania-contrato/id:' . $campanias[0]->id;
            }else if($usuario->usuarioGrupoId == 5){
                $start_url = $base_url . '/admin-widget-lista';
            }

            if(isset($_POST['remember'])) {
                setcookie('vikahotel', dechex($usuario->id * 9999), time()+60*60*24*30);
            }

            header('Location:'.$start_url);

        }
        else{
            if(!$usuario)
                $smarty->assign('errmsg','El nombre de usuario o contraseña son incorrectos.');
            else
                $smarty->assign('errmsg','El usuario no tiene acceso al panel.');
            $smarty->assign('usuario', $email);
        }
    } else if(isset ($_GET['r'])) {
        $smarty->assign('regmsg','Gracias por registrarse en '.$smarty->getConfigVariable('sistema_nombre').', por favor comprueba tu correo para iniciar sesión.');
    }

    $smarty->display('admin/login.tpl');
}
?>