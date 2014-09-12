<?php
/**
 * Class that operate on table 'afiliado'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class AfiliadoMySqlExtDAO extends AfiliadoMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {
        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new Afiliado();
        return $this->mysql->prepare($obj, $data);
    }
}
?>