<?php
/**
 * Class that operate on table 'reserva_pago'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2013-11-20 16:16
 */
class ReservaPagoMySqlExtDAO extends ReservaPagoMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $idReserva = 0) {

        if ($idReserva != 0)
            $reserva = $this->load($idReserva);
        else
            $reserva = new ReservaPago ();
        return $this->mysql->prepare($reserva, $data);
    }
}
?>