<?php
/**
 * Class that operate on table 'ticket'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-06-13 06:57
 */
class TicketMySqlExtDAO extends TicketMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $idTicket = 0) {
        if ($idTicket != 0)
            $ticket = $this->load($idTicket);
        else
            $ticket = new Ticket();
        return $this->mysql->prepare($ticket, $data);
    }
}
?>