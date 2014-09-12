<?php
/**
 * Class that operate on table 'destino_archivo'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-02-17 23:10
 */
class DestinoArchivoMySqlExtDAO extends DestinoArchivoMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new DestinoArchivo ();
        return $this->mysql->prepare($obj, $data);
    }
}
?>