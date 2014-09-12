<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface UsuarioEmpresaDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return UsuarioEmpresa 
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
 	 * @param usuarioEmpresa primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param UsuarioEmpresa usuarioEmpresa
 	 */
	public function insert($usuarioEmpresa);
	
	/**
 	 * Update record in table
 	 *
 	 * @param UsuarioEmpresa usuarioEmpresa
 	 */
	public function update($usuarioEmpresa);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByUsuarioId($value);

	public function queryByEmpresaId($value);


	public function deleteByUsuarioId($value);

	public function deleteByEmpresaId($value);


}
?>