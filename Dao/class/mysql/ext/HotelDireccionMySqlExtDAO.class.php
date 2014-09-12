<?php
/**
 * Class that operate on table 'hotel_direccion'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-11-04 19:49
 */
class HotelDireccionMySqlExtDAO extends HotelDireccionMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new HotelDireccion ();
        return $this->mysql->prepare($obj, $data);
    }
}
?>