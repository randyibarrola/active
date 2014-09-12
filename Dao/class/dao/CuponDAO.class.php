<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-08-27 08:41
 */
interface CuponDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Cupon 
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
 	 * @param cupon primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Cupon cupon
 	 */
	public function insert($cupon);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Cupon cupon
 	 */
	public function update($cupon);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByCodigo($value);

	public function queryByEstado($value);

	public function queryByReglasCuponesId($value);


	public function deleteByCodigo($value);

	public function deleteByEstado($value);

	public function deleteByReglasCuponesId($value);


}
?>