<?php
/**
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2014-07-18 08:49
 */
interface CampaniaDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Campania 
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
 	 * @param campania primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Campania campania
 	 */
	public function insert($campania);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Campania campania
 	 */
	public function update($campania);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByNombre($value);

	public function queryByEmpresaId($value);

	public function queryByInicio($value);

	public function queryByFin($value);

	public function queryByEstado($value);

	public function queryByNombreHotel($value);

	public function queryByLocalizador($value);

	public function queryByEmpresaDistribuidoraId($value);

	public function queryByEmail($value);

	public function queryByEstanciaMinima($value);

	public function queryByVentaAnticipada($value);

	public function queryBySubdominio($value);

	public function queryByPorcentajeBeneficio($value);

	public function queryByTipo($value);


	public function deleteByNombre($value);

	public function deleteByEmpresaId($value);

	public function deleteByInicio($value);

	public function deleteByFin($value);

	public function deleteByEstado($value);

	public function deleteByNombreHotel($value);

	public function deleteByLocalizador($value);

	public function deleteByEmpresaDistribuidoraId($value);

	public function deleteByEmail($value);

	public function deleteByEstanciaMinima($value);

	public function deleteByVentaAnticipada($value);

	public function deleteBySubdominio($value);

	public function deleteByPorcentajeBeneficio($value);

	public function deleteByTipo($value);


}
?>