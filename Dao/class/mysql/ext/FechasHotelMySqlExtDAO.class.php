<?php
/**
 * Class that operate on table 'fechas_hotel'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-12-02 22:49
 */
class FechasHotelMySqlExtDAO extends FechasHotelMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new FechasHotel ();
        return $this->mysql->prepare($obj, $data);
    }
}
?>