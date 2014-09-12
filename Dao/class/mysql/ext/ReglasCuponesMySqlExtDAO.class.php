<?php
/**
 * Class that operate on table 'reglas_cupones'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-11-26 21:33
 */
class ReglasCuponesMySqlExtDAO extends ReglasCuponesMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new ReglasCupone ();
        return $this->mysql->prepare($obj, $data);
    }
    
    public function queryByConfiguracionIdMontoAsc($value){
		$sql = 'SELECT * FROM reglas_cupones WHERE configuracion_id = ? order by monto ASC';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}
}
?>