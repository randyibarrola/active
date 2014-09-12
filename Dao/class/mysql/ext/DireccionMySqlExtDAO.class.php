<?php
/**
 * Class that operate on table 'direccion'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-11-04 19:49
 */
class DireccionMySqlExtDAO extends DireccionMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new Direccion ();
        return $this->mysql->prepare($obj, $data);
    }
}
?>