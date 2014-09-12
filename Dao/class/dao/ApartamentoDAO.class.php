<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface ApartamentoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Apartamento 
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
 	 * @param apartamento primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Apartamento apartamento
 	 */
	public function insert($apartamento);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Apartamento apartamento
 	 */
	public function update($apartamento);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByNombre($value);

	public function queryByHotelId($value);

	public function queryByDescripcionCorta($value);

	public function queryByDescripcionLarga($value);

	public function queryByEstado($value);

	public function queryByAdultos($value);

	public function queryBySuperficie($value);

	public function queryByNinios($value);

	public function queryByTiempoCreacion($value);

	public function queryByUltimaModificacion($value);


	public function deleteByNombre($value);

	public function deleteByHotelId($value);

	public function deleteByDescripcionCorta($value);

	public function deleteByDescripcionLarga($value);

	public function deleteByEstado($value);

	public function deleteByAdultos($value);

	public function deleteBySuperficie($value);

	public function deleteByNinios($value);

	public function deleteByTiempoCreacion($value);

	public function deleteByUltimaModificacion($value);


}
?>