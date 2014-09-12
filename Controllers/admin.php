<?php 

if(isset($_COOKIE['vikahotel'])) {
    $idUsuario = hexdec($_COOKIE['vikahotel'])/9999;
    $usuario = getUsuario($idUsuario);
    if($usuario) {
    $usuario_core->setUsuario($usuario);
        if($usuario->usuarioGrupoId == 2)
            $start_url = $base_url . '/admin-reserva-lista';
        else
            $start_url = $base_url . '/admin-contrato-lista';
        header('Location:' . $start_url);
    } else {
        $smarty->display('admin/login.tpl');
    }
    
} else {
    if (isset($_POST['username']) && isset($_POST['password'])) {
        $email = $_POST['username'];
        $password = $_POST['password'];
        $usuario = authenticateUsuario($email, $password);
        if ($usuario && strcmp($usuario->rol, "cliente") != 0) {
            $usuario_core->setUsuario($usuario);
            header('Location:'.$base_url . '/admin-hotel-lista');
        }else{
            if(!$usuario)
                $smarty->assign('msg','El nombre de usuario o contraseña son incorrectos.');
            else
                $smarty->assign('msg','El usuario no tiene acceso al panel.');
            $smarty->assign('usuario', $email);
        }
    }
    $smarty->display('admin/login.tpl');
}

?>