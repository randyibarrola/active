<?php
/**
 * Class that operate on table 'direccion'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class DireccionMySqlDAO implements DireccionDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return DireccionMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM direccion WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM direccion';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM direccion ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param direccion primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM direccion WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param DireccionMySql direccion
 	 */
	public function insert($direccion){
		$sql = 'INSERT INTO direccion (descripcion, lat, lon, calle, codigo_postal, ciudad, estado) VALUES (?, ?, ?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($direccion->descripcion);
		$sqlQuery->set($direccion->lat);
		$sqlQuery->set($direccion->lon);
		$sqlQuery->set($direccion->calle);
		$sqlQuery->set($direccion->codigoPostal);
		$sqlQuery->set($direccion->ciudad);
		$sqlQuery->set($direccion->estado);

		$id = $this->executeInsert($sqlQuery);	
		$direccion->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param DireccionMySql direccion
 	 */
	public function update($direccion){
		$sql = 'UPDATE direccion SET descripcion = ?, lat = ?, lon = ?, calle = ?, codigo_postal = ?, ciudad = ?, estado = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($direccion->descripcion);
		$sqlQuery->set($direccion->lat);
		$sqlQuery->set($direccion->lon);
		$sqlQuery->set($direccion->calle);
		$sqlQuery->set($direccion->codigoPostal);
		$sqlQuery->set($direccion->ciudad);
		$sqlQuery->set($direccion->estado);

		$sqlQuery->setNumber($direccion->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM direccion';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByDescripcion($value){
		$sql = 'SELECT * FROM direccion WHERE descripcion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByLat($value){
		$sql = 'SELECT * FROM direccion WHERE lat = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByLon($value){
		$sql = 'SELECT * FROM direccion WHERE lon = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCalle($value){
		$sql = 'SELECT * FROM direccion WHERE calle = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCodigoPostal($value){
		$sql = 'SELECT * FROM direccion WHERE codigo_postal = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCiudad($value){
		$sql = 'SELECT * FROM direccion WHERE ciudad = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEstado($value){
		$sql = 'SELECT * FROM direccion WHERE estado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByDescripcion($value){
		$sql = 'DELETE FROM direccion WHERE descripcion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByLat($value){
		$sql = 'DELETE FROM direccion WHERE lat = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByLon($value){
		$sql = 'DELETE FROM direccion WHERE lon = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCalle($value){
		$sql = 'DELETE FROM direccion WHERE calle = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCodigoPostal($value){
		$sql = 'DELETE FROM direccion WHERE codigo_postal = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCiudad($value){
		$sql = 'DELETE FROM direccion WHERE ciudad = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEstado($value){
		$sql = 'DELETE FROM direccion WHERE estado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return DireccionMySql 
	 */
	protected function readRow($row){
		$direccion = new Direccion();
		
		$direccion->id = $row['id'];
		$direccion->descripcion = $row['descripcion'];
		$direccion->lat = $row['lat'];
		$direccion->lon = $row['lon'];
		$direccion->calle = $row['calle'];
		$direccion->codigoPostal = $row['codigo_postal'];
		$direccion->ciudad = $row['ciudad'];
		$direccion->estado = $row['estado'];

		return $direccion;
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
	 * @return DireccionMySql 
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