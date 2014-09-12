<?php
/**
 * Class that operate on table 'evento_archivo'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class EventoArchivoMySqlDAO implements EventoArchivoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return EventoArchivoMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM evento_archivo WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM evento_archivo';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM evento_archivo ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param eventoArchivo primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM evento_archivo WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param EventoArchivoMySql eventoArchivo
 	 */
	public function insert($eventoArchivo){
		$sql = 'INSERT INTO evento_archivo (evento_id, archivo_id) VALUES (?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($eventoArchivo->eventoId);
		$sqlQuery->setNumber($eventoArchivo->archivoId);

		$id = $this->executeInsert($sqlQuery);	
		$eventoArchivo->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param EventoArchivoMySql eventoArchivo
 	 */
	public function update($eventoArchivo){
		$sql = 'UPDATE evento_archivo SET evento_id = ?, archivo_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($eventoArchivo->eventoId);
		$sqlQuery->setNumber($eventoArchivo->archivoId);

		$sqlQuery->setNumber($eventoArchivo->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM evento_archivo';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByEventoId($value){
		$sql = 'SELECT * FROM evento_archivo WHERE evento_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByArchivoId($value){
		$sql = 'SELECT * FROM evento_archivo WHERE archivo_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByEventoId($value){
		$sql = 'DELETE FROM evento_archivo WHERE evento_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByArchivoId($value){
		$sql = 'DELETE FROM evento_archivo WHERE archivo_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return EventoArchivoMySql 
	 */
	protected function readRow($row){
		$eventoArchivo = new EventoArchivo();
		
		$eventoArchivo->eventoId = $row['evento_id'];
		$eventoArchivo->archivoId = $row['archivo_id'];
		$eventoArchivo->id = $row['id'];

		return $eventoArchivo;
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
	 * @return EventoArchivoMySql 
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