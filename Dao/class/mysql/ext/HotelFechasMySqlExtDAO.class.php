<?php
/**
 * Class that operate on table 'hotel_fechas'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-12-03 14:01
 */
class HotelFechasMySqlExtDAO extends HotelFechasMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new HotelFecha ();
        return $this->mysql->prepare($obj, $data);
    }
    
    function queryInFechas($inicio, $fin, $hotelId) {
        $sql = "SELECT DISTINCT * FROM hotel_fechas
                WHERE hotel_id = ? AND UNIX_TIMESTAMP(fecha) BETWEEN UNIX_TIMESTAMP('$inicio') 
                AND UNIX_TIMESTAMP('$fin')";
        
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->setNumber($hotelId);
        return $this->getList($sqlQuery);
    }
}
?>