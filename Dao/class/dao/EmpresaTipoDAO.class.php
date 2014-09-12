<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface EmpresaTipoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return EmpresaTipo 
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
 	 * @param empresaTipo primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param EmpresaTipo empresaTipo
 	 */
	public function insert($empresaTipo);
	
	/**
 	 * Update record in table
 	 *
 	 * @param EmpresaTipo empresaTipo
 	 */
	public function update($empresaTipo);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByTipo($value);


	public function deleteByTipo($value);


}
?>