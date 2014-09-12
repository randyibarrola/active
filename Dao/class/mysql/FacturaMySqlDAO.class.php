<?php
/**
 * Class that operate on table 'factura'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class FacturaMySqlDAO implements FacturaDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return FacturaMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM factura WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM factura';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM factura ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param factura primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM factura WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param FacturaMySql factura
 	 */
	public function insert($factura){
		$sql = 'INSERT INTO factura (hotel_id, tiempo_creacion, ultima_modificacion, estado, total, comision, moneda_id, contrato, numero, cliente) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($factura->hotelId);
		$sqlQuery->set($factura->tiempoCreacion);
		$sqlQuery->set($factura->ultimaModificacion);
		$sqlQuery->set($factura->estado);
		$sqlQuery->set($factura->total);
		$sqlQuery->set($factura->comision);
		$sqlQuery->setNumber($factura->monedaId);
		$sqlQuery->set($factura->contrato);
		$sqlQuery->set($factura->numero);
		$sqlQuery->set($factura->cliente);

		$id = $this->executeInsert($sqlQuery);	
		$factura->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param FacturaMySql factura
 	 */
	public function update($factura){
		$sql = 'UPDATE factura SET hotel_id = ?, tiempo_creacion = ?, ultima_modificacion = ?, estado = ?, total = ?, comision = ?, moneda_id = ?, contrato = ?, numero = ?, cliente = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($factura->hotelId);
		$sqlQuery->set($factura->tiempoCreacion);
		$sqlQuery->set($factura->ultimaModificacion);
		$sqlQuery->set($factura->estado);
		$sqlQuery->set($factura->total);
		$sqlQuery->set($factura->comision);
		$sqlQuery->setNumber($factura->monedaId);
		$sqlQuery->set($factura->contrato);
		$sqlQuery->set($factura->numero);
		$sqlQuery->set($factura->cliente);

		$sqlQuery->setNumber($factura->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM factura';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByHotelId($value){
		$sql = 'SELECT * FROM factura WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTiempoCreacion($value){
		$sql = 'SELECT * FROM factura WHERE tiempo_creacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByUltimaModificacion($value){
		$sql = 'SELECT * FROM factura WHERE ultima_modificacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEstado($value){
		$sql = 'SELECT * FROM factura WHERE estado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTotal($value){
		$sql = 'SELECT * FROM factura WHERE total = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByComision($value){
		$sql = 'SELECT * FROM factura WHERE comision = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByMonedaId($value){
		$sql = 'SELECT * FROM factura WHERE moneda_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByContrato($value){
		$sql = 'SELECT * FROM factura WHERE contrato = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByNumero($value){
		$sql = 'SELECT * FROM factura WHERE numero = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCliente($value){
		$sql = 'SELECT * FROM factura WHERE cliente = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByHotelId($value){
		$sql = 'DELETE FROM factura WHERE hotel_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTiempoCreacion($value){
		$sql = 'DELETE FROM factura WHERE tiempo_creacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByUltimaModificacion($value){
		$sql = 'DELETE FROM factura WHERE ultima_modificacion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEstado($value){
		$sql = 'DELETE FROM factura WHERE estado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTotal($value){
		$sql = 'DELETE FROM factura WHERE total = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByComision($value){
		$sql = 'DELETE FROM factura WHERE comision = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByMonedaId($value){
		$sql = 'DELETE FROM factura WHERE moneda_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByContrato($value){
		$sql = 'DELETE FROM factura WHERE contrato = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByNumero($value){
		$sql = 'DELETE FROM factura WHERE numero = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCliente($value){
		$sql = 'DELETE FROM factura WHERE cliente = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return FacturaMySql 
	 */
	protected function readRow($row){
		$factura = new Factura();
		
		$factura->id = $row['id'];
		$factura->hotelId = $row['hotel_id'];
		$factura->tiempoCreacion = $row['tiempo_creacion'];
		$factura->ultimaModificacion = $row['ultima_modificacion'];
		$factura->estado = $row['estado'];
		$factura->total = $row['total'];
		$factura->comision = $row['comision'];
		$factura->monedaId = $row['moneda_id'];
		$factura->contrato = $row['contrato'];
		$factura->numero = $row['numero'];
		$factura->cliente = $row['cliente'];

		return $factura;
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
	 * @return FacturaMySql 
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