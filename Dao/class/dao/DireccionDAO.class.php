<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface DireccionDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Direccion 
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
 	 * @param direccion primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Direccion direccion
 	 */
	public function insert($direccion);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Direccion direccion
 	 */
	public function update($direccion);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByDescripcion($value);

	public function queryByLat($value);

	public function queryByLon($value);

	public function queryByCalle($value);

	public function queryByCodigoPostal($value);

	public function queryByCiudad($value);

	public function queryByEstado($value);


	public function deleteByDescripcion($value);

	public function deleteByLat($value);

	public function deleteByLon($value);

	public function deleteByCalle($value);

	public function deleteByCodigoPostal($value);

	public function deleteByCiudad($value);

	public function deleteByEstado($value);


}
?>