<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface ApartamentoCondicionDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return ApartamentoCondicion 
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
 	 * @param apartamentoCondicion primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param ApartamentoCondicion apartamentoCondicion
 	 */
	public function insert($apartamentoCondicion);
	
	/**
 	 * Update record in table
 	 *
 	 * @param ApartamentoCondicion apartamentoCondicion
 	 */
	public function update($apartamentoCondicion);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByApartamentoId($value);

	public function queryByCondicionId($value);


	public function deleteByApartamentoId($value);

	public function deleteByCondicionId($value);


}
?>