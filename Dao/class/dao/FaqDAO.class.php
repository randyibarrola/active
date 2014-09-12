<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface FaqDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Faq 
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
 	 * @param faq primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Faq faq
 	 */
	public function insert($faq);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Faq faq
 	 */
	public function update($faq);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByContenido($value);


	public function deleteByContenido($value);


}
?>