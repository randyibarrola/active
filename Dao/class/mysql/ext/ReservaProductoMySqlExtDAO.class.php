<?php
/**
 * Class that operate on table 'reserva_producto'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-11-20 16:16
 */
class ReservaProductoMySqlExtDAO extends ReservaProductoMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $idReserva = 0) {

        if ($idReserva != 0)
            $reserva = $this->load($idReserva);
        else
            $reserva = new ReservaProducto ();
        return $this->mysql->prepare($reserva, $data);
    }
}
?>