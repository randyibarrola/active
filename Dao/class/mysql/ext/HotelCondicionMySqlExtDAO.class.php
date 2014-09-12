<?php
/**
 * Class that operate on table 'hotel_condicion'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-11-04 19:49
 */
class HotelCondicionMySqlExtDAO extends HotelCondicionMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new HotelCondicion ();
        return $this->mysql->prepare($obj, $data);
    }
}
?>