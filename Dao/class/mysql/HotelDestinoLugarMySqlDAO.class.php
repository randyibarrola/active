<?php
/**
 * Class that operate on table 'hotel_destino_lugar'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-08-14 21:02
 */
class HotelDestinoLugarMySqlDAO implements HotelDestinoLugarDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return HotelDestinoLugarMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM hotel_destino_lugar WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM hotel_destino_lugar';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM hotel_destino_lugar ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param hotelDestinoLugar primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM hotel_destino_lugar WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param HotelDestinoLugarMySql hotelDestinoLugar
 	 */
	public function insert($hotelDestinoLugar){
		$sql = 'INSERT INTO hotel_destino_lugar (hotel_id, destino_lugares_id) VALUES (?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($hotelDestinoLugar->hotelId);
		$sqlQuery->setNumber($hotelDestinoLugar->destinoLugaresId);

		$id = $this->executeInsert($sqlQuery);	
		$hotelDestinoLugar->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param HotelDestinoLugarMySql hotelDestinoLugar
 	 */
	public function update($hotelDestinoLugar){
		$sql = 'UPDATE hotel_destino_lugar SET hotel_id = ?, destino_lugares_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($hotelDestinoLugar->hotelId);
		$sqlQuery->setNumber($hotelDestinoLugar->destinoLugaresId);

		$sqlQuery->setNumber($hotelDestinoLugar->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM hotel_destino_lugar';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByHotelId($value){
		$sql = 'SELECT * FROM hotel_destino_lugar WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDestinoLugaresId($value){
		$sql = 'SELECT * FROM hotel_destino_lugar WHERE destino_lugares_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByHotelId($value){
		$sql = 'DELETE FROM hotel_destino_lugar WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDestinoLugaresId($value){
		$sql = 'DELETE FROM hotel_destino_lugar WHERE destino_lugares_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return HotelDestinoLugarMySql 
	 */
	protected function readRow($row){
		$hotelDestinoLugar = new HotelDestinoLugar();
		
		$hotelDestinoLugar->id = $row['id'];
		$hotelDestinoLugar->hotelId = $row['hotel_id'];
		$hotelDestinoLugar->destinoLugaresId = $row['destino_lugares_id'];

		return $hotelDestinoLugar;
	}
	
	protected function getList($sqlQuery){
		$tab = QueryExecutor::execute($sqlQuery);
		$ret = array();
		for($i=0;$i<count($tab);$i++){
			$ret[$i] = $this->readRow($tab[$i]);
		}
		return $ret;
	}
	
	/**
	 * Get row
	 *
	 * @return HotelDestinoLugarMySql 
	 */
	protected function getRow($sqlQuery){
		$tab = QueryExecutor::execute($sqlQuery);
		if(count($tab)==0){
			return null;
		}
		return $this->readRow($tab[0]);		
	}
	
	/**
	 * Execute sql query
	 */
	protected function execute($sqlQuery){
		return QueryExecutor::execute($sqlQuery);
	}
	
		
	/**
	 * Execute sql query
	 */
	protected function executeUpdate($sqlQuery){
		return QueryExecutor::executeUpdate($sqlQuery);
	}

	/**
	 * Query for one row and one column
	 */
	protected function querySingleResult($sqlQuery){
		return QueryExecutor::queryForString($sqlQuery);
	}

	/**
	 * Insert row to table
	 */
	protected function executeInsert($sqlQuery){
		return QueryExecutor::executeInsert($sqlQuery);
	}
}
?>