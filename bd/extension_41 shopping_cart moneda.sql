alter table shopping_cart add moneda_id INT null;
ALTER TABLE `shopping_cart`
  ADD CONSTRAINT `fk_cart_moneda1` FOREIGN KEY (`moneda_id`) REFERENCES `moneda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
  
alter table reserva add moneda_id INT null;
ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_reserva_moneda1` FOREIGN KEY (`moneda_id`) REFERENCES `moneda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

alter table reserva_producto add modo_pago_offline varchar(200) null; 