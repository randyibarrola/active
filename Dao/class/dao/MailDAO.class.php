<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface MailDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Mail 
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
 	 * @param mail primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Mail mail
 	 */
	public function insert($mail);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Mail mail
 	 */
	public function update($mail);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByEmail($value);

	public function queryByMailcol($value);

	public function queryByMailTipoId($value);

	public function queryByEmpresaId($value);


	public function deleteByEmail($value);

	public function deleteByMailcol($value);

	public function deleteByMailTipoId($value);

	public function deleteByEmpresaId($value);


}
?>