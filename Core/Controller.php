<?php

class Core_Controller {

    public $supportedLanguajes = array('en','es','fr','it','pt','ru','de');

    public $controllersRoutes = array(
        'contact' => 'contacto',
        'contato' => 'contacto',
        'contatto'=> 'contacto',
        'контакт' => 'contacto',
        'kontakt' => 'contacto',

        'verfügbarkeit' => 'disponibilidad',
        'disponibilidade' => 'disponibilidad',
        'disponibilità' => 'disponibilidad',
        'availability' => 'disponibilidad',
        'disponibilité' => 'disponibilidad',
        'наличие' => 'disponibilidad'
        );

    public function getFileAction() {
        //$this->clean_vars();
        $contoller_path = dirname(__FILE__) . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . 'Controllers' . DIRECTORY_SEPARATOR;
        $action = 'index';
        $file_action = $action.'.php';
        $action_controller = 'index';
        
        if (isset($_REQUEST['args']) && strlen($_REQUEST['args'])>0) {

            $url_request = strip_tags($_REQUEST['args']);
            $args = explode("/", $url_request);
            $action = strtolower(str_replace('-', DIRECTORY_SEPARATOR, $args[0]));
            $languaje = 'en';

            if(in_array($action, $this->supportedLanguajes)){
                $languaje = $action;
                $_REQUEST['l'] = $languaje;
                $action = strtolower(str_replace('-', DIRECTORY_SEPARATOR, $args[1]));
            }

            $action_controller = $action;
            if(array_key_exists($action, $this->controllersRoutes)){
                $action = $this->controllersRoutes[$action];
            }
            
            $file_action = $action . '.php';

            if(!is_file($contoller_path . $file_action)){
                $file_action = 'index.php';
                $action_controller = 'index';
            }

            if (count($args) > 1) {
                foreach ($args as $arg) {
                    if (strstr($arg, ':') !== false) {
                        $var = explode(':', $arg);
                        if ($var && count($var) > 1) {
                            $_GET[$var[0]] = $var[1];
                            $_REQUEST[$var[0]] = $var[1];
                        }
                    }
                }
            }
        }

        return array('file' => $contoller_path . $file_action,
                     'action' => $action_controller,
                     'languaje' => $languaje);
    }

    public function clean_vars() {
        
    }

}

?>