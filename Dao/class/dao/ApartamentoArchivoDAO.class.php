<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface ApartamentoArchivoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return ApartamentoArchivo 
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
 	 * @param apartamentoArchivo primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param ApartamentoArchivo apartamentoArchivo
 	 */
	public function insert($apartamentoArchivo);
	
	/**
 	 * Update record in table
 	 *
 	 * @param ApartamentoArchivo apartamentoArchivo
 	 */
	public function update($apartamentoArchivo);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByApartamentoId($value);

	public function queryByArchivoId($value);

	public function queryByTipo($value);


	public function deleteByApartamentoId($value);

	public function deleteByArchivoId($value);

	public function deleteByTipo($value);


}
?>