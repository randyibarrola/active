<?php
/**
 * Class that operate on table 'empresa'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class EmpresaMySqlDAO implements EmpresaDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return EmpresaMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM empresa WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM empresa';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM empresa ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param empresa primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM empresa WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param EmpresaMySql empresa
 	 */
	public function insert($empresa){
		$sql = 'INSERT INTO empresa (nombre_comercial, nombre_fiscal, numero_fiscal, telefono_reservas, email_reservas, direccion_id, contacto_nombre, contacto_apellidos, contacto_email, destino_turistico, empresa_tipo_id, empresa_distribuidora_id, estado, contacto_dni, porcentaje_beneficio) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($empresa->nombreComercial);
		$sqlQuery->set($empresa->nombreFiscal);
		$sqlQuery->set($empresa->numeroFiscal);
		$sqlQuery->set($empresa->telefonoReservas);
		$sqlQuery->set($empresa->emailReservas);
		$sqlQuery->setNumber($empresa->direccionId);
		$sqlQuery->set($empresa->contactoNombre);
		$sqlQuery->set($empresa->contactoApellidos);
		$sqlQuery->set($empresa->contactoEmail);
		$sqlQuery->set($empresa->destinoTuristico);
		$sqlQuery->setNumber($empresa->empresaTipoId);
		$sqlQuery->setNumber($empresa->empresaDistribuidoraId);
		$sqlQuery->set($empresa->estado);
		$sqlQuery->set($empresa->contactoDni);
		$sqlQuery->set($empresa->porcentajeBeneficio);

		$id = $this->executeInsert($sqlQuery);	
		$empresa->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param EmpresaMySql empresa
 	 */
	public function update($empresa){
		$sql = 'UPDATE empresa SET nombre_comercial = ?, nombre_fiscal = ?, numero_fiscal = ?, telefono_reservas = ?, email_reservas = ?, direccion_id = ?, contacto_nombre = ?, contacto_apellidos = ?, contacto_email = ?, destino_turistico = ?, empresa_tipo_id = ?, empresa_distribuidora_id = ?, estado = ?, contacto_dni = ?, porcentaje_beneficio = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($empresa->nombreComercial);
		$sqlQuery->set($empresa->nombreFiscal);
		$sqlQuery->set($empresa->numeroFiscal);
		$sqlQuery->set($empresa->telefonoReservas);
		$sqlQuery->set($empresa->emailReservas);
		$sqlQuery->setNumber($empresa->direccionId);
		$sqlQuery->set($empresa->contactoNombre);
		$sqlQuery->set($empresa->contactoApellidos);
		$sqlQuery->set($empresa->contactoEmail);
		$sqlQuery->set($empresa->destinoTuristico);
		$sqlQuery->setNumber($empresa->empresaTipoId);
		$sqlQuery->setNumber($empresa->empresaDistribuidoraId);
		$sqlQuery->set($empresa->estado);
		$sqlQuery->set($empresa->contactoDni);
		$sqlQuery->set($empresa->porcentajeBeneficio);

		$sqlQuery->setNumber($empresa->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM empresa';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByNombreComercial($value){
		$sql = 'SELECT * FROM empresa WHERE nombre_comercial = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByNombreFiscal($value){
		$sql = 'SELECT * FROM empresa WHERE nombre_fiscal = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByNumeroFiscal($value){
		$sql = 'SELECT * FROM empresa WHERE numero_fiscal = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTelefonoReservas($value){
		$sql = 'SELECT * FROM empresa WHERE telefono_reservas = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEmailReservas($value){
		$sql = 'SELECT * FROM empresa WHERE email_reservas = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDireccionId($value){
		$sql = 'SELECT * FROM empresa WHERE direccion_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByContactoNombre($value){
		$sql = 'SELECT * FROM empresa WHERE contacto_nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByContactoApellidos($value){
		$sql = 'SELECT * FROM empresa WHERE contacto_apellidos = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByContactoEmail($value){
		$sql = 'SELECT * FROM empresa WHERE contacto_email = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDestinoTuristico($value){
		$sql = 'SELECT * FROM empresa WHERE destino_turistico = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEmpresaTipoId($value){
		$sql = 'SELECT * FROM empresa WHERE empresa_tipo_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEmpresaDistribuidoraId($value){
		$sql = 'SELECT * FROM empresa WHERE empresa_distribuidora_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEstado($value){
		$sql = 'SELECT * FROM empresa WHERE estado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByContactoDni($value){
		$sql = 'SELECT * FROM empresa WHERE contacto_dni = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPorcentajeBeneficio($value){
		$sql = 'SELECT * FROM empresa WHERE porcentaje_beneficio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByNombreComercial($value){
		$sql = 'DELETE FROM empresa WHERE nombre_comercial = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByNombreFiscal($value){
		$sql = 'DELETE FROM empresa WHERE nombre_fiscal = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByNumeroFiscal($value){
		$sql = 'DELETE FROM empresa WHERE numero_fiscal = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTelefonoReservas($value){
		$sql = 'DELETE FROM empresa WHERE telefono_reservas = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEmailReservas($value){
		$sql = 'DELETE FROM empresa WHERE email_reservas = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDireccionId($value){
		$sql = 'DELETE FROM empresa WHERE direccion_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByContactoNombre($value){
		$sql = 'DELETE FROM empresa WHERE contacto_nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByContactoApellidos($value){
		$sql = 'DELETE FROM empresa WHERE contacto_apellidos = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByContactoEmail($value){
		$sql = 'DELETE FROM empresa WHERE contacto_email = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDestinoTuristico($value){
		$sql = 'DELETE FROM empresa WHERE destino_turistico = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEmpresaTipoId($value){
		$sql = 'DELETE FROM empresa WHERE empresa_tipo_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEmpresaDistribuidoraId($value){
		$sql = 'DELETE FROM empresa WHERE empresa_distribuidora_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEstado($value){
		$sql = 'DELETE FROM empresa WHERE estado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByContactoDni($value){
		$sql = 'DELETE FROM empresa WHERE contacto_dni = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPorcentajeBeneficio($value){
		$sql = 'DELETE FROM empresa WHERE porcentaje_beneficio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return EmpresaMySql 
	 */
	protected function readRow($row){
		$empresa = new Empresa();
		
		$empresa->id = $row['id'];
		$empresa->nombreComercial = $row['nombre_comercial'];
		$empresa->nombreFiscal = $row['nombre_fiscal'];
		$empresa->numeroFiscal = $row['numero_fiscal'];
		$empresa->telefonoReservas = $row['telefono_reservas'];
		$empresa->emailReservas = $row['email_reservas'];
		$empresa->direccionId = $row['direccion_id'];
		$empresa->contactoNombre = $row['contacto_nombre'];
		$empresa->contactoApellidos = $row['contacto_apellidos'];
		$empresa->contactoEmail = $row['contacto_email'];
		$empresa->destinoTuristico = $row['destino_turistico'];
		$empresa->empresaTipoId = $row['empresa_tipo_id'];
		$empresa->empresaDistribuidoraId = $row['empresa_distribuidora_id'];
		$empresa->estado = $row['estado'];
		$empresa->contactoDni = $row['contacto_dni'];
		$empresa->porcentajeBeneficio = $row['porcentaje_beneficio'];

		return $empresa;
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
	 * @return EmpresaMySql 
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