<?php
if (isset($_POST['usuario']) && isset($_POST['password'])) {
    $email = $_POST['usuario'];
    $password = $_POST['password'];
    $usuario = authenticateUsuario($email, $password);
    if ($usuario && strcmp($usuario->rol, "cliente") != 0) {
        $usuario_core->setUsuario($usuario);
        header('Location:'.$init_url);
        /*if (isset($_SESSION['user_redirect'])) {
            header('Location:'.$_SESSION['user_redirect']);
        } else {
            header('Location:'.$init_url);
        }*/
    }else{
        if(!$usuario)
            $smarty->assign('msg','El nombre de usuario o contraseña son incorrectos.');
        else
            $smarty->assign('msg','El usuario no tiene acceso al panel.');
        $smarty->assign('usuario', $email);
    }
}
$smarty->display('login.tpl');
?>