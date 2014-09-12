ALTER TABLE condicion CHANGE nombre nombre TEXT NULL;
ALTER TABLE condicion_categoria CHANGE nombre nombre TEXT NULL;
ALTER TABLE condicion CHANGE condicion_categoria_id condicion_categoria_id INT NULL;