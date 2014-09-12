<?php
/**
 * Class that operate on table 'hotel_idioma'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-11-27 18:53
 */
class HotelIdiomaMySqlExtDAO extends HotelIdiomaMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new HotelIdioma ();
        return $this->mysql->prepare($obj, $data);
    }
}
?>