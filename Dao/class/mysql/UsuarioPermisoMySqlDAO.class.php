<?php
/**
 * Class that operate on table 'usuario_permiso'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class UsuarioPermisoMySqlDAO implements UsuarioPermisoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return UsuarioPermisoMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM usuario_permiso WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM usuario_permiso';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM usuario_permiso ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param usuarioPermiso primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM usuario_permiso WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param UsuarioPermisoMySql usuarioPermiso
 	 */
	public function insert($usuarioPermiso){
		$sql = 'INSERT INTO usuario_permiso (usuario_grupo_id, permiso_id) VALUES (?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($usuarioPermiso->usuarioGrupoId);
		$sqlQuery->setNumber($usuarioPermiso->permisoId);

		$id = $this->executeInsert($sqlQuery);	
		$usuarioPermiso->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param UsuarioPermisoMySql usuarioPermiso
 	 */
	public function update($usuarioPermiso){
		$sql = 'UPDATE usuario_permiso SET usuario_grupo_id = ?, permiso_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($usuarioPermiso->usuarioGrupoId);
		$sqlQuery->setNumber($usuarioPermiso->permisoId);

		$sqlQuery->setNumber($usuarioPermiso->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM usuario_permiso';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByUsuarioGrupoId($value){
		$sql = 'SELECT * FROM usuario_permiso WHERE usuario_grupo_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPermisoId($value){
		$sql = 'SELECT * FROM usuario_permiso WHERE permiso_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByUsuarioGrupoId($value){
		$sql = 'DELETE FROM usuario_permiso WHERE usuario_grupo_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPermisoId($value){
		$sql = 'DELETE FROM usuario_permiso WHERE permiso_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return UsuarioPermisoMySql 
	 */
	protected function readRow($row){
		$usuarioPermiso = new UsuarioPermiso();
		
		$usuarioPermiso->id = $row['id'];
		$usuarioPermiso->usuarioGrupoId = $row['usuario_grupo_id'];
		$usuarioPermiso->permisoId = $row['permiso_id'];

		return $usuarioPermiso;
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
	 * @return UsuarioPermisoMySql 
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