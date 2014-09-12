<?php
/**
 * Class that operate on table 'destino_lugares'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-08-14 21:02
 */
class DestinoLugaresMySqlDAO implements DestinoLugaresDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return DestinoLugaresMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM destino_lugares WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM destino_lugares';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM destino_lugares ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param destinoLugare primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM destino_lugares WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param DestinoLugaresMySql destinoLugare
 	 */
	public function insert($destinoLugare){
		$sql = 'INSERT INTO destino_lugares (destino_turistico_id, nombre) VALUES (?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($destinoLugare->destinoTuristicoId);
		$sqlQuery->set($destinoLugare->nombre);

		$id = $this->executeInsert($sqlQuery);	
		$destinoLugare->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param DestinoLugaresMySql destinoLugare
 	 */
	public function update($destinoLugare){
		$sql = 'UPDATE destino_lugares SET destino_turistico_id = ?, nombre = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($destinoLugare->destinoTuristicoId);
		$sqlQuery->set($destinoLugare->nombre);

		$sqlQuery->setNumber($destinoLugare->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM destino_lugares';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByDestinoTuristicoId($value){
		$sql = 'SELECT * FROM destino_lugares WHERE destino_turistico_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByNombre($value){
		$sql = 'SELECT * FROM destino_lugares WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByDestinoTuristicoId($value){
		$sql = 'DELETE FROM destino_lugares WHERE destino_turistico_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByNombre($value){
		$sql = 'DELETE FROM destino_lugares WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return DestinoLugaresMySql 
	 */
	protected function readRow($row){
		$destinoLugare = new DestinoLugare();
		
		$destinoLugare->id = $row['id'];
		$destinoLugare->destinoTuristicoId = $row['destino_turistico_id'];
		$destinoLugare->nombre = $row['nombre'];

		return $destinoLugare;
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
	 * @return DestinoLugaresMySql 
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