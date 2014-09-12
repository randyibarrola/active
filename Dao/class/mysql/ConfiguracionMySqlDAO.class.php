<?php
/**
 * Class that operate on table 'configuracion'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class ConfiguracionMySqlDAO implements ConfiguracionDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return ConfiguracionMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM configuracion WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM configuracion';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM configuracion ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param configuracion primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM configuracion WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param ConfiguracionMySql configuracion
 	 */
	public function insert($configuracion){
		$sql = 'INSERT INTO configuracion (comparacion_booking, sincronizacion_vika, cupon_promocional, atencion_personalizada, pago_flexible, vika_email, vika_password, vika_canal, vika_empresa, alias, usuario_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($configuracion->comparacionBooking);
		$sqlQuery->setNumber($configuracion->sincronizacionVika);
		$sqlQuery->setNumber($configuracion->cuponPromocional);
		$sqlQuery->setNumber($configuracion->atencionPersonalizada);
		$sqlQuery->setNumber($configuracion->pagoFlexible);
		$sqlQuery->set($configuracion->vikaEmail);
		$sqlQuery->set($configuracion->vikaPassword);
		$sqlQuery->set($configuracion->vikaCanal);
		$sqlQuery->setNumber($configuracion->vikaEmpresa);
		$sqlQuery->set($configuracion->alias);
		$sqlQuery->setNumber($configuracion->usuarioId);

		$id = $this->executeInsert($sqlQuery);	
		$configuracion->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param ConfiguracionMySql configuracion
 	 */
	public function update($configuracion){
		$sql = 'UPDATE configuracion SET comparacion_booking = ?, sincronizacion_vika = ?, cupon_promocional = ?, atencion_personalizada = ?, pago_flexible = ?, vika_email = ?, vika_password = ?, vika_canal = ?, vika_empresa = ?, alias = ?, usuario_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($configuracion->comparacionBooking);
		$sqlQuery->setNumber($configuracion->sincronizacionVika);
		$sqlQuery->setNumber($configuracion->cuponPromocional);
		$sqlQuery->setNumber($configuracion->atencionPersonalizada);
		$sqlQuery->setNumber($configuracion->pagoFlexible);
		$sqlQuery->set($configuracion->vikaEmail);
		$sqlQuery->set($configuracion->vikaPassword);
		$sqlQuery->set($configuracion->vikaCanal);
		$sqlQuery->setNumber($configuracion->vikaEmpresa);
		$sqlQuery->set($configuracion->alias);
		$sqlQuery->setNumber($configuracion->usuarioId);

		$sqlQuery->setNumber($configuracion->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM configuracion';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByComparacionBooking($value){
		$sql = 'SELECT * FROM configuracion WHERE comparacion_booking = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryBySincronizacionVika($value){
		$sql = 'SELECT * FROM configuracion WHERE sincronizacion_vika = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCuponPromocional($value){
		$sql = 'SELECT * FROM configuracion WHERE cupon_promocional = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByAtencionPersonalizada($value){
		$sql = 'SELECT * FROM configuracion WHERE atencion_personalizada = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPagoFlexible($value){
		$sql = 'SELECT * FROM configuracion WHERE pago_flexible = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByVikaEmail($value){
		$sql = 'SELECT * FROM configuracion WHERE vika_email = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByVikaPassword($value){
		$sql = 'SELECT * FROM configuracion WHERE vika_password = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByVikaCanal($value){
		$sql = 'SELECT * FROM configuracion WHERE vika_canal = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByVikaEmpresa($value){
		$sql = 'SELECT * FROM configuracion WHERE vika_empresa = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByAlias($value){
		$sql = 'SELECT * FROM configuracion WHERE alias = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByUsuarioId($value){
		$sql = 'SELECT * FROM configuracion WHERE usuario_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByComparacionBooking($value){
		$sql = 'DELETE FROM configuracion WHERE comparacion_booking = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteBySincronizacionVika($value){
		$sql = 'DELETE FROM configuracion WHERE sincronizacion_vika = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCuponPromocional($value){
		$sql = 'DELETE FROM configuracion WHERE cupon_promocional = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByAtencionPersonalizada($value){
		$sql = 'DELETE FROM configuracion WHERE atencion_personalizada = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPagoFlexible($value){
		$sql = 'DELETE FROM configuracion WHERE pago_flexible = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByVikaEmail($value){
		$sql = 'DELETE FROM configuracion WHERE vika_email = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByVikaPassword($value){
		$sql = 'DELETE FROM configuracion WHERE vika_password = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByVikaCanal($value){
		$sql = 'DELETE FROM configuracion WHERE vika_canal = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByVikaEmpresa($value){
		$sql = 'DELETE FROM configuracion WHERE vika_empresa = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByAlias($value){
		$sql = 'DELETE FROM configuracion WHERE alias = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByUsuarioId($value){
		$sql = 'DELETE FROM configuracion WHERE usuario_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return ConfiguracionMySql 
	 */
	protected function readRow($row){
		$configuracion = new Configuracion();
		
		$configuracion->id = $row['id'];
		$configuracion->comparacionBooking = $row['comparacion_booking'];
		$configuracion->sincronizacionVika = $row['sincronizacion_vika'];
		$configuracion->cuponPromocional = $row['cupon_promocional'];
		$configuracion->atencionPersonalizada = $row['atencion_personalizada'];
		$configuracion->pagoFlexible = $row['pago_flexible'];
		$configuracion->vikaEmail = $row['vika_email'];
		$configuracion->vikaPassword = $row['vika_password'];
		$configuracion->vikaCanal = $row['vika_canal'];
		$configuracion->vikaEmpresa = $row['vika_empresa'];
		$configuracion->alias = $row['alias'];
		$configuracion->usuarioId = $row['usuario_id'];

		return $configuracion;
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
	 * @return ConfiguracionMySql 
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