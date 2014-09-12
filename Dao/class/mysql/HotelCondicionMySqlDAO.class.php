<?php
/**
 * Class that operate on table 'hotel_condicion'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class HotelCondicionMySqlDAO implements HotelCondicionDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return HotelCondicionMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM hotel_condicion WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM hotel_condicion';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM hotel_condicion ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param hotelCondicion primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM hotel_condicion WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param HotelCondicionMySql hotelCondicion
 	 */
	public function insert($hotelCondicion){
		$sql = 'INSERT INTO hotel_condicion (hotel_id, condicion_id) VALUES (?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($hotelCondicion->hotelId);
		$sqlQuery->setNumber($hotelCondicion->condicionId);

		$id = $this->executeInsert($sqlQuery);	
		$hotelCondicion->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param HotelCondicionMySql hotelCondicion
 	 */
	public function update($hotelCondicion){
		$sql = 'UPDATE hotel_condicion SET hotel_id = ?, condicion_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($hotelCondicion->hotelId);
		$sqlQuery->setNumber($hotelCondicion->condicionId);

		$sqlQuery->setNumber($hotelCondicion->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM hotel_condicion';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByHotelId($value){
		$sql = 'SELECT * FROM hotel_condicion WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCondicionId($value){
		$sql = 'SELECT * FROM hotel_condicion WHERE condicion_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByHotelId($value){
		$sql = 'DELETE FROM hotel_condicion WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCondicionId($value){
		$sql = 'DELETE FROM hotel_condicion WHERE condicion_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return HotelCondicionMySql 
	 */
	protected function readRow($row){
		$hotelCondicion = new HotelCondicion();
		
		$hotelCondicion->hotelId = $row['hotel_id'];
		$hotelCondicion->condicionId = $row['condicion_id'];
		$hotelCondicion->id = $row['id'];

		return $hotelCondicion;
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
	 * @return HotelCondicionMySql 
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