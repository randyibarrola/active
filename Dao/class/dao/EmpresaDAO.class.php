<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface EmpresaDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Empresa 
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
 	 * @param empresa primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Empresa empresa
 	 */
	public function insert($empresa);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Empresa empresa
 	 */
	public function update($empresa);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByNombreComercial($value);

	public function queryByNombreFiscal($value);

	public function queryByNumeroFiscal($value);

	public function queryByTelefonoReservas($value);

	public function queryByEmailReservas($value);

	public function queryByDireccionId($value);

	public function queryByContactoNombre($value);

	public function queryByContactoApellidos($value);

	public function queryByContactoEmail($value);

	public function queryByDestinoTuristico($value);

	public function queryByEmpresaTipoId($value);

	public function queryByEmpresaDistribuidoraId($value);

	public function queryByEstado($value);

	public function queryByContactoDni($value);

	public function queryByPorcentajeBeneficio($value);


	public function deleteByNombreComercial($value);

	public function deleteByNombreFiscal($value);

	public function deleteByNumeroFiscal($value);

	public function deleteByTelefonoReservas($value);

	public function deleteByEmailReservas($value);

	public function deleteByDireccionId($value);

	public function deleteByContactoNombre($value);

	public function deleteByContactoApellidos($value);

	public function deleteByContactoEmail($value);

	public function deleteByDestinoTuristico($value);

	public function deleteByEmpresaTipoId($value);

	public function deleteByEmpresaDistribuidoraId($value);

	public function deleteByEstado($value);

	public function deleteByContactoDni($value);

	public function deleteByPorcentajeBeneficio($value);


}
?>