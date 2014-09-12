<?php
/**
 * Class that operate on table 'hotel_servicio'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-11-04 19:49
 */
class HotelServicioMySqlExtDAO extends HotelServicioMySqlDAO{

	function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $idHotelServicio = 0) {

        if ($idHotelServicio != 0)
            $hotel_servicio = $this->load($idHotelServicio);
        else
            $hotel_servicio = new HotelServicio();
        return $this->mysql->prepare($hotel_servicio, $data);
    }
}
?>