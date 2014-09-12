<?php
/**
 * Class that operate on table 'destino_archivo'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class DestinoArchivoMySqlDAO implements DestinoArchivoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return DestinoArchivoMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM destino_archivo WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM destino_archivo';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM destino_archivo ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param destinoArchivo primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM destino_archivo WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param DestinoArchivoMySql destinoArchivo
 	 */
	public function insert($destinoArchivo){
		$sql = 'INSERT INTO destino_archivo (destino_id, archivo_id) VALUES (?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($destinoArchivo->destinoId);
		$sqlQuery->setNumber($destinoArchivo->archivoId);

		$id = $this->executeInsert($sqlQuery);	
		$destinoArchivo->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param DestinoArchivoMySql destinoArchivo
 	 */
	public function update($destinoArchivo){
		$sql = 'UPDATE destino_archivo SET destino_id = ?, archivo_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($destinoArchivo->destinoId);
		$sqlQuery->setNumber($destinoArchivo->archivoId);

		$sqlQuery->setNumber($destinoArchivo->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM destino_archivo';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByDestinoId($value){
		$sql = 'SELECT * FROM destino_archivo WHERE destino_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByArchivoId($value){
		$sql = 'SELECT * FROM destino_archivo WHERE archivo_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByDestinoId($value){
		$sql = 'DELETE FROM destino_archivo WHERE destino_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByArchivoId($value){
		$sql = 'DELETE FROM destino_archivo WHERE archivo_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return DestinoArchivoMySql 
	 */
	protected function readRow($row){
		$destinoArchivo = new DestinoArchivo();
		
		$destinoArchivo->id = $row['id'];
		$destinoArchivo->destinoId = $row['destino_id'];
		$destinoArchivo->archivoId = $row['archivo_id'];

		return $destinoArchivo;
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
	 * @return DestinoArchivoMySql 
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