<?php
/**
 * Class that operate on table 'mail'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class MailMySqlDAO implements MailDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return MailMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM mail WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM mail';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM mail ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param mail primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM mail WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param MailMySql mail
 	 */
	public function insert($mail){
		$sql = 'INSERT INTO mail (email, mailcol, mail_tipo_id, empresa_id) VALUES (?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($mail->email);
		$sqlQuery->set($mail->mailcol);
		$sqlQuery->setNumber($mail->mailTipoId);
		$sqlQuery->setNumber($mail->empresaId);

		$id = $this->executeInsert($sqlQuery);	
		$mail->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param MailMySql mail
 	 */
	public function update($mail){
		$sql = 'UPDATE mail SET email = ?, mailcol = ?, mail_tipo_id = ?, empresa_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($mail->email);
		$sqlQuery->set($mail->mailcol);
		$sqlQuery->setNumber($mail->mailTipoId);
		$sqlQuery->setNumber($mail->empresaId);

		$sqlQuery->setNumber($mail->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM mail';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByEmail($value){
		$sql = 'SELECT * FROM mail WHERE email = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByMailcol($value){
		$sql = 'SELECT * FROM mail WHERE mailcol = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByMailTipoId($value){
		$sql = 'SELECT * FROM mail WHERE mail_tipo_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEmpresaId($value){
		$sql = 'SELECT * FROM mail WHERE empresa_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByEmail($value){
		$sql = 'DELETE FROM mail WHERE email = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByMailcol($value){
		$sql = 'DELETE FROM mail WHERE mailcol = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByMailTipoId($value){
		$sql = 'DELETE FROM mail WHERE mail_tipo_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEmpresaId($value){
		$sql = 'DELETE FROM mail WHERE empresa_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return MailMySql 
	 */
	protected function readRow($row){
		$mail = new Mail();
		
		$mail->id = $row['id'];
		$mail->email = $row['email'];
		$mail->mailcol = $row['mailcol'];
		$mail->mailTipoId = $row['mail_tipo_id'];
		$mail->empresaId = $row['empresa_id'];

		return $mail;
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
	 * @return MailMySql 
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