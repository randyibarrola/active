<?php
/**
 * Class that operate on table 'configuracion'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-11-20 16:16
 */
class ConfiguracionMySqlExtDAO extends ConfiguracionMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new Configuracion ();
        return $this->mysql->prepare($obj, $data);
    }
    
    
    function queryByCampaniaId($value) {
        $sql = ' SELECT co.* FROM configuracion AS co 
                 INNER JOIN usuario AS u ON u.id = co.usuario_id
                 INNER JOIN usuario_empresa AS ue ON ue.usuario_id = u.id
                 INNER JOIN empresa AS e ON e.id = ue.empresa_id
                 INNER JOIN campania AS ca ON ca.empresa_distribuidora_id = e.id
                 WHERE ca.id = ?';
        
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->setNumber($value);
        return $this->getList($sqlQuery);
    }
}
?>