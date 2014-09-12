ALTER TABLE `vikahotel`.`hotel` 
ADD COLUMN `dominio_oficial` TEXT NULL AFTER `clave`;
ALTER TABLE `vikahotel`.`hotel` 
ADD COLUMN `telefono_reservas` VARCHAR(45) NULL AFTER `dominio_oficial`;
