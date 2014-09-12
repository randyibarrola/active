<?php
/**
 * Class that operate on table 'hotel_precio'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-02-06 20:08
 */
class HotelPrecioMySqlExtDAO extends HotelPrecioMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $idData = 0) {

        if ($idData != 0)
            $row = $this->load($idData);
        else
            $row = new HotelPrecio();
        return $this->mysql->prepare($row, $data);
    }
}
?>