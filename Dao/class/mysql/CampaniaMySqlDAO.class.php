<?php
/**
 * Class that operate on table 'campania'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class CampaniaMySqlDAO implements CampaniaDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return CampaniaMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM campania WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM campania';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM campania ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param campania primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM campania WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param CampaniaMySql campania
 	 */
	public function insert($campania){
		$sql = 'INSERT INTO campania (nombre, empresa_id, inicio, fin, estado, nombre_hotel, localizador, empresa_distribuidora_id, email, estancia_minima, venta_anticipada, subdominio, porcentaje_beneficio, tipo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($campania->nombre);
		$sqlQuery->setNumber($campania->empresaId);
		$sqlQuery->set($campania->inicio);
		$sqlQuery->set($campania->fin);
		$sqlQuery->set($campania->estado);
		$sqlQuery->set($campania->nombreHotel);
		$sqlQuery->set($campania->localizador);
		$sqlQuery->setNumber($campania->empresaDistribuidoraId);
		$sqlQuery->set($campania->email);
		$sqlQuery->setNumber($campania->estanciaMinima);
		$sqlQuery->setNumber($campania->ventaAnticipada);
		$sqlQuery->set($campania->subdominio);
		$sqlQuery->set($campania->porcentajeBeneficio);
		$sqlQuery->set($campania->tipo);

		$id = $this->executeInsert($sqlQuery);	
		$campania->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param CampaniaMySql campania
 	 */
	public function update($campania){
		$sql = 'UPDATE campania SET nombre = ?, empresa_id = ?, inicio = ?, fin = ?, estado = ?, nombre_hotel = ?, localizador = ?, empresa_distribuidora_id = ?, email = ?, estancia_minima = ?, venta_anticipada = ?, subdominio = ?, porcentaje_beneficio = ?, tipo = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($campania->nombre);
		$sqlQuery->setNumber($campania->empresaId);
		$sqlQuery->set($campania->inicio);
		$sqlQuery->set($campania->fin);
		$sqlQuery->set($campania->estado);
		$sqlQuery->set($campania->nombreHotel);
		$sqlQuery->set($campania->localizador);
		$sqlQuery->setNumber($campania->empresaDistribuidoraId);
		$sqlQuery->set($campania->email);
		$sqlQuery->setNumber($campania->estanciaMinima);
		$sqlQuery->setNumber($campania->ventaAnticipada);
		$sqlQuery->set($campania->subdominio);
		$sqlQuery->set($campania->porcentajeBeneficio);
		$sqlQuery->set($campania->tipo);

		$sqlQuery->setNumber($campania->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM campania';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByNombre($value){
		$sql = 'SELECT * FROM campania WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEmpresaId($value){
		$sql = 'SELECT * FROM campania WHERE empresa_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByInicio($value){
		$sql = 'SELECT * FROM campania WHERE inicio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByFin($value){
		$sql = 'SELECT * FROM campania WHERE fin = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEstado($value){
		$sql = 'SELECT * FROM campania WHERE estado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByNombreHotel($value){
		$sql = 'SELECT * FROM campania WHERE nombre_hotel = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByLocalizador($value){
		$sql = 'SELECT * FROM campania WHERE localizador = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEmpresaDistribuidoraId($value){
		$sql = 'SELECT * FROM campania WHERE empresa_distribuidora_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEmail($value){
		$sql = 'SELECT * FROM campania WHERE email = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEstanciaMinima($value){
		$sql = 'SELECT * FROM campania WHERE estancia_minima = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByVentaAnticipada($value){
		$sql = 'SELECT * FROM campania WHERE venta_anticipada = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryBySubdominio($value){
		$sql = 'SELECT * FROM campania WHERE subdominio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPorcentajeBeneficio($value){
		$sql = 'SELECT * FROM campania WHERE porcentaje_beneficio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTipo($value){
		$sql = 'SELECT * FROM campania WHERE tipo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByNombre($value){
		$sql = 'DELETE FROM campania WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEmpresaId($value){
		$sql = 'DELETE FROM campania WHERE empresa_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByInicio($value){
		$sql = 'DELETE FROM campania WHERE inicio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByFin($value){
		$sql = 'DELETE FROM campania WHERE fin = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEstado($value){
		$sql = 'DELETE FROM campania WHERE estado = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByNombreHotel($value){
		$sql = 'DELETE FROM campania WHERE nombre_hotel = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByLocalizador($value){
		$sql = 'DELETE FROM campania WHERE localizador = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEmpresaDistribuidoraId($value){
		$sql = 'DELETE FROM campania WHERE empresa_distribuidora_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEmail($value){
		$sql = 'DELETE FROM campania WHERE email = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEstanciaMinima($value){
		$sql = 'DELETE FROM campania WHERE estancia_minima = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByVentaAnticipada($value){
		$sql = 'DELETE FROM campania WHERE venta_anticipada = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteBySubdominio($value){
		$sql = 'DELETE FROM campania WHERE subdominio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPorcentajeBeneficio($value){
		$sql = 'DELETE FROM campania WHERE porcentaje_beneficio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTipo($value){
		$sql = 'DELETE FROM campania WHERE tipo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return CampaniaMySql 
	 */
	protected function readRow($row){
		$campania = new Campania();
		
		$campania->id = $row['id'];
		$campania->nombre = $row['nombre'];
		$campania->empresaId = $row['empresa_id'];
		$campania->inicio = $row['inicio'];
		$campania->fin = $row['fin'];
		$campania->estado = $row['estado'];
		$campania->nombreHotel = $row['nombre_hotel'];
		$campania->localizador = $row['localizador'];
		$campania->empresaDistribuidoraId = $row['empresa_distribuidora_id'];
		$campania->email = $row['email'];
		$campania->estanciaMinima = $row['estancia_minima'];
		$campania->ventaAnticipada = $row['venta_anticipada'];
		$campania->subdominio = $row['subdominio'];
		$campania->porcentajeBeneficio = $row['porcentaje_beneficio'];
		$campania->tipo = $row['tipo'];

		return $campania;
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
	 * @return CampaniaMySql 
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