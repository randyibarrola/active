ALTER TABLE reserva ADD recibir_factura TINYINT NULL;

ALTER TABLE hotel ADD booking_onrequest TINYINT NULL;

ALTER table reserva_producto ADD evento_id INT NULL;
ALTER table reserva_producto ADD evento_tpv TEXT NULL;