<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-08-13 08:07
 */
interface ReservaAfiliadoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return ReservaAfiliado 
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
 	 * @param reservaAfiliado primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param ReservaAfiliado reservaAfiliado
 	 */
	public function insert($reservaAfiliado);
	
	/**
 	 * Update record in table
 	 *
 	 * @param ReservaAfiliado reservaAfiliado
 	 */
	public function update($reservaAfiliado);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByComision($value);

	public function queryByPorcentaje($value);

	public function queryByReservaId($value);

	public function queryByAfiliadoId($value);


	public function deleteByComision($value);

	public function deleteByPorcentaje($value);

	public function deleteByReservaId($value);

	public function deleteByAfiliadoId($value);


}
?>