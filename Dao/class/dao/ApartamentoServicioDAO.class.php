<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface ApartamentoServicioDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return ApartamentoServicio 
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
 	 * @param apartamentoServicio primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param ApartamentoServicio apartamentoServicio
 	 */
	public function insert($apartamentoServicio);
	
	/**
 	 * Update record in table
 	 *
 	 * @param ApartamentoServicio apartamentoServicio
 	 */
	public function update($apartamentoServicio);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByApartamentoId($value);

	public function queryByServicioId($value);


	public function deleteByApartamentoId($value);

	public function deleteByServicioId($value);


}
?>