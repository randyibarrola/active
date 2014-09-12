<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface TicketDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Ticket 
	 */
	public function load($id);

	/**
	 * Get all records from table
	 */
	public function queryAll();
	
	/**
	 * Get all records from table ordered by field
	 * @Param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn);
	
	/**
 	 * Delete record from table
 	 * @param ticket primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Ticket ticket
 	 */
	public function insert($ticket);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Ticket ticket
 	 */
	public function update($ticket);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByIdiomaId($value);

	public function queryByNombre($value);

	public function queryByPrecio($value);

	public function queryByStock($value);

	public function queryByHorario($value);

	public function queryByEventoId($value);


	public function deleteByIdiomaId($value);

	public function deleteByNombre($value);

	public function deleteByPrecio($value);

	public function deleteByStock($value);

	public function deleteByHorario($value);

	public function deleteByEventoId($value);


}
?>