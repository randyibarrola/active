<?php
/**
 * Class that operate on table 'hotel_idioma'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class HotelIdiomaMySqlDAO implements HotelIdiomaDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return HotelIdiomaMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM hotel_idioma WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM hotel_idioma';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM hotel_idioma ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param hotelIdioma primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM hotel_idioma WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param HotelIdiomaMySql hotelIdioma
 	 */
	public function insert($hotelIdioma){
		$sql = 'INSERT INTO hotel_idioma (hotel_id, idioma_id) VALUES (?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($hotelIdioma->hotelId);
		$sqlQuery->setNumber($hotelIdioma->idiomaId);

		$id = $this->executeInsert($sqlQuery);	
		$hotelIdioma->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param HotelIdiomaMySql hotelIdioma
 	 */
	public function update($hotelIdioma){
		$sql = 'UPDATE hotel_idioma SET hotel_id = ?, idioma_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($hotelIdioma->hotelId);
		$sqlQuery->setNumber($hotelIdioma->idiomaId);

		$sqlQuery->setNumber($hotelIdioma->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM hotel_idioma';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByHotelId($value){
		$sql = 'SELECT * FROM hotel_idioma WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByIdiomaId($value){
		$sql = 'SELECT * FROM hotel_idioma WHERE idioma_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByHotelId($value){
		$sql = 'DELETE FROM hotel_idioma WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByIdiomaId($value){
		$sql = 'DELETE FROM hotel_idioma WHERE idioma_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return HotelIdiomaMySql 
	 */
	protected function readRow($row){
		$hotelIdioma = new HotelIdioma();
		
		$hotelIdioma->id = $row['id'];
		$hotelIdioma->hotelId = $row['hotel_id'];
		$hotelIdioma->idiomaId = $row['idioma_id'];

		return $hotelIdioma;
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
	 * @return HotelIdiomaMySql 
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