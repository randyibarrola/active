ALTER TABLE `vikahotel`.`campania` 
ADD COLUMN `estancia_minima` INT(11) NULL AFTER `email`,
ADD COLUMN `venta_anticipada` INT(11) NULL AFTER `estancia_minima`;
