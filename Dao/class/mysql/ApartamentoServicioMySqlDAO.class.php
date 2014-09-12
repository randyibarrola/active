<?php
/**
 * Class that operate on table 'apartamento_servicio'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class ApartamentoServicioMySqlDAO implements ApartamentoServicioDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return ApartamentoServicioMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM apartamento_servicio WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM apartamento_servicio';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM apartamento_servicio ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param apartamentoServicio primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM apartamento_servicio WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param ApartamentoServicioMySql apartamentoServicio
 	 */
	public function insert($apartamentoServicio){
		$sql = 'INSERT INTO apartamento_servicio (apartamento_id, servicio_id) VALUES (?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($apartamentoServicio->apartamentoId);
		$sqlQuery->setNumber($apartamentoServicio->servicioId);

		$id = $this->executeInsert($sqlQuery);	
		$apartamentoServicio->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param ApartamentoServicioMySql apartamentoServicio
 	 */
	public function update($apartamentoServicio){
		$sql = 'UPDATE apartamento_servicio SET apartamento_id = ?, servicio_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($apartamentoServicio->apartamentoId);
		$sqlQuery->setNumber($apartamentoServicio->servicioId);

		$sqlQuery->setNumber($apartamentoServicio->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM apartamento_servicio';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByApartamentoId($value){
		$sql = 'SELECT * FROM apartamento_servicio WHERE apartamento_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByServicioId($value){
		$sql = 'SELECT * FROM apartamento_servicio WHERE servicio_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByApartamentoId($value){
		$sql = 'DELETE FROM apartamento_servicio WHERE apartamento_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByServicioId($value){
		$sql = 'DELETE FROM apartamento_servicio WHERE servicio_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return ApartamentoServicioMySql 
	 */
	protected function readRow($row){
		$apartamentoServicio = new ApartamentoServicio();
		
		$apartamentoServicio->apartamentoId = $row['apartamento_id'];
		$apartamentoServicio->servicioId = $row['servicio_id'];
		$apartamentoServicio->id = $row['id'];

		return $apartamentoServicio;
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
	 * @return ApartamentoServicioMySql 
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