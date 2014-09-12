<?php
/**
 * Class that operate on table 'archivo'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class ArchivoMySqlDAO implements ArchivoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return ArchivoMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM archivo WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM archivo';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM archivo ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param archivo primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM archivo WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param ArchivoMySql archivo
 	 */
	public function insert($archivo){
		$sql = 'INSERT INTO archivo (nombre, ruta, tipo, extension) VALUES (?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($archivo->nombre);
		$sqlQuery->set($archivo->ruta);
		$sqlQuery->set($archivo->tipo);
		$sqlQuery->set($archivo->extension);

		$id = $this->executeInsert($sqlQuery);	
		$archivo->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param ArchivoMySql archivo
 	 */
	public function update($archivo){
		$sql = 'UPDATE archivo SET nombre = ?, ruta = ?, tipo = ?, extension = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($archivo->nombre);
		$sqlQuery->set($archivo->ruta);
		$sqlQuery->set($archivo->tipo);
		$sqlQuery->set($archivo->extension);

		$sqlQuery->setNumber($archivo->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM archivo';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByNombre($value){
		$sql = 'SELECT * FROM archivo WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByRuta($value){
		$sql = 'SELECT * FROM archivo WHERE ruta = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTipo($value){
		$sql = 'SELECT * FROM archivo WHERE tipo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByExtension($value){
		$sql = 'SELECT * FROM archivo WHERE extension = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByNombre($value){
		$sql = 'DELETE FROM archivo WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByRuta($value){
		$sql = 'DELETE FROM archivo WHERE ruta = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTipo($value){
		$sql = 'DELETE FROM archivo WHERE tipo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByExtension($value){
		$sql = 'DELETE FROM archivo WHERE extension = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return ArchivoMySql 
	 */
	protected function readRow($row){
		$archivo = new Archivo();
		
		$archivo->id = $row['id'];
		$archivo->nombre = $row['nombre'];
		$archivo->ruta = $row['ruta'];
		$archivo->tipo = $row['tipo'];
		$archivo->extension = $row['extension'];

		return $archivo;
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
	 * @return ArchivoMySql 
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