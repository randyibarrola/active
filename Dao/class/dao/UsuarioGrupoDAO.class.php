<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface UsuarioGrupoDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return UsuarioGrupo 
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
 	 * @param usuarioGrupo primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param UsuarioGrupo usuarioGrupo
 	 */
	public function insert($usuarioGrupo);
	
	/**
 	 * Update record in table
 	 *
 	 * @param UsuarioGrupo usuarioGrupo
 	 */
	public function update($usuarioGrupo);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByNombre($value);


	public function deleteByNombre($value);


}
?>