<?php
/**
 * Class that operate on table 'servicio'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class ServicioMySqlDAO implements ServicioDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return ServicioMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM servicio WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM servicio';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM servicio ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param servicio primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM servicio WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param ServicioMySql servicio
 	 */
	public function insert($servicio){
		$sql = 'INSERT INTO servicio (nombre, servicio_categoria_id, tipo, descripcion) VALUES (?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($servicio->nombre);
		$sqlQuery->setNumber($servicio->servicioCategoriaId);
		$sqlQuery->set($servicio->tipo);
		$sqlQuery->set($servicio->descripcion);

		$id = $this->executeInsert($sqlQuery);	
		$servicio->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param ServicioMySql servicio
 	 */
	public function update($servicio){
		$sql = 'UPDATE servicio SET nombre = ?, servicio_categoria_id = ?, tipo = ?, descripcion = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($servicio->nombre);
		$sqlQuery->setNumber($servicio->servicioCategoriaId);
		$sqlQuery->set($servicio->tipo);
		$sqlQuery->set($servicio->descripcion);

		$sqlQuery->setNumber($servicio->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM servicio';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByNombre($value){
		$sql = 'SELECT * FROM servicio WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByServicioCategoriaId($value){
		$sql = 'SELECT * FROM servicio WHERE servicio_categoria_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTipo($value){
		$sql = 'SELECT * FROM servicio WHERE tipo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDescripcion($value){
		$sql = 'SELECT * FROM servicio WHERE descripcion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByNombre($value){
		$sql = 'DELETE FROM servicio WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByServicioCategoriaId($value){
		$sql = 'DELETE FROM servicio WHERE servicio_categoria_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTipo($value){
		$sql = 'DELETE FROM servicio WHERE tipo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDescripcion($value){
		$sql = 'DELETE FROM servicio WHERE descripcion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return ServicioMySql 
	 */
	protected function readRow($row){
		$servicio = new Servicio();
		
		$servicio->id = $row['id'];
		$servicio->nombre = $row['nombre'];
		$servicio->servicioCategoriaId = $row['servicio_categoria_id'];
		$servicio->tipo = $row['tipo'];
		$servicio->descripcion = $row['descripcion'];

		return $servicio;
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
	 * @return ServicioMySql 
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