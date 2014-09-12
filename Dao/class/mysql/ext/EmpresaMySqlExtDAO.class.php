<?php
/**
 * Class that operate on table 'empresa'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-11-26 16:54
 */
class EmpresaMySqlExtDAO extends EmpresaMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new Empresa ();
        return $this->mysql->prepare($obj, $data);
    }
    
    function queryByUsuarioId($id) {
        $sql = 'SELECT distinct ee.* FROM usuario_empresa AS ue
                LEFT JOIN campania AS ca 
                  ON ca.empresa_id = ue.empresa_id 
                  OR ue.empresa_id = ca.empresa_distribuidora_id
                LEFT JOIN empresa AS ee 
                  ON ca.empresa_id = ee.id 
                  OR (ee.id = ca.empresa_distribuidora_id AND ee.id = ue.empresa_id) 
                  OR ue.empresa_id = ee.id 
                WHERE ue.usuario_id = ?';
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->setNumber($id);
        return $this->getList($sqlQuery);
    }
    
    function queryByEmpresaUsuarioId($id) {
        $sql = 'SELECT distinct e.* FROM empresa AS e
                INNER JOIN usuario_empresa AS ue 
                  ON ue.empresa_id = e.id
                WHERE ue.usuario_id = ?';
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->setNumber($id);
        return $this->getList($sqlQuery);
    }
}
?>