<?php
/**
 * Class that operate on table 'adword_pais'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class AdwordPaisMySqlDAO implements AdwordPaisDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return AdwordPaisMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM adword_pais WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM adword_pais';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM adword_pais ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param adwordPai primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM adword_pais WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param AdwordPaisMySql adwordPai
 	 */
	public function insert($adwordPai){
		$sql = 'INSERT INTO adword_pais (adword_id, pais_id) VALUES (?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($adwordPai->adwordId);
		$sqlQuery->setNumber($adwordPai->paisId);

		$id = $this->executeInsert($sqlQuery);	
		$adwordPai->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param AdwordPaisMySql adwordPai
 	 */
	public function update($adwordPai){
		$sql = 'UPDATE adword_pais SET adword_id = ?, pais_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($adwordPai->adwordId);
		$sqlQuery->setNumber($adwordPai->paisId);

		$sqlQuery->setNumber($adwordPai->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM adword_pais';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByAdwordId($value){
		$sql = 'SELECT * FROM adword_pais WHERE adword_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPaisId($value){
		$sql = 'SELECT * FROM adword_pais WHERE pais_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByAdwordId($value){
		$sql = 'DELETE FROM adword_pais WHERE adword_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPaisId($value){
		$sql = 'DELETE FROM adword_pais WHERE pais_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return AdwordPaisMySql 
	 */
	protected function readRow($row){
		$adwordPai = new AdwordPai();
		
		$adwordPai->id = $row['id'];
		$adwordPai->adwordId = $row['adword_id'];
		$adwordPai->paisId = $row['pais_id'];

		return $adwordPai;
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
	 * @return AdwordPaisMySql 
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