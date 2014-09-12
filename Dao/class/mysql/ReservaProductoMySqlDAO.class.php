<?php
/**
 * Class that operate on table 'reserva_producto'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-08-27 08:41
 */
class ReservaProductoMySqlDAO implements ReservaProductoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return ReservaProductoMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM reserva_producto WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM reserva_producto';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM reserva_producto ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param reservaProducto primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM reserva_producto WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param ReservaProductoMySql reservaProducto
 	 */
	public function insert($reservaProducto){
		$sql = 'INSERT INTO reserva_producto (reserva_id, nombre, tipo, precio_unitario, cantidad, inicio, final, pago_offline, importe_inicial, porciento_inicial, localizador, telefono_contacto, modo_pago_offline, evento_id, evento_tpv, sesion, direccion, emails, entradas, condicion, pension, adultos, ninios, descuento, cupon) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($reservaProducto->reservaId);
		$sqlQuery->set($reservaProducto->nombre);
		$sqlQuery->set($reservaProducto->tipo);
		$sqlQuery->set($reservaProducto->precioUnitario);
		$sqlQuery->set($reservaProducto->cantidad);
		$sqlQuery->set($reservaProducto->inicio);
		$sqlQuery->set($reservaProducto->final);
		$sqlQuery->setNumber($reservaProducto->pagoOffline);
		$sqlQuery->set($reservaProducto->importeInicial);
		$sqlQuery->set($reservaProducto->porcientoInicial);
		$sqlQuery->set($reservaProducto->localizador);
		$sqlQuery->set($reservaProducto->telefonoContacto);
		$sqlQuery->set($reservaProducto->modoPagoOffline);
		$sqlQuery->setNumber($reservaProducto->eventoId);
		$sqlQuery->set($reservaProducto->eventoTpv);
		$sqlQuery->set($reservaProducto->sesion);
		$sqlQuery->set($reservaProducto->direccion);
		$sqlQuery->set($reservaProducto->emails);
		$sqlQuery->set($reservaProducto->entradas);
		$sqlQuery->set($reservaProducto->condicion);
		$sqlQuery->set($reservaProducto->pension);
		$sqlQuery->setNumber($reservaProducto->adultos);
		$sqlQuery->setNumber($reservaProducto->ninios);
		$sqlQuery->set($reservaProducto->descuento);
		$sqlQuery->set($reservaProducto->cupon);

		$id = $this->executeInsert($sqlQuery);	
		$reservaProducto->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param ReservaProductoMySql reservaProducto
 	 */
	public function update($reservaProducto){
		$sql = 'UPDATE reserva_producto SET reserva_id = ?, nombre = ?, tipo = ?, precio_unitario = ?, cantidad = ?, inicio = ?, final = ?, pago_offline = ?, importe_inicial = ?, porciento_inicial = ?, localizador = ?, telefono_contacto = ?, modo_pago_offline = ?, evento_id = ?, evento_tpv = ?, sesion = ?, direccion = ?, emails = ?, entradas = ?, condicion = ?, pension = ?, adultos = ?, ninios = ?, descuento = ?, cupon = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($reservaProducto->reservaId);
		$sqlQuery->set($reservaProducto->nombre);
		$sqlQuery->set($reservaProducto->tipo);
		$sqlQuery->set($reservaProducto->precioUnitario);
		$sqlQuery->set($reservaProducto->cantidad);
		$sqlQuery->set($reservaProducto->inicio);
		$sqlQuery->set($reservaProducto->final);
		$sqlQuery->setNumber($reservaProducto->pagoOffline);
		$sqlQuery->set($reservaProducto->importeInicial);
		$sqlQuery->set($reservaProducto->porcientoInicial);
		$sqlQuery->set($reservaProducto->localizador);
		$sqlQuery->set($reservaProducto->telefonoContacto);
		$sqlQuery->set($reservaProducto->modoPagoOffline);
		$sqlQuery->setNumber($reservaProducto->eventoId);
		$sqlQuery->set($reservaProducto->eventoTpv);
		$sqlQuery->set($reservaProducto->sesion);
		$sqlQuery->set($reservaProducto->direccion);
		$sqlQuery->set($reservaProducto->emails);
		$sqlQuery->set($reservaProducto->entradas);
		$sqlQuery->set($reservaProducto->condicion);
		$sqlQuery->set($reservaProducto->pension);
		$sqlQuery->setNumber($reservaProducto->adultos);
		$sqlQuery->setNumber($reservaProducto->ninios);
		$sqlQuery->set($reservaProducto->descuento);
		$sqlQuery->set($reservaProducto->cupon);

		$sqlQuery->setNumber($reservaProducto->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM reserva_producto';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByReservaId($value){
		$sql = 'SELECT * FROM reserva_producto WHERE reserva_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByNombre($value){
		$sql = 'SELECT * FROM reserva_producto WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTipo($value){
		$sql = 'SELECT * FROM reserva_producto WHERE tipo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPrecioUnitario($value){
		$sql = 'SELECT * FROM reserva_producto WHERE precio_unitario = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCantidad($value){
		$sql = 'SELECT * FROM reserva_producto WHERE cantidad = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByInicio($value){
		$sql = 'SELECT * FROM reserva_producto WHERE inicio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByFinal($value){
		$sql = 'SELECT * FROM reserva_producto WHERE final = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPagoOffline($value){
		$sql = 'SELECT * FROM reserva_producto WHERE pago_offline = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByImporteInicial($value){
		$sql = 'SELECT * FROM reserva_producto WHERE importe_inicial = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPorcientoInicial($value){
		$sql = 'SELECT * FROM reserva_producto WHERE porciento_inicial = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByLocalizador($value){
		$sql = 'SELECT * FROM reserva_producto WHERE localizador = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTelefonoContacto($value){
		$sql = 'SELECT * FROM reserva_producto WHERE telefono_contacto = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByModoPagoOffline($value){
		$sql = 'SELECT * FROM reserva_producto WHERE modo_pago_offline = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEventoId($value){
		$sql = 'SELECT * FROM reserva_producto WHERE evento_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEventoTpv($value){
		$sql = 'SELECT * FROM reserva_producto WHERE evento_tpv = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryBySesion($value){
		$sql = 'SELECT * FROM reserva_producto WHERE sesion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDireccion($value){
		$sql = 'SELECT * FROM reserva_producto WHERE direccion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEmails($value){
		$sql = 'SELECT * FROM reserva_producto WHERE emails = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEntradas($value){
		$sql = 'SELECT * FROM reserva_producto WHERE entradas = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCondicion($value){
		$sql = 'SELECT * FROM reserva_producto WHERE condicion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPension($value){
		$sql = 'SELECT * FROM reserva_producto WHERE pension = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByAdultos($value){
		$sql = 'SELECT * FROM reserva_producto WHERE adultos = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByNinios($value){
		$sql = 'SELECT * FROM reserva_producto WHERE ninios = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByDescuento($value){
		$sql = 'SELECT * FROM reserva_producto WHERE descuento = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCupon($value){
		$sql = 'SELECT * FROM reserva_producto WHERE cupon = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByReservaId($value){
		$sql = 'DELETE FROM reserva_producto WHERE reserva_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByNombre($value){
		$sql = 'DELETE FROM reserva_producto WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTipo($value){
		$sql = 'DELETE FROM reserva_producto WHERE tipo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPrecioUnitario($value){
		$sql = 'DELETE FROM reserva_producto WHERE precio_unitario = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCantidad($value){
		$sql = 'DELETE FROM reserva_producto WHERE cantidad = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByInicio($value){
		$sql = 'DELETE FROM reserva_producto WHERE inicio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByFinal($value){
		$sql = 'DELETE FROM reserva_producto WHERE final = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPagoOffline($value){
		$sql = 'DELETE FROM reserva_producto WHERE pago_offline = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByImporteInicial($value){
		$sql = 'DELETE FROM reserva_producto WHERE importe_inicial = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPorcientoInicial($value){
		$sql = 'DELETE FROM reserva_producto WHERE porciento_inicial = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByLocalizador($value){
		$sql = 'DELETE FROM reserva_producto WHERE localizador = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTelefonoContacto($value){
		$sql = 'DELETE FROM reserva_producto WHERE telefono_contacto = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByModoPagoOffline($value){
		$sql = 'DELETE FROM reserva_producto WHERE modo_pago_offline = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEventoId($value){
		$sql = 'DELETE FROM reserva_producto WHERE evento_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEventoTpv($value){
		$sql = 'DELETE FROM reserva_producto WHERE evento_tpv = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteBySesion($value){
		$sql = 'DELETE FROM reserva_producto WHERE sesion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDireccion($value){
		$sql = 'DELETE FROM reserva_producto WHERE direccion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEmails($value){
		$sql = 'DELETE FROM reserva_producto WHERE emails = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEntradas($value){
		$sql = 'DELETE FROM reserva_producto WHERE entradas = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCondicion($value){
		$sql = 'DELETE FROM reserva_producto WHERE condicion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPension($value){
		$sql = 'DELETE FROM reserva_producto WHERE pension = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByAdultos($value){
		$sql = 'DELETE FROM reserva_producto WHERE adultos = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByNinios($value){
		$sql = 'DELETE FROM reserva_producto WHERE ninios = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByDescuento($value){
		$sql = 'DELETE FROM reserva_producto WHERE descuento = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCupon($value){
		$sql = 'DELETE FROM reserva_producto WHERE cupon = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return ReservaProductoMySql 
	 */
	protected function readRow($row){
		$reservaProducto = new ReservaProducto();
		
		$reservaProducto->id = $row['id'];
		$reservaProducto->reservaId = $row['reserva_id'];
		$reservaProducto->nombre = $row['nombre'];
		$reservaProducto->tipo = $row['tipo'];
		$reservaProducto->precioUnitario = $row['precio_unitario'];
		$reservaProducto->cantidad = $row['cantidad'];
		$reservaProducto->inicio = $row['inicio'];
		$reservaProducto->final = $row['final'];
		$reservaProducto->pagoOffline = $row['pago_offline'];
		$reservaProducto->importeInicial = $row['importe_inicial'];
		$reservaProducto->porcientoInicial = $row['porciento_inicial'];
		$reservaProducto->localizador = $row['localizador'];
		$reservaProducto->telefonoContacto = $row['telefono_contacto'];
		$reservaProducto->modoPagoOffline = $row['modo_pago_offline'];
		$reservaProducto->eventoId = $row['evento_id'];
		$reservaProducto->eventoTpv = $row['evento_tpv'];
		$reservaProducto->sesion = $row['sesion'];
		$reservaProducto->direccion = $row['direccion'];
		$reservaProducto->emails = $row['emails'];
		$reservaProducto->entradas = $row['entradas'];
		$reservaProducto->condicion = $row['condicion'];
		$reservaProducto->pension = $row['pension'];
		$reservaProducto->adultos = $row['adultos'];
		$reservaProducto->ninios = $row['ninios'];
		$reservaProducto->descuento = $row['descuento'];
		$reservaProducto->cupon = $row['cupon'];

		return $reservaProducto;
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
	 * @return ReservaProductoMySql 
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