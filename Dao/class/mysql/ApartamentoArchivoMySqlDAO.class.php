<?php
/**
 * Class that operate on table 'apartamento_archivo'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class ApartamentoArchivoMySqlDAO implements ApartamentoArchivoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return ApartamentoArchivoMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM apartamento_archivo WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM apartamento_archivo';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM apartamento_archivo ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param apartamentoArchivo primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM apartamento_archivo WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param ApartamentoArchivoMySql apartamentoArchivo
 	 */
	public function insert($apartamentoArchivo){
		$sql = 'INSERT INTO apartamento_archivo (apartamento_id, archivo_id, tipo) VALUES (?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($apartamentoArchivo->apartamentoId);
		$sqlQuery->setNumber($apartamentoArchivo->archivoId);
		$sqlQuery->set($apartamentoArchivo->tipo);

		$id = $this->executeInsert($sqlQuery);	
		$apartamentoArchivo->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param ApartamentoArchivoMySql apartamentoArchivo
 	 */
	public function update($apartamentoArchivo){
		$sql = 'UPDATE apartamento_archivo SET apartamento_id = ?, archivo_id = ?, tipo = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($apartamentoArchivo->apartamentoId);
		$sqlQuery->setNumber($apartamentoArchivo->archivoId);
		$sqlQuery->set($apartamentoArchivo->tipo);

		$sqlQuery->setNumber($apartamentoArchivo->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM apartamento_archivo';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByApartamentoId($value){
		$sql = 'SELECT * FROM apartamento_archivo WHERE apartamento_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByArchivoId($value){
		$sql = 'SELECT * FROM apartamento_archivo WHERE archivo_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTipo($value){
		$sql = 'SELECT * FROM apartamento_archivo WHERE tipo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByApartamentoId($value){
		$sql = 'DELETE FROM apartamento_archivo WHERE apartamento_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByArchivoId($value){
		$sql = 'DELETE FROM apartamento_archivo WHERE archivo_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTipo($value){
		$sql = 'DELETE FROM apartamento_archivo WHERE tipo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return ApartamentoArchivoMySql 
	 */
	protected function readRow($row){
		$apartamentoArchivo = new ApartamentoArchivo();
		
		$apartamentoArchivo->apartamentoId = $row['apartamento_id'];
		$apartamentoArchivo->archivoId = $row['archivo_id'];
		$apartamentoArchivo->id = $row['id'];
		$apartamentoArchivo->tipo = $row['tipo'];

		return $apartamentoArchivo;
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
	 * @return ApartamentoArchivoMySql 
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