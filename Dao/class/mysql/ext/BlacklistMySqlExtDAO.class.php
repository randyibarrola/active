<?php
/**
 * Class that operate on table 'blacklist'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-12-03 23:14
 */
class BlacklistMySqlExtDAO extends BlacklistMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new Blacklist ();
        return $this->mysql->prepare($obj, $data);
    }
    
    public function queryByHotelIsNull(){
		$sql = 'SELECT * FROM blacklist WHERE hotel_id IS NULL';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
        
    public function queryByOcultarResultado($value, $hotelId = 0){
		$sql = 'SELECT b.* FROM blacklist AS b';
                
                if($hotelId) {
                    $sql .= ' LEFT JOIN usuario_empresa AS ue ON ue.usuario_id = b.usuario_id                              
                              LEFT JOIN campania AS ca ON ca.empresa_distribuidora_id = ue.empresa_id
                              LEFT JOIN hotel AS h ON h.campania_id = ca.id
                        ';
                }
                
                $sql .= 'WHERE ocultar_resultado = ? AND (h.id = ? ';
                
                if($hotelId) {
                    $sql .= 'OR b.hotel_id = ?';
                }
                $sql .= ')';
                
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
                if($hotelId) {
                    $sqlQuery->setNumber($hotelId);
                    $sqlQuery->setNumber($hotelId);
                }
		return $this->getList($sqlQuery);
	}
        
    public function queryByDistribuidor($value){
		$sql = 'SELECT * FROM blacklist WHERE hotel_id IS NULL AND usuario_id = ?';
		$sqlQuery = new SqlQuery($sql);
                $sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}
        
    public function queryByHoteles($ids = array()){
		$sql = 'SELECT * FROM blacklist WHERE hotel_id IS NOT NULL AND (';
                foreach ($ids as $k=>$id) {
                    if($k) $sql .= ' OR ';
                    $sql .= ' hotel_id = ?';
                }
                $sql .= ')';
		$sqlQuery = new SqlQuery($sql);
                foreach ($ids as $k=>$id) {
                    $sqlQuery->setNumber($id);
                }
		return $this->getList($sqlQuery);
	}
}
?>