<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface FacturaReservaDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return FacturaReserva 
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
 	 * @param facturaReserva primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param FacturaReserva facturaReserva
 	 */
	public function insert($facturaReserva);
	
	/**
 	 * Update record in table
 	 *
 	 * @param FacturaReserva facturaReserva
 	 */
	public function update($facturaReserva);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByFacturaId($value);

	public function queryByReservaId($value);


	public function deleteByFacturaId($value);

	public function deleteByReservaId($value);


}
?>