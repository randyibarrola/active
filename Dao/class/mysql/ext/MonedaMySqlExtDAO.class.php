<?php
/**
 * Class that operate on table 'moneda'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-11-20 16:16
 */
class MonedaMySqlExtDAO extends MonedaMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new Moneda ();
        return $this->mysql->prepare($obj, $data);
    }
}
?>