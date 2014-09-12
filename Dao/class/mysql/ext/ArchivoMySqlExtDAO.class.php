<?php
/**
 * Class that operate on table 'archivo'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-11-04 19:49
 */
class ArchivoMySqlExtDAO extends ArchivoMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $idData = 0) {

        if ($idData != 0)
            $row = $this->load($idData);
        else
            $row = new Archivo();
        return $this->mysql->prepare($row, $data);
    }
}
?>