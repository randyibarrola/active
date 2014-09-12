<?php
/**
 * Class that operate on table 'promocion'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-12-12 19:59
 */
class PromocionMySqlExtDAO extends PromocionMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new Promocion ();
        return $this->mysql->prepare($obj, $data);
    }
    
    public function queryByHotelIdAndFechas($idHotel, $inicio, $fin){
            $sql = 'SELECT * FROM promocion WHERE hotel_id = ?';
            $sql .= ' AND ' . $inicio . ' BETWEEN UNIX_TIMESTAMP(promocion.inicio) AND UNIX_TIMESTAMP(promocion.fin)';
            $sql .= ' AND ' . $fin . ' BETWEEN UNIX_TIMESTAMP(promocion.inicio) AND UNIX_TIMESTAMP(promocion.fin)';
            
            $sqlQuery = new SqlQuery($sql);
            $sqlQuery->setNumber($idHotel);
            return $this->getList($sqlQuery);
    }
}
?>