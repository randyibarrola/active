ALTER TABLE blacklist ADD hotel_id INT NULL;

ALTER TABLE `blacklist`
  ADD CONSTRAINT `fk_blacklist_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;