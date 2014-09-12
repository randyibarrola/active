<?php

   
    $usuario_core->cleanSession();
    setcookie('vikahotel', NULL);
     
    header('Location:'.$base_url . '/admin-login');
       
     

?>
