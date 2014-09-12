<?php
/**
 * Class that operate on table 'afiliado_widget'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class AfiliadoWidgetMySqlDAO implements AfiliadoWidgetDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return AfiliadoWidgetMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM afiliado_widget WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM afiliado_widget';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM afiliado_widget ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param afiliadoWidget primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM afiliado_widget WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param AfiliadoWidgetMySql afiliadoWidget
 	 */
	public function insert($afiliadoWidget){
		$sql = 'INSERT INTO afiliado_widget (nombre, configuracion, tipo, afiliado_id) VALUES (?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($afiliadoWidget->nombre);
		$sqlQuery->set($afiliadoWidget->configuracion);
		$sqlQuery->set($afiliadoWidget->tipo);
		$sqlQuery->setNumber($afiliadoWidget->afiliadoId);

		$id = $this->executeInsert($sqlQuery);	
		$afiliadoWidget->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param AfiliadoWidgetMySql afiliadoWidget
 	 */
	public function update($afiliadoWidget){
		$sql = 'UPDATE afiliado_widget SET nombre = ?, configuracion = ?, tipo = ?, afiliado_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($afiliadoWidget->nombre);
		$sqlQuery->set($afiliadoWidget->configuracion);
		$sqlQuery->set($afiliadoWidget->tipo);
		$sqlQuery->setNumber($afiliadoWidget->afiliadoId);

		$sqlQuery->setNumber($afiliadoWidget->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM afiliado_widget';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByNombre($value){
		$sql = 'SELECT * FROM afiliado_widget WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByConfiguracion($value){
		$sql = 'SELECT * FROM afiliado_widget WHERE configuracion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTipo($value){
		$sql = 'SELECT * FROM afiliado_widget WHERE tipo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByAfiliadoId($value){
		$sql = 'SELECT * FROM afiliado_widget WHERE afiliado_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByNombre($value){
		$sql = 'DELETE FROM afiliado_widget WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByConfiguracion($value){
		$sql = 'DELETE FROM afiliado_widget WHERE configuracion = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTipo($value){
		$sql = 'DELETE FROM afiliado_widget WHERE tipo = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByAfiliadoId($value){
		$sql = 'DELETE FROM afiliado_widget WHERE afiliado_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return AfiliadoWidgetMySql 
	 */
	protected function readRow($row){
		$afiliadoWidget = new AfiliadoWidget();
		
		$afiliadoWidget->id = $row['id'];
		$afiliadoWidget->nombre = $row['nombre'];
		$afiliadoWidget->configuracion = $row['configuracion'];
		$afiliadoWidget->tipo = $row['tipo'];
		$afiliadoWidget->afiliadoId = $row['afiliado_id'];

		return $afiliadoWidget;
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
	 * @return AfiliadoWidgetMySql 
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