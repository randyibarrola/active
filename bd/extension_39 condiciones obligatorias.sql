insert into condicion_categoria (id, nombre) values
(1, 'Obligatoria'),
(2, 'Opcional');

update condicion set condicion_categoria_id = 2;

insert into condicion(nombre, descripcion, condicion_categoria_id) VALUES
('{"es":"CONDICIONES DE RESERVA"}', '{"es":"CONDICIONES DE RESERVA"}', 1);