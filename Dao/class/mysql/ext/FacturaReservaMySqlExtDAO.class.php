<?php
/**
 * Class that operate on table 'factura_reserva'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2014-05-02 14:44
 */
class FacturaReservaMySqlExtDAO extends FacturaReservaMySqlDAO{

	private $mysql;

    function __construct() {
        $this->mysql = new MySql();
    }

    function prepare($data, $id = 0) {

        if ($id != 0)
            $obj = $this->load($id);
        else
            $obj = new FacturaReserva ();
        return $this->mysql->prepare($obj, $data);
    }
}
?>