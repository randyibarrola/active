<?php
/**
 * Class that operate on table 'destino_turistico'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class DestinoTuristicoMySqlDAO implements DestinoTuristicoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return DestinoTuristicoMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM destino_turistico WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM destino_turistico';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM destino_turistico ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param destinoTuristico primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM destino_turistico WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param DestinoTuristicoMySql destinoTuristico
 	 */
	public function insert($destinoTuristico){
		$sql = 'INSERT INTO destino_turistico (nombre, descripcion, direccion_id) VALUES (?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($destinoTuristico->nombre);
		$sqlQuery->set($destinoTuristico->descripcion);
		$sqlQuery->setNumber($destinoTuristico->direccionId);

		$id = $this->executeInsert($sqlQuery);	
		$destinoTuristico->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param DestinoTuristicoMySql destinoTuristico
 	 */
	public function update($destinoTuristico){
		$sql = 'UPDATE destino_turistico SET nombre = ?, descripcion = ?, direccion_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($destinoTuristico->nombre);
		$sqlQuery->set($destinoTuristico->descripcion);
		$sqlQuery->setNumber($destinoTuristico->direccionId);

		$sqlQuery->setNumber($destinoTuristico->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM destino_turistico';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByNombre($value){
		$sql = 'SELECT * FROM destino_turistico WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDescripcion($value){
		$sql = 'SELECT * FROM destino_turistico WHERE descripcion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDireccionId($value){
		$sql = 'SELECT * FROM destino_turistico WHERE direccion_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByNombre($value){
		$sql = 'DELETE FROM destino_turistico WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDescripcion($value){
		$sql = 'DELETE FROM destino_turistico WHERE descripcion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDireccionId($value){
		$sql = 'DELETE FROM destino_turistico WHERE direccion_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return DestinoTuristicoMySql 
	 */
	protected function readRow($row){
		$destinoTuristico = new DestinoTuristico();
		
		$destinoTuristico->id = $row['id'];
		$destinoTuristico->nombre = $row['nombre'];
		$destinoTuristico->descripcion = $row['descripcion'];
		$destinoTuristico->direccionId = $row['direccion_id'];

		return $destinoTuristico;
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
	 * @return DestinoTuristicoMySql 
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