<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface AfiliadoEventoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return AfiliadoEvento 
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
 	 * @param afiliadoEvento primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param AfiliadoEvento afiliadoEvento
 	 */
	public function insert($afiliadoEvento);
	
	/**
 	 * Update record in table
 	 *
 	 * @param AfiliadoEvento afiliadoEvento
 	 */
	public function update($afiliadoEvento);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByAfiliadoId($value);

	public function queryByEventoId($value);


	public function deleteByAfiliadoId($value);

	public function deleteByEventoId($value);


}
?>