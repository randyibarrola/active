<?php
/**
 * Class that operate on table 'destino_turistico'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-02-17 23:10
 */
class DestinoTuristicoMySqlExtDAO extends DestinoTuristicoMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new DestinoTuristico ();
        return $this->mysql->prepare($obj, $data);
    }
    
    function queryByTerm($term) {
        $sql = 'SELECT * FROM destino_turistico WHERE nombre like "%' . $term . '%"';
        
        $sqlQuery = new SqlQuery($sql);
        return $this->getList($sqlQuery);
    }
}
?>