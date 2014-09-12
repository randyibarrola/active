<?php
/**
 * Class that operate on table 'condicion'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-11-04 19:49
 */
class CondicionMySqlExtDAO extends CondicionMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new Condicion ();
        return $this->mysql->prepare($obj, $data);
    }
    
    public function queryAll(){
        $sql = 'SELECT * FROM condicion order by condicion_categoria_id';
        $sqlQuery = new SqlQuery($sql);
        return $this->getList($sqlQuery);
    }
    
    public function queryByDistribuidorId($value){
        $sql = 'SELECT * FROM condicion WHERE usuario_id = ? OR usuario_id IS NULL order by condicion_categoria_id';
        $sqlQuery = new SqlQuery($sql);
        $sqlQuery->setNumber($value);
        return $this->getList($sqlQuery);
    }
}
?>