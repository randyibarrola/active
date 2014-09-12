<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface AdwordDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Adword 
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
 	 * @param adword primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Adword adword
 	 */
	public function insert($adword);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Adword adword
 	 */
	public function update($adword);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByNombreCampania($value);

	public function queryByPresupuesto($value);

	public function queryByTiempoCreacion($value);

	public function queryByInicio($value);

	public function queryByFin($value);

	public function queryByPalabrasClave($value);

	public function queryByHotelId($value);


	public function deleteByNombreCampania($value);

	public function deleteByPresupuesto($value);

	public function deleteByTiempoCreacion($value);

	public function deleteByInicio($value);

	public function deleteByFin($value);

	public function deleteByPalabrasClave($value);

	public function deleteByHotelId($value);


}
?>