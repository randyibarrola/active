<?php
/**
 * Class that operate on table 'reserva_afiliado'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-08-13 08:07
 */
class ReservaAfiliadoMySqlDAO implements ReservaAfiliadoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return ReservaAfiliadoMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM reserva_afiliado WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM reserva_afiliado';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM reserva_afiliado ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param reservaAfiliado primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM reserva_afiliado WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param ReservaAfiliadoMySql reservaAfiliado
 	 */
	public function insert($reservaAfiliado){
		$sql = 'INSERT INTO reserva_afiliado (comision, porcentaje, reserva_id, afiliado_id) VALUES (?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($reservaAfiliado->comision);
		$sqlQuery->set($reservaAfiliado->porcentaje);
		$sqlQuery->setNumber($reservaAfiliado->reservaId);
		$sqlQuery->setNumber($reservaAfiliado->afiliadoId);

		$id = $this->executeInsert($sqlQuery);	
		$reservaAfiliado->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param ReservaAfiliadoMySql reservaAfiliado
 	 */
	public function update($reservaAfiliado){
		$sql = 'UPDATE reserva_afiliado SET comision = ?, porcentaje = ?, reserva_id = ?, afiliado_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($reservaAfiliado->comision);
		$sqlQuery->set($reservaAfiliado->porcentaje);
		$sqlQuery->setNumber($reservaAfiliado->reservaId);
		$sqlQuery->setNumber($reservaAfiliado->afiliadoId);

		$sqlQuery->setNumber($reservaAfiliado->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM reserva_afiliado';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByComision($value){
		$sql = 'SELECT * FROM reserva_afiliado WHERE comision = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPorcentaje($value){
		$sql = 'SELECT * FROM reserva_afiliado WHERE porcentaje = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByReservaId($value){
		$sql = 'SELECT * FROM reserva_afiliado WHERE reserva_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByAfiliadoId($value){
		$sql = 'SELECT * FROM reserva_afiliado WHERE afiliado_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByComision($value){
		$sql = 'DELETE FROM reserva_afiliado WHERE comision = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPorcentaje($value){
		$sql = 'DELETE FROM reserva_afiliado WHERE porcentaje = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByReservaId($value){
		$sql = 'DELETE FROM reserva_afiliado WHERE reserva_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByAfiliadoId($value){
		$sql = 'DELETE FROM reserva_afiliado WHERE afiliado_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return ReservaAfiliadoMySql 
	 */
	protected function readRow($row){
		$reservaAfiliado = new ReservaAfiliado();
		
		$reservaAfiliado->id = $row['id'];
		$reservaAfiliado->comision = $row['comision'];
		$reservaAfiliado->porcentaje = $row['porcentaje'];
		$reservaAfiliado->reservaId = $row['reserva_id'];
		$reservaAfiliado->afiliadoId = $row['afiliado_id'];

		return $reservaAfiliado;
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
	 * @return ReservaAfiliadoMySql 
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