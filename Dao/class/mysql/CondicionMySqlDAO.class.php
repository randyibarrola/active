<?php
/**
 * Class that operate on table 'condicion'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class CondicionMySqlDAO implements CondicionDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return CondicionMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM condicion WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM condicion';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM condicion ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param condicion primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM condicion WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param CondicionMySql condicion
 	 */
	public function insert($condicion){
		$sql = 'INSERT INTO condicion (nombre, descripcion, condicion_categoria_id, usuario_id) VALUES (?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($condicion->nombre);
		$sqlQuery->set($condicion->descripcion);
		$sqlQuery->setNumber($condicion->condicionCategoriaId);
		$sqlQuery->setNumber($condicion->usuarioId);

		$id = $this->executeInsert($sqlQuery);	
		$condicion->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param CondicionMySql condicion
 	 */
	public function update($condicion){
		$sql = 'UPDATE condicion SET nombre = ?, descripcion = ?, condicion_categoria_id = ?, usuario_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($condicion->nombre);
		$sqlQuery->set($condicion->descripcion);
		$sqlQuery->setNumber($condicion->condicionCategoriaId);
		$sqlQuery->setNumber($condicion->usuarioId);

		$sqlQuery->setNumber($condicion->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM condicion';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByNombre($value){
		$sql = 'SELECT * FROM condicion WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDescripcion($value){
		$sql = 'SELECT * FROM condicion WHERE descripcion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCondicionCategoriaId($value){
		$sql = 'SELECT * FROM condicion WHERE condicion_categoria_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByUsuarioId($value){
		$sql = 'SELECT * FROM condicion WHERE usuario_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByNombre($value){
		$sql = 'DELETE FROM condicion WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDescripcion($value){
		$sql = 'DELETE FROM condicion WHERE descripcion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCondicionCategoriaId($value){
		$sql = 'DELETE FROM condicion WHERE condicion_categoria_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByUsuarioId($value){
		$sql = 'DELETE FROM condicion WHERE usuario_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return CondicionMySql 
	 */
	protected function readRow($row){
		$condicion = new Condicion();
		
		$condicion->id = $row['id'];
		$condicion->nombre = $row['nombre'];
		$condicion->descripcion = $row['descripcion'];
		$condicion->condicionCategoriaId = $row['condicion_categoria_id'];
		$condicion->usuarioId = $row['usuario_id'];

		return $condicion;
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
	 * @return CondicionMySql 
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