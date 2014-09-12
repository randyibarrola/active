<?php
/**
 * Class that operate on table 'telefono'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class TelefonoMySqlDAO implements TelefonoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return TelefonoMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM telefono WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM telefono';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM telefono ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param telefono primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM telefono WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param TelefonoMySql telefono
 	 */
	public function insert($telefono){
		$sql = 'INSERT INTO telefono (numero, telefono_tipo_id, empresa_id) VALUES (?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($telefono->numero);
		$sqlQuery->setNumber($telefono->telefonoTipoId);
		$sqlQuery->setNumber($telefono->empresaId);

		$id = $this->executeInsert($sqlQuery);	
		$telefono->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param TelefonoMySql telefono
 	 */
	public function update($telefono){
		$sql = 'UPDATE telefono SET numero = ?, telefono_tipo_id = ?, empresa_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($telefono->numero);
		$sqlQuery->setNumber($telefono->telefonoTipoId);
		$sqlQuery->setNumber($telefono->empresaId);

		$sqlQuery->setNumber($telefono->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM telefono';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByNumero($value){
		$sql = 'SELECT * FROM telefono WHERE numero = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTelefonoTipoId($value){
		$sql = 'SELECT * FROM telefono WHERE telefono_tipo_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEmpresaId($value){
		$sql = 'SELECT * FROM telefono WHERE empresa_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByNumero($value){
		$sql = 'DELETE FROM telefono WHERE numero = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTelefonoTipoId($value){
		$sql = 'DELETE FROM telefono WHERE telefono_tipo_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEmpresaId($value){
		$sql = 'DELETE FROM telefono WHERE empresa_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return TelefonoMySql 
	 */
	protected function readRow($row){
		$telefono = new Telefono();
		
		$telefono->id = $row['id'];
		$telefono->numero = $row['numero'];
		$telefono->telefonoTipoId = $row['telefono_tipo_id'];
		$telefono->empresaId = $row['empresa_id'];

		return $telefono;
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
	 * @return TelefonoMySql 
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