<?php
/**
 * Class that operate on table 'afiliado_hotel'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class AfiliadoHotelMySqlDAO implements AfiliadoHotelDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return AfiliadoHotelMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM afiliado_hotel WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM afiliado_hotel';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM afiliado_hotel ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param afiliadoHotel primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM afiliado_hotel WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param AfiliadoHotelMySql afiliadoHotel
 	 */
	public function insert($afiliadoHotel){
		$sql = 'INSERT INTO afiliado_hotel (afiliado_id, hotel_id) VALUES (?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($afiliadoHotel->afiliadoId);
		$sqlQuery->setNumber($afiliadoHotel->hotelId);

		$id = $this->executeInsert($sqlQuery);	
		$afiliadoHotel->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param AfiliadoHotelMySql afiliadoHotel
 	 */
	public function update($afiliadoHotel){
		$sql = 'UPDATE afiliado_hotel SET afiliado_id = ?, hotel_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($afiliadoHotel->afiliadoId);
		$sqlQuery->setNumber($afiliadoHotel->hotelId);

		$sqlQuery->setNumber($afiliadoHotel->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM afiliado_hotel';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByAfiliadoId($value){
		$sql = 'SELECT * FROM afiliado_hotel WHERE afiliado_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByHotelId($value){
		$sql = 'SELECT * FROM afiliado_hotel WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByAfiliadoId($value){
		$sql = 'DELETE FROM afiliado_hotel WHERE afiliado_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByHotelId($value){
		$sql = 'DELETE FROM afiliado_hotel WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return AfiliadoHotelMySql 
	 */
	protected function readRow($row){
		$afiliadoHotel = new AfiliadoHotel();
		
		$afiliadoHotel->id = $row['id'];
		$afiliadoHotel->afiliadoId = $row['afiliado_id'];
		$afiliadoHotel->hotelId = $row['hotel_id'];

		return $afiliadoHotel;
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
	 * @return AfiliadoHotelMySql 
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