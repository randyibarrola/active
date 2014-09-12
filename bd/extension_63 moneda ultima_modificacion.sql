ALTER TABLE moneda ADD ultima_modificacion TIMESTAMP NULL;
UPDATE moneda SET tasa_cambio = 1 WHERE codigo = 'EUR';
ALTER TABLE hotel ADD moneda_id INT NULL;
ALTER TABLE `hotel`
  ADD CONSTRAINT `fk_hotel_moneda1` FOREIGN KEY (`moneda_id`) REFERENCES `moneda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
  
UPDATE hotel SET moneda_id = 1 WHERE moneda_id IS NULL;
