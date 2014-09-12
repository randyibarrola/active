<?php
/**
 * Class that operate on table 'configuracion_evento'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-06-19 01:04
 */
class ConfiguracionEventoMySqlExtDAO extends ConfiguracionEventoMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {
        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new ConfiguracionEvento();
        return $this->mysql->prepare($obj, $data);
    }
}
?>