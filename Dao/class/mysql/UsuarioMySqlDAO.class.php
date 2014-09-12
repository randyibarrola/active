<?php
/**
 * Class that operate on table 'usuario'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class UsuarioMySqlDAO implements UsuarioDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return UsuarioMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM usuario WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM usuario';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM usuario ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param usuario primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM usuario WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param UsuarioMySql usuario
 	 */
	public function insert($usuario){
		$sql = 'INSERT INTO usuario (nombre, apellido, email, tiempo_creacion, ultima_modificacion, status, direccion_id, usuario_grupo_id, telefono, pais_id, password, puesto_trabajo, porcentaje_beneficio, dni) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($usuario->nombre);
		$sqlQuery->set($usuario->apellido);
		$sqlQuery->set($usuario->email);
		$sqlQuery->set($usuario->tiempoCreacion);
		$sqlQuery->set($usuario->ultimaModificacion);
		$sqlQuery->set($usuario->status);
		$sqlQuery->setNumber($usuario->direccionId);
		$sqlQuery->setNumber($usuario->usuarioGrupoId);
		$sqlQuery->set($usuario->telefono);
		$sqlQuery->setNumber($usuario->paisId);
		$sqlQuery->set($usuario->password);
		$sqlQuery->set($usuario->puestoTrabajo);
		$sqlQuery->set($usuario->porcentajeBeneficio);
		$sqlQuery->set($usuario->dni);

		$id = $this->executeInsert($sqlQuery);	
		$usuario->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param UsuarioMySql usuario
 	 */
	public function update($usuario){
		$sql = 'UPDATE usuario SET nombre = ?, apellido = ?, email = ?, tiempo_creacion = ?, ultima_modificacion = ?, status = ?, direccion_id = ?, usuario_grupo_id = ?, telefono = ?, pais_id = ?, password = ?, puesto_trabajo = ?, porcentaje_beneficio = ?, dni = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($usuario->nombre);
		$sqlQuery->set($usuario->apellido);
		$sqlQuery->set($usuario->email);
		$sqlQuery->set($usuario->tiempoCreacion);
		$sqlQuery->set($usuario->ultimaModificacion);
		$sqlQuery->set($usuario->status);
		$sqlQuery->setNumber($usuario->direccionId);
		$sqlQuery->setNumber($usuario->usuarioGrupoId);
		$sqlQuery->set($usuario->telefono);
		$sqlQuery->setNumber($usuario->paisId);
		$sqlQuery->set($usuario->password);
		$sqlQuery->set($usuario->puestoTrabajo);
		$sqlQuery->set($usuario->porcentajeBeneficio);
		$sqlQuery->set($usuario->dni);

		$sqlQuery->setNumber($usuario->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM usuario';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByNombre($value){
		$sql = 'SELECT * FROM usuario WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByApellido($value){
		$sql = 'SELECT * FROM usuario WHERE apellido = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEmail($value){
		$sql = 'SELECT * FROM usuario WHERE email = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTiempoCreacion($value){
		$sql = 'SELECT * FROM usuario WHERE tiempo_creacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByUltimaModificacion($value){
		$sql = 'SELECT * FROM usuario WHERE ultima_modificacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByStatus($value){
		$sql = 'SELECT * FROM usuario WHERE status = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDireccionId($value){
		$sql = 'SELECT * FROM usuario WHERE direccion_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByUsuarioGrupoId($value){
		$sql = 'SELECT * FROM usuario WHERE usuario_grupo_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTelefono($value){
		$sql = 'SELECT * FROM usuario WHERE telefono = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPaisId($value){
		$sql = 'SELECT * FROM usuario WHERE pais_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPassword($value){
		$sql = 'SELECT * FROM usuario WHERE password = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPuestoTrabajo($value){
		$sql = 'SELECT * FROM usuario WHERE puesto_trabajo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPorcentajeBeneficio($value){
		$sql = 'SELECT * FROM usuario WHERE porcentaje_beneficio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDni($value){
		$sql = 'SELECT * FROM usuario WHERE dni = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByNombre($value){
		$sql = 'DELETE FROM usuario WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByApellido($value){
		$sql = 'DELETE FROM usuario WHERE apellido = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEmail($value){
		$sql = 'DELETE FROM usuario WHERE email = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTiempoCreacion($value){
		$sql = 'DELETE FROM usuario WHERE tiempo_creacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByUltimaModificacion($value){
		$sql = 'DELETE FROM usuario WHERE ultima_modificacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByStatus($value){
		$sql = 'DELETE FROM usuario WHERE status = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDireccionId($value){
		$sql = 'DELETE FROM usuario WHERE direccion_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByUsuarioGrupoId($value){
		$sql = 'DELETE FROM usuario WHERE usuario_grupo_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTelefono($value){
		$sql = 'DELETE FROM usuario WHERE telefono = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPaisId($value){
		$sql = 'DELETE FROM usuario WHERE pais_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPassword($value){
		$sql = 'DELETE FROM usuario WHERE password = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPuestoTrabajo($value){
		$sql = 'DELETE FROM usuario WHERE puesto_trabajo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPorcentajeBeneficio($value){
		$sql = 'DELETE FROM usuario WHERE porcentaje_beneficio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDni($value){
		$sql = 'DELETE FROM usuario WHERE dni = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return UsuarioMySql 
	 */
	protected function readRow($row){
		$usuario = new Usuario();
		
		$usuario->id = $row['id'];
		$usuario->nombre = $row['nombre'];
		$usuario->apellido = $row['apellido'];
		$usuario->email = $row['email'];
		$usuario->tiempoCreacion = $row['tiempo_creacion'];
		$usuario->ultimaModificacion = $row['ultima_modificacion'];
		$usuario->status = $row['status'];
		$usuario->direccionId = $row['direccion_id'];
		$usuario->usuarioGrupoId = $row['usuario_grupo_id'];
		$usuario->telefono = $row['telefono'];
		$usuario->paisId = $row['pais_id'];
		$usuario->password = $row['password'];
		$usuario->puestoTrabajo = $row['puesto_trabajo'];
		$usuario->porcentajeBeneficio = $row['porcentaje_beneficio'];
		$usuario->dni = $row['dni'];

		return $usuario;
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
	 * @return UsuarioMySql 
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