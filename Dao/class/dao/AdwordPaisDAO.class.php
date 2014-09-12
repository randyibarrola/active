<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface AdwordPaisDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return AdwordPais 
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
 	 * @param adwordPai primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param AdwordPais adwordPai
 	 */
	public function insert($adwordPai);
	
	/**
 	 * Update record in table
 	 *
 	 * @param AdwordPais adwordPai
 	 */
	public function update($adwordPai);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByAdwordId($value);

	public function queryByPaisId($value);


	public function deleteByAdwordId($value);

	public function deleteByPaisId($value);


}
?>