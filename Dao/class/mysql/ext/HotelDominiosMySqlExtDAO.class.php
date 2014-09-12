<?php
/**
 * Class that operate on table 'hotel_dominios'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-12-08 16:16
 */
class HotelDominiosMySqlExtDAO extends HotelDominiosMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new HotelDominio();
        return $this->mysql->prepare($obj, $data);
    }
}
?>