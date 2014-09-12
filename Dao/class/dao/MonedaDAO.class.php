<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface MonedaDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Moneda 
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
 	 * @param moneda primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Moneda moneda
 	 */
	public function insert($moneda);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Moneda moneda
 	 */
	public function update($moneda);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByNombre($value);

	public function queryBySimbolo($value);

	public function queryByCodigo($value);

	public function queryByTasaCambio($value);

	public function queryByUltimaModificacion($value);


	public function deleteByNombre($value);

	public function deleteBySimbolo($value);

	public function deleteByCodigo($value);

	public function deleteByTasaCambio($value);

	public function deleteByUltimaModificacion($value);


}
?>