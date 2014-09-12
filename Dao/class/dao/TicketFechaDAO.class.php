<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface TicketFechaDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return TicketFecha 
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
 	 * @param ticketFecha primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param TicketFecha ticketFecha
 	 */
	public function insert($ticketFecha);
	
	/**
 	 * Update record in table
 	 *
 	 * @param TicketFecha ticketFecha
 	 */
	public function update($ticketFecha);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByFecha($value);

	public function queryByTicketId($value);


	public function deleteByFecha($value);

	public function deleteByTicketId($value);


}
?>