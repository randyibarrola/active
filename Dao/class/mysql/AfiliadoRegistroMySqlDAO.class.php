<?php
/**
 * Class that operate on table 'afiliado_registro'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class AfiliadoRegistroMySqlDAO implements AfiliadoRegistroDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return AfiliadoRegistroMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM afiliado_registro WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM afiliado_registro';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM afiliado_registro ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param afiliadoRegistro primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM afiliado_registro WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param AfiliadoRegistroMySql afiliadoRegistro
 	 */
	public function insert($afiliadoRegistro){
		$sql = 'INSERT INTO afiliado_registro (afiliado_id, importe, fecha, reserva_id) VALUES (?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($afiliadoRegistro->afiliadoId);
		$sqlQuery->set($afiliadoRegistro->importe);
		$sqlQuery->set($afiliadoRegistro->fecha);
		$sqlQuery->setNumber($afiliadoRegistro->reservaId);

		$id = $this->executeInsert($sqlQuery);	
		$afiliadoRegistro->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param AfiliadoRegistroMySql afiliadoRegistro
 	 */
	public function update($afiliadoRegistro){
		$sql = 'UPDATE afiliado_registro SET afiliado_id = ?, importe = ?, fecha = ?, reserva_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($afiliadoRegistro->afiliadoId);
		$sqlQuery->set($afiliadoRegistro->importe);
		$sqlQuery->set($afiliadoRegistro->fecha);
		$sqlQuery->setNumber($afiliadoRegistro->reservaId);

		$sqlQuery->setNumber($afiliadoRegistro->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM afiliado_registro';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByAfiliadoId($value){
		$sql = 'SELECT * FROM afiliado_registro WHERE afiliado_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByImporte($value){
		$sql = 'SELECT * FROM afiliado_registro WHERE importe = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByFecha($value){
		$sql = 'SELECT * FROM afiliado_registro WHERE fecha = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByReservaId($value){
		$sql = 'SELECT * FROM afiliado_registro WHERE reserva_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByAfiliadoId($value){
		$sql = 'DELETE FROM afiliado_registro WHERE afiliado_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByImporte($value){
		$sql = 'DELETE FROM afiliado_registro WHERE importe = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByFecha($value){
		$sql = 'DELETE FROM afiliado_registro WHERE fecha = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByReservaId($value){
		$sql = 'DELETE FROM afiliado_registro WHERE reserva_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return AfiliadoRegistroMySql 
	 */
	protected function readRow($row){
		$afiliadoRegistro = new AfiliadoRegistro();
		
		$afiliadoRegistro->id = $row['id'];
		$afiliadoRegistro->afiliadoId = $row['afiliado_id'];
		$afiliadoRegistro->importe = $row['importe'];
		$afiliadoRegistro->fecha = $row['fecha'];
		$afiliadoRegistro->reservaId = $row['reserva_id'];

		return $afiliadoRegistro;
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
	 * @return AfiliadoRegistroMySql 
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