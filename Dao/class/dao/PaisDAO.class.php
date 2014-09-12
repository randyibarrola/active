<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface PaisDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Pais 
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
 	 * @param pai primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Pais pai
 	 */
	public function insert($pai);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Pais pai
 	 */
	public function update($pai);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByIso2($value);

	public function queryByIso3($value);

	public function queryByPrefijo($value);

	public function queryByNombre($value);

	public function queryByContinente($value);

	public function queryBySubcontinente($value);

	public function queryByIsoMoneda($value);

	public function queryByNombreMoneda($value);


	public function deleteByIso2($value);

	public function deleteByIso3($value);

	public function deleteByPrefijo($value);

	public function deleteByNombre($value);

	public function deleteByContinente($value);

	public function deleteBySubcontinente($value);

	public function deleteByIsoMoneda($value);

	public function deleteByNombreMoneda($value);


}
?>