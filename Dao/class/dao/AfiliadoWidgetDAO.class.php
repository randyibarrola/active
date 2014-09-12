<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface AfiliadoWidgetDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return AfiliadoWidget 
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
 	 * @param afiliadoWidget primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param AfiliadoWidget afiliadoWidget
 	 */
	public function insert($afiliadoWidget);
	
	/**
 	 * Update record in table
 	 *
 	 * @param AfiliadoWidget afiliadoWidget
 	 */
	public function update($afiliadoWidget);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByNombre($value);

	public function queryByConfiguracion($value);

	public function queryByTipo($value);

	public function queryByAfiliadoId($value);


	public function deleteByNombre($value);

	public function deleteByConfiguracion($value);

	public function deleteByTipo($value);

	public function deleteByAfiliadoId($value);


}
?>