<?php
/**
 * Class that operate on table 'usuario_cuenta'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class UsuarioCuentaMySqlDAO implements UsuarioCuentaDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return UsuarioCuentaMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM usuario_cuenta WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM usuario_cuenta';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM usuario_cuenta ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param usuarioCuenta primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM usuario_cuenta WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param UsuarioCuentaMySql usuarioCuenta
 	 */
	public function insert($usuarioCuenta){
		$sql = 'INSERT INTO usuario_cuenta (usuario_id, banco_nombre, banco_sucursal, direccion_id, pais_id, nombre, swift, numero, iban, tax_id, comentarios, contacto_nombre, contacto_email) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($usuarioCuenta->usuarioId);
		$sqlQuery->set($usuarioCuenta->bancoNombre);
		$sqlQuery->set($usuarioCuenta->bancoSucursal);
		$sqlQuery->setNumber($usuarioCuenta->direccionId);
		$sqlQuery->setNumber($usuarioCuenta->paisId);
		$sqlQuery->set($usuarioCuenta->nombre);
		$sqlQuery->set($usuarioCuenta->swift);
		$sqlQuery->set($usuarioCuenta->numero);
		$sqlQuery->set($usuarioCuenta->iban);
		$sqlQuery->set($usuarioCuenta->taxId);
		$sqlQuery->set($usuarioCuenta->comentarios);
		$sqlQuery->set($usuarioCuenta->contactoNombre);
		$sqlQuery->set($usuarioCuenta->contactoEmail);

		$id = $this->executeInsert($sqlQuery);	
		$usuarioCuenta->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param UsuarioCuentaMySql usuarioCuenta
 	 */
	public function update($usuarioCuenta){
		$sql = 'UPDATE usuario_cuenta SET usuario_id = ?, banco_nombre = ?, banco_sucursal = ?, direccion_id = ?, pais_id = ?, nombre = ?, swift = ?, numero = ?, iban = ?, tax_id = ?, comentarios = ?, contacto_nombre = ?, contacto_email = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($usuarioCuenta->usuarioId);
		$sqlQuery->set($usuarioCuenta->bancoNombre);
		$sqlQuery->set($usuarioCuenta->bancoSucursal);
		$sqlQuery->setNumber($usuarioCuenta->direccionId);
		$sqlQuery->setNumber($usuarioCuenta->paisId);
		$sqlQuery->set($usuarioCuenta->nombre);
		$sqlQuery->set($usuarioCuenta->swift);
		$sqlQuery->set($usuarioCuenta->numero);
		$sqlQuery->set($usuarioCuenta->iban);
		$sqlQuery->set($usuarioCuenta->taxId);
		$sqlQuery->set($usuarioCuenta->comentarios);
		$sqlQuery->set($usuarioCuenta->contactoNombre);
		$sqlQuery->set($usuarioCuenta->contactoEmail);

		$sqlQuery->setNumber($usuarioCuenta->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM usuario_cuenta';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByUsuarioId($value){
		$sql = 'SELECT * FROM usuario_cuenta WHERE usuario_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByBancoNombre($value){
		$sql = 'SELECT * FROM usuario_cuenta WHERE banco_nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByBancoSucursal($value){
		$sql = 'SELECT * FROM usuario_cuenta WHERE banco_sucursal = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDireccionId($value){
		$sql = 'SELECT * FROM usuario_cuenta WHERE direccion_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPaisId($value){
		$sql = 'SELECT * FROM usuario_cuenta WHERE pais_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByNombre($value){
		$sql = 'SELECT * FROM usuario_cuenta WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryBySwift($value){
		$sql = 'SELECT * FROM usuario_cuenta WHERE swift = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByNumero($value){
		$sql = 'SELECT * FROM usuario_cuenta WHERE numero = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByIban($value){
		$sql = 'SELECT * FROM usuario_cuenta WHERE iban = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTaxId($value){
		$sql = 'SELECT * FROM usuario_cuenta WHERE tax_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByComentarios($value){
		$sql = 'SELECT * FROM usuario_cuenta WHERE comentarios = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByContactoNombre($value){
		$sql = 'SELECT * FROM usuario_cuenta WHERE contacto_nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByContactoEmail($value){
		$sql = 'SELECT * FROM usuario_cuenta WHERE contacto_email = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByUsuarioId($value){
		$sql = 'DELETE FROM usuario_cuenta WHERE usuario_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByBancoNombre($value){
		$sql = 'DELETE FROM usuario_cuenta WHERE banco_nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByBancoSucursal($value){
		$sql = 'DELETE FROM usuario_cuenta WHERE banco_sucursal = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDireccionId($value){
		$sql = 'DELETE FROM usuario_cuenta WHERE direccion_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPaisId($value){
		$sql = 'DELETE FROM usuario_cuenta WHERE pais_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByNombre($value){
		$sql = 'DELETE FROM usuario_cuenta WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteBySwift($value){
		$sql = 'DELETE FROM usuario_cuenta WHERE swift = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByNumero($value){
		$sql = 'DELETE FROM usuario_cuenta WHERE numero = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByIban($value){
		$sql = 'DELETE FROM usuario_cuenta WHERE iban = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTaxId($value){
		$sql = 'DELETE FROM usuario_cuenta WHERE tax_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByComentarios($value){
		$sql = 'DELETE FROM usuario_cuenta WHERE comentarios = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByContactoNombre($value){
		$sql = 'DELETE FROM usuario_cuenta WHERE contacto_nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByContactoEmail($value){
		$sql = 'DELETE FROM usuario_cuenta WHERE contacto_email = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return UsuarioCuentaMySql 
	 */
	protected function readRow($row){
		$usuarioCuenta = new UsuarioCuenta();
		
		$usuarioCuenta->id = $row['id'];
		$usuarioCuenta->usuarioId = $row['usuario_id'];
		$usuarioCuenta->bancoNombre = $row['banco_nombre'];
		$usuarioCuenta->bancoSucursal = $row['banco_sucursal'];
		$usuarioCuenta->direccionId = $row['direccion_id'];
		$usuarioCuenta->paisId = $row['pais_id'];
		$usuarioCuenta->nombre = $row['nombre'];
		$usuarioCuenta->swift = $row['swift'];
		$usuarioCuenta->numero = $row['numero'];
		$usuarioCuenta->iban = $row['iban'];
		$usuarioCuenta->taxId = $row['tax_id'];
		$usuarioCuenta->comentarios = $row['comentarios'];
		$usuarioCuenta->contactoNombre = $row['contacto_nombre'];
		$usuarioCuenta->contactoEmail = $row['contacto_email'];

		return $usuarioCuenta;
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
	 * @return UsuarioCuentaMySql 
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