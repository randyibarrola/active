<?php
/**
 * Class that operate on table 'campania_periodo'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-12-24 13:44
 */
class CampaniaPeriodoMySqlExtDAO extends CampaniaPeriodoMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new CampaniaPeriodo ();
        return $this->mysql->prepare($obj, $data);
    }
}
?>