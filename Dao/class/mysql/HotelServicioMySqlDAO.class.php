<?php
/**
 * Class that operate on table 'hotel_servicio'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class HotelServicioMySqlDAO implements HotelServicioDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return HotelServicioMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM hotel_servicio WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM hotel_servicio';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM hotel_servicio ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param hotelServicio primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM hotel_servicio WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param HotelServicioMySql hotelServicio
 	 */
	public function insert($hotelServicio){
		$sql = 'INSERT INTO hotel_servicio (hotel_id, servicio_id) VALUES (?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($hotelServicio->hotelId);
		$sqlQuery->setNumber($hotelServicio->servicioId);

		$id = $this->executeInsert($sqlQuery);	
		$hotelServicio->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param HotelServicioMySql hotelServicio
 	 */
	public function update($hotelServicio){
		$sql = 'UPDATE hotel_servicio SET hotel_id = ?, servicio_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($hotelServicio->hotelId);
		$sqlQuery->setNumber($hotelServicio->servicioId);

		$sqlQuery->setNumber($hotelServicio->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM hotel_servicio';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByHotelId($value){
		$sql = 'SELECT * FROM hotel_servicio WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByServicioId($value){
		$sql = 'SELECT * FROM hotel_servicio WHERE servicio_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByHotelId($value){
		$sql = 'DELETE FROM hotel_servicio WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByServicioId($value){
		$sql = 'DELETE FROM hotel_servicio WHERE servicio_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return HotelServicioMySql 
	 */
	protected function readRow($row){
		$hotelServicio = new HotelServicio();
		
		$hotelServicio->hotelId = $row['hotel_id'];
		$hotelServicio->servicioId = $row['servicio_id'];
		$hotelServicio->id = $row['id'];

		return $hotelServicio;
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
	 * @return HotelServicioMySql 
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