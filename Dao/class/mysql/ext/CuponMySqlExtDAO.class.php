<?php
/**
 * Class that operate on table 'cupon'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-08-27 08:41
 */
class CuponMySqlExtDAO extends CuponMySqlDAO{
	
	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {
        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new Cupon();
        return $this->mysql->prepare($obj, $data);
    }
	
}
?>