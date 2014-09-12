<?php
/**
 * Class that operate on table 'usuario_cuenta'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class UsuarioCuentaMySqlExtDAO extends UsuarioCuentaMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {
        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new UsuarioCuenta();
        return $this->mysql->prepare($obj, $data);
    }
}
?>