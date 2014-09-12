<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface EventoCondicionDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return EventoCondicion 
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
 	 * @param eventoCondicion primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param EventoCondicion eventoCondicion
 	 */
	public function insert($eventoCondicion);
	
	/**
 	 * Update record in table
 	 *
 	 * @param EventoCondicion eventoCondicion
 	 */
	public function update($eventoCondicion);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByEventoId($value);

	public function queryByCondicionId($value);


	public function deleteByEventoId($value);

	public function deleteByCondicionId($value);


}
?>