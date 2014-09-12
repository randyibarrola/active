<?php
/**
 * Class that operate on table 'evento_condicion'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-06-13 06:57
 */
class EventoCondicionMySqlExtDAO extends EventoCondicionMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $idEventoCondicion = 0) {

        if ($idEventoCondicion != 0)
            $evento_condicion = $this->load($idEventoCondicion);
        else
            $evento_condicion = new EventoCondicion();
        return $this->mysql->prepare($evento_condicion, $data);
    }
    
}
?>