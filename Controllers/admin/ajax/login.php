<?php


if (isset($_POST['usuario']) && isset($_POST['password'])) {
    $email = $_POST['usuario'];
    $password = $_POST['password'];
    $usuario = authenticateUsuario($email, $password);
    if ($usuario) {
        $usuario_core->setUsuario($usuario);
        if (isset($_SESSION['user_redirect'])) {
            header('Location:'.$_SESSION['user_redirect']);
        } else {
            header('Location:'.$base_url.'/admin-hotel-lista');
        }
    }
}

?>