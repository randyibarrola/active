<?php
/**
 * Class that operate on table 'afiliado'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class AfiliadoMySqlDAO implements AfiliadoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return AfiliadoMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM afiliado WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM afiliado';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM afiliado ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param afiliado primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM afiliado WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param AfiliadoMySql afiliado
 	 */
	public function insert($afiliado){
		$sql = 'INSERT INTO afiliado (usuario_id, moneda_id, idioma_id, nombre_comercial, web, comision_hotel, comision_evento) VALUES (?, ?, ?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($afiliado->usuarioId);
		$sqlQuery->setNumber($afiliado->monedaId);
		$sqlQuery->setNumber($afiliado->idiomaId);
		$sqlQuery->set($afiliado->nombreComercial);
		$sqlQuery->set($afiliado->web);
		$sqlQuery->set($afiliado->comisionHotel);
		$sqlQuery->set($afiliado->comisionEvento);

		$id = $this->executeInsert($sqlQuery);	
		$afiliado->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param AfiliadoMySql afiliado
 	 */
	public function update($afiliado){
		$sql = 'UPDATE afiliado SET usuario_id = ?, moneda_id = ?, idioma_id = ?, nombre_comercial = ?, web = ?, comision_hotel = ?, comision_evento = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($afiliado->usuarioId);
		$sqlQuery->setNumber($afiliado->monedaId);
		$sqlQuery->setNumber($afiliado->idiomaId);
		$sqlQuery->set($afiliado->nombreComercial);
		$sqlQuery->set($afiliado->web);
		$sqlQuery->set($afiliado->comisionHotel);
		$sqlQuery->set($afiliado->comisionEvento);

		$sqlQuery->setNumber($afiliado->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM afiliado';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByUsuarioId($value){
		$sql = 'SELECT * FROM afiliado WHERE usuario_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByMonedaId($value){
		$sql = 'SELECT * FROM afiliado WHERE moneda_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByIdiomaId($value){
		$sql = 'SELECT * FROM afiliado WHERE idioma_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByNombreComercial($value){
		$sql = 'SELECT * FROM afiliado WHERE nombre_comercial = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByWeb($value){
		$sql = 'SELECT * FROM afiliado WHERE web = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByComisionHotel($value){
		$sql = 'SELECT * FROM afiliado WHERE comision_hotel = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByComisionEvento($value){
		$sql = 'SELECT * FROM afiliado WHERE comision_evento = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByUsuarioId($value){
		$sql = 'DELETE FROM afiliado WHERE usuario_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByMonedaId($value){
		$sql = 'DELETE FROM afiliado WHERE moneda_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByIdiomaId($value){
		$sql = 'DELETE FROM afiliado WHERE idioma_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByNombreComercial($value){
		$sql = 'DELETE FROM afiliado WHERE nombre_comercial = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByWeb($value){
		$sql = 'DELETE FROM afiliado WHERE web = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByComisionHotel($value){
		$sql = 'DELETE FROM afiliado WHERE comision_hotel = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByComisionEvento($value){
		$sql = 'DELETE FROM afiliado WHERE comision_evento = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return AfiliadoMySql 
	 */
	protected function readRow($row){
		$afiliado = new Afiliado();
		
		$afiliado->id = $row['id'];
		$afiliado->usuarioId = $row['usuario_id'];
		$afiliado->monedaId = $row['moneda_id'];
		$afiliado->idiomaId = $row['idioma_id'];
		$afiliado->nombreComercial = $row['nombre_comercial'];
		$afiliado->web = $row['web'];
		$afiliado->comisionHotel = $row['comision_hotel'];
		$afiliado->comisionEvento = $row['comision_evento'];

		return $afiliado;
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
	 * @return AfiliadoMySql 
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