<?php
/**
 * Class that operate on table 'adword'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class AdwordMySqlDAO implements AdwordDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return AdwordMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM adword WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM adword';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM adword ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param adword primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM adword WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param AdwordMySql adword
 	 */
	public function insert($adword){
		$sql = 'INSERT INTO adword (nombre_campania, presupuesto, tiempo_creacion, inicio, fin, palabras_clave, hotel_id) VALUES (?, ?, ?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($adword->nombreCampania);
		$sqlQuery->set($adword->presupuesto);
		$sqlQuery->set($adword->tiempoCreacion);
		$sqlQuery->set($adword->inicio);
		$sqlQuery->set($adword->fin);
		$sqlQuery->set($adword->palabrasClave);
		$sqlQuery->setNumber($adword->hotelId);

		$id = $this->executeInsert($sqlQuery);	
		$adword->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param AdwordMySql adword
 	 */
	public function update($adword){
		$sql = 'UPDATE adword SET nombre_campania = ?, presupuesto = ?, tiempo_creacion = ?, inicio = ?, fin = ?, palabras_clave = ?, hotel_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($adword->nombreCampania);
		$sqlQuery->set($adword->presupuesto);
		$sqlQuery->set($adword->tiempoCreacion);
		$sqlQuery->set($adword->inicio);
		$sqlQuery->set($adword->fin);
		$sqlQuery->set($adword->palabrasClave);
		$sqlQuery->setNumber($adword->hotelId);

		$sqlQuery->setNumber($adword->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM adword';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByNombreCampania($value){
		$sql = 'SELECT * FROM adword WHERE nombre_campania = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPresupuesto($value){
		$sql = 'SELECT * FROM adword WHERE presupuesto = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTiempoCreacion($value){
		$sql = 'SELECT * FROM adword WHERE tiempo_creacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByInicio($value){
		$sql = 'SELECT * FROM adword WHERE inicio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByFin($value){
		$sql = 'SELECT * FROM adword WHERE fin = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPalabrasClave($value){
		$sql = 'SELECT * FROM adword WHERE palabras_clave = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByHotelId($value){
		$sql = 'SELECT * FROM adword WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByNombreCampania($value){
		$sql = 'DELETE FROM adword WHERE nombre_campania = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPresupuesto($value){
		$sql = 'DELETE FROM adword WHERE presupuesto = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTiempoCreacion($value){
		$sql = 'DELETE FROM adword WHERE tiempo_creacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByInicio($value){
		$sql = 'DELETE FROM adword WHERE inicio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByFin($value){
		$sql = 'DELETE FROM adword WHERE fin = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPalabrasClave($value){
		$sql = 'DELETE FROM adword WHERE palabras_clave = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByHotelId($value){
		$sql = 'DELETE FROM adword WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return AdwordMySql 
	 */
	protected function readRow($row){
		$adword = new Adword();
		
		$adword->id = $row['id'];
		$adword->nombreCampania = $row['nombre_campania'];
		$adword->presupuesto = $row['presupuesto'];
		$adword->tiempoCreacion = $row['tiempo_creacion'];
		$adword->inicio = $row['inicio'];
		$adword->fin = $row['fin'];
		$adword->palabrasClave = $row['palabras_clave'];
		$adword->hotelId = $row['hotel_id'];

		return $adword;
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
	 * @return AdwordMySql 
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