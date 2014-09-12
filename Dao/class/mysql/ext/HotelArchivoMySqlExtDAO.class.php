<?php
/**
 * Class that operate on table 'hotel_archivo'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-11-04 19:49
 */
class HotelArchivoMySqlExtDAO extends HotelArchivoMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $idHotelArchivo = 0) {

        if ($idHotelArchivo != 0)
            $HotelArchivo = $this->load($idHotelArchivo);
        else
            $HotelArchivo = new HotelArchivo();
        return $this->mysql->prepare($HotelArchivo, $data);
    }
}
?>