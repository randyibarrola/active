<?php
/**
 * Class that operate on table 'destino_lugares'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-08-14 21:02
 */
class DestinoLugaresMySqlExtDAO extends DestinoLugaresMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {
        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new DestinoLugare ();
        return $this->mysql->prepare($obj, $data);
    }
	
}
?>