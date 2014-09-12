<?php
/**
 * Class that operate on table 'servicio'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-11-04 19:49
 */
class ServicioMySqlExtDAO extends ServicioMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $idServicio = 0) {

        if ($idServicio != 0)
            $servicio = $this->load($idServicio);
        else
            $servicio = new Servicio();
        return $this->mysql->prepare($servicio, $data);
    }
}
?>