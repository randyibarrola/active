<?php
/**
 * Class that operate on table 'usuario_empresa'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class UsuarioEmpresaMySqlDAO implements UsuarioEmpresaDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return UsuarioEmpresaMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM usuario_empresa WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM usuario_empresa';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM usuario_empresa ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param usuarioEmpresa primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM usuario_empresa WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param UsuarioEmpresaMySql usuarioEmpresa
 	 */
	public function insert($usuarioEmpresa){
		$sql = 'INSERT INTO usuario_empresa (usuario_id, empresa_id) VALUES (?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($usuarioEmpresa->usuarioId);
		$sqlQuery->setNumber($usuarioEmpresa->empresaId);

		$id = $this->executeInsert($sqlQuery);	
		$usuarioEmpresa->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param UsuarioEmpresaMySql usuarioEmpresa
 	 */
	public function update($usuarioEmpresa){
		$sql = 'UPDATE usuario_empresa SET usuario_id = ?, empresa_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($usuarioEmpresa->usuarioId);
		$sqlQuery->setNumber($usuarioEmpresa->empresaId);

		$sqlQuery->setNumber($usuarioEmpresa->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM usuario_empresa';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByUsuarioId($value){
		$sql = 'SELECT * FROM usuario_empresa WHERE usuario_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEmpresaId($value){
		$sql = 'SELECT * FROM usuario_empresa WHERE empresa_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByUsuarioId($value){
		$sql = 'DELETE FROM usuario_empresa WHERE usuario_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEmpresaId($value){
		$sql = 'DELETE FROM usuario_empresa WHERE empresa_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return UsuarioEmpresaMySql 
	 */
	protected function readRow($row){
		$usuarioEmpresa = new UsuarioEmpresa();
		
		$usuarioEmpresa->id = $row['id'];
		$usuarioEmpresa->usuarioId = $row['usuario_id'];
		$usuarioEmpresa->empresaId = $row['empresa_id'];

		return $usuarioEmpresa;
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
	 * @return UsuarioEmpresaMySql 
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