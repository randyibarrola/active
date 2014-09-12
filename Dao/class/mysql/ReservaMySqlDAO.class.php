<?php
/**
 * Class that operate on table 'reserva'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class ReservaMySqlDAO implements ReservaDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return ReservaMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM reserva WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM reserva';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM reserva ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param reserva primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM reserva WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param ReservaMySql reserva
 	 */
	public function insert($reserva){
		$sql = 'INSERT INTO reserva (usuario_id, peticiones_especiales, tiempo_creacion, ultima_modificacion, hora_prevista, total, moneda, estado, hotel_id, localizador, url_origen, moneda_id, recibir_factura, idioma_id, cart_id, ip, navegador, request_time, nota, motivo_cancelacion, tipo_cobro) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($reserva->usuarioId);
		$sqlQuery->set($reserva->peticionesEspeciales);
		$sqlQuery->set($reserva->tiempoCreacion);
		$sqlQuery->set($reserva->ultimaModificacion);
		$sqlQuery->set($reserva->horaPrevista);
		$sqlQuery->set($reserva->total);
		$sqlQuery->set($reserva->moneda);
		$sqlQuery->set($reserva->estado);
		$sqlQuery->setNumber($reserva->hotelId);
		$sqlQuery->set($reserva->localizador);
		$sqlQuery->set($reserva->urlOrigen);
		$sqlQuery->setNumber($reserva->monedaId);
		$sqlQuery->setNumber($reserva->recibirFactura);
		$sqlQuery->setNumber($reserva->idiomaId);
		$sqlQuery->setNumber($reserva->cartId);
		$sqlQuery->set($reserva->ip);
		$sqlQuery->set($reserva->navegador);
		$sqlQuery->set($reserva->requestTime);
		$sqlQuery->set($reserva->nota);
		$sqlQuery->set($reserva->motivoCancelacion);
		$sqlQuery->set($reserva->tipoCobro);

		$id = $this->executeInsert($sqlQuery);	
		$reserva->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param ReservaMySql reserva
 	 */
	public function update($reserva){
		$sql = 'UPDATE reserva SET usuario_id = ?, peticiones_especiales = ?, tiempo_creacion = ?, ultima_modificacion = ?, hora_prevista = ?, total = ?, moneda = ?, estado = ?, hotel_id = ?, localizador = ?, url_origen = ?, moneda_id = ?, recibir_factura = ?, idioma_id = ?, cart_id = ?, ip = ?, navegador = ?, request_time = ?, nota = ?, motivo_cancelacion = ?, tipo_cobro = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($reserva->usuarioId);
		$sqlQuery->set($reserva->peticionesEspeciales);
		$sqlQuery->set($reserva->tiempoCreacion);
		$sqlQuery->set($reserva->ultimaModificacion);
		$sqlQuery->set($reserva->horaPrevista);
		$sqlQuery->set($reserva->total);
		$sqlQuery->set($reserva->moneda);
		$sqlQuery->set($reserva->estado);
		$sqlQuery->setNumber($reserva->hotelId);
		$sqlQuery->set($reserva->localizador);
		$sqlQuery->set($reserva->urlOrigen);
		$sqlQuery->setNumber($reserva->monedaId);
		$sqlQuery->setNumber($reserva->recibirFactura);
		$sqlQuery->setNumber($reserva->idiomaId);
		$sqlQuery->setNumber($reserva->cartId);
		$sqlQuery->set($reserva->ip);
		$sqlQuery->set($reserva->navegador);
		$sqlQuery->set($reserva->requestTime);
		$sqlQuery->set($reserva->nota);
		$sqlQuery->set($reserva->motivoCancelacion);
		$sqlQuery->set($reserva->tipoCobro);

		$sqlQuery->setNumber($reserva->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM reserva';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByUsuarioId($value){
		$sql = 'SELECT * FROM reserva WHERE usuario_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPeticionesEspeciales($value){
		$sql = 'SELECT * FROM reserva WHERE peticiones_especiales = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTiempoCreacion($value){
		$sql = 'SELECT * FROM reserva WHERE tiempo_creacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByUltimaModificacion($value){
		$sql = 'SELECT * FROM reserva WHERE ultima_modificacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByHoraPrevista($value){
		$sql = 'SELECT * FROM reserva WHERE hora_prevista = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTotal($value){
		$sql = 'SELECT * FROM reserva WHERE total = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByMoneda($value){
		$sql = 'SELECT * FROM reserva WHERE moneda = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEstado($value){
		$sql = 'SELECT * FROM reserva WHERE estado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByHotelId($value){
		$sql = 'SELECT * FROM reserva WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByLocalizador($value){
		$sql = 'SELECT * FROM reserva WHERE localizador = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByUrlOrigen($value){
		$sql = 'SELECT * FROM reserva WHERE url_origen = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByMonedaId($value){
		$sql = 'SELECT * FROM reserva WHERE moneda_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByRecibirFactura($value){
		$sql = 'SELECT * FROM reserva WHERE recibir_factura = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByIdiomaId($value){
		$sql = 'SELECT * FROM reserva WHERE idioma_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCartId($value){
		$sql = 'SELECT * FROM reserva WHERE cart_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByIp($value){
		$sql = 'SELECT * FROM reserva WHERE ip = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByNavegador($value){
		$sql = 'SELECT * FROM reserva WHERE navegador = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByRequestTime($value){
		$sql = 'SELECT * FROM reserva WHERE request_time = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByNota($value){
		$sql = 'SELECT * FROM reserva WHERE nota = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByMotivoCancelacion($value){
		$sql = 'SELECT * FROM reserva WHERE motivo_cancelacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTipoCobro($value){
		$sql = 'SELECT * FROM reserva WHERE tipo_cobro = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByUsuarioId($value){
		$sql = 'DELETE FROM reserva WHERE usuario_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPeticionesEspeciales($value){
		$sql = 'DELETE FROM reserva WHERE peticiones_especiales = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTiempoCreacion($value){
		$sql = 'DELETE FROM reserva WHERE tiempo_creacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByUltimaModificacion($value){
		$sql = 'DELETE FROM reserva WHERE ultima_modificacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByHoraPrevista($value){
		$sql = 'DELETE FROM reserva WHERE hora_prevista = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTotal($value){
		$sql = 'DELETE FROM reserva WHERE total = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByMoneda($value){
		$sql = 'DELETE FROM reserva WHERE moneda = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEstado($value){
		$sql = 'DELETE FROM reserva WHERE estado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByHotelId($value){
		$sql = 'DELETE FROM reserva WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByLocalizador($value){
		$sql = 'DELETE FROM reserva WHERE localizador = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByUrlOrigen($value){
		$sql = 'DELETE FROM reserva WHERE url_origen = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByMonedaId($value){
		$sql = 'DELETE FROM reserva WHERE moneda_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByRecibirFactura($value){
		$sql = 'DELETE FROM reserva WHERE recibir_factura = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByIdiomaId($value){
		$sql = 'DELETE FROM reserva WHERE idioma_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCartId($value){
		$sql = 'DELETE FROM reserva WHERE cart_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByIp($value){
		$sql = 'DELETE FROM reserva WHERE ip = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByNavegador($value){
		$sql = 'DELETE FROM reserva WHERE navegador = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByRequestTime($value){
		$sql = 'DELETE FROM reserva WHERE request_time = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByNota($value){
		$sql = 'DELETE FROM reserva WHERE nota = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByMotivoCancelacion($value){
		$sql = 'DELETE FROM reserva WHERE motivo_cancelacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTipoCobro($value){
		$sql = 'DELETE FROM reserva WHERE tipo_cobro = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return ReservaMySql 
	 */
	protected function readRow($row){
		$reserva = new Reserva();
		
		$reserva->id = $row['id'];
		$reserva->usuarioId = $row['usuario_id'];
		$reserva->peticionesEspeciales = $row['peticiones_especiales'];
		$reserva->tiempoCreacion = $row['tiempo_creacion'];
		$reserva->ultimaModificacion = $row['ultima_modificacion'];
		$reserva->horaPrevista = $row['hora_prevista'];
		$reserva->total = $row['total'];
		$reserva->moneda = $row['moneda'];
		$reserva->estado = $row['estado'];
		$reserva->hotelId = $row['hotel_id'];
		$reserva->localizador = $row['localizador'];
		$reserva->urlOrigen = $row['url_origen'];
		$reserva->monedaId = $row['moneda_id'];
		$reserva->recibirFactura = $row['recibir_factura'];
		$reserva->idiomaId = $row['idioma_id'];
		$reserva->cartId = $row['cart_id'];
		$reserva->ip = $row['ip'];
		$reserva->navegador = $row['navegador'];
		$reserva->requestTime = $row['request_time'];
		$reserva->nota = $row['nota'];
		$reserva->motivoCancelacion = $row['motivo_cancelacion'];
		$reserva->tipoCobro = $row['tipo_cobro'];

		return $reserva;
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
	 * @return ReservaMySql 
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