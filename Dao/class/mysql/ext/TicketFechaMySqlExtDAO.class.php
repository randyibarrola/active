<?php
/**
 * Class that operate on table 'ticket_fecha'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-06-13 06:57
 */
class TicketFechaMySqlExtDAO extends TicketFechaMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $idTicketFecha = 0) {
        if ($idTicketFecha != 0)
            $ticketFecha = $this->load($idTicketFecha);
        else
            $ticketFecha = new TicketFecha();
        return $this->mysql->prepare($ticketFecha, $data);
    }
}
?>