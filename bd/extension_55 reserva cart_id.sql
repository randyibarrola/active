ALTER TABLE reserva ADD cart_id INT NULL;

ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_reserva_cart1` FOREIGN KEY (`cart_id`) REFERENCES `shopping_cart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
  
ALTER TABLE reserva ADD ip varchar(200) NULL;
ALTER TABLE reserva ADD navegador varchar(200) NULL;
ALTER TABLE reserva ADD request_time TIMESTAMP NULL;