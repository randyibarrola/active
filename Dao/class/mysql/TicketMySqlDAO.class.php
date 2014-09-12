<?php
/**
 * Class that operate on table 'ticket'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
class TicketMySqlDAO implements TicketDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return TicketMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM ticket WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM ticket';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM ticket ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param ticket primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM ticket WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param TicketMySql ticket
 	 */
	public function insert($ticket){
		$sql = 'INSERT INTO ticket (idioma_id, nombre, precio, stock, horario, evento_id) VALUES (?, ?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($ticket->idiomaId);
		$sqlQuery->set($ticket->nombre);
		$sqlQuery->set($ticket->precio);
		$sqlQuery->setNumber($ticket->stock);
		$sqlQuery->set($ticket->horario);
		$sqlQuery->setNumber($ticket->eventoId);

		$id = $this->executeInsert($sqlQuery);	
		$ticket->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param TicketMySql ticket
 	 */
	public function update($ticket){
		$sql = 'UPDATE ticket SET idioma_id = ?, nombre = ?, precio = ?, stock = ?, horario = ?, evento_id = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->setNumber($ticket->idiomaId);
		$sqlQuery->set($ticket->nombre);
		$sqlQuery->set($ticket->precio);
		$sqlQuery->setNumber($ticket->stock);
		$sqlQuery->set($ticket->horario);
		$sqlQuery->setNumber($ticket->eventoId);

		$sqlQuery->setNumber($ticket->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM ticket';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByIdiomaId($value){
		$sql = 'SELECT * FROM ticket WHERE idioma_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByNombre($value){
		$sql = 'SELECT * FROM ticket WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPrecio($value){
		$sql = 'SELECT * FROM ticket WHERE precio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByStock($value){
		$sql = 'SELECT * FROM ticket WHERE stock = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByHorario($value){
		$sql = 'SELECT * FROM ticket WHERE horario = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByEventoId($value){
		$sql = 'SELECT * FROM ticket WHERE evento_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByIdiomaId($value){
		$sql = 'DELETE FROM ticket WHERE idioma_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByNombre($value){
		$sql = 'DELETE FROM ticket WHERE nombre = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPrecio($value){
		$sql = 'DELETE FROM ticket WHERE precio = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByStock($value){
		$sql = 'DELETE FROM ticket WHERE stock = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByHorario($value){
		$sql = 'DELETE FROM ticket WHERE horario = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByEventoId($value){
		$sql = 'DELETE FROM ticket WHERE evento_id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return TicketMySql 
	 */
	protected function readRow($row){
		$ticket = new Ticket();
		
		$ticket->id = $row['id'];
		$ticket->idiomaId = $row['idioma_id'];
		$ticket->nombre = $row['nombre'];
		$ticket->precio = $row['precio'];
		$ticket->stock = $row['stock'];
		$ticket->horario = $row['horario'];
		$ticket->eventoId = $row['evento_id'];

		return $ticket;
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
	 * @return TicketMySql 
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