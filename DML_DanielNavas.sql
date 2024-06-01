
-- #####################################################
-- ###### COMANDOS DML (DB Garden) - Daniel Navas ######
-- #####################################################

-- Inserciones para gama_producto
INSERT INTO gama_producto (descripcion_texto, descripcion_html, imagen) VALUES 
('Herbaceas', NULL, 'herbaceas.jpg'),
('Herramientas', NULL, 'herramientas.jpg'),
('Aromáticas', NULL, 'aromaticas.jpg'),
('Frutales', NULL, 'frutales.jpg'),
('Ornamentales', NULL, 'ornamentales.jpg');

-- Inserciones para pais
INSERT INTO pais (nombre) VALUES 
('España'),
('USA'),
('Francia'),
('Australia'),
('United Kingdom');

-- Inserciones para region
INSERT INTO region (nombre) VALUES 
('Madrid'), -- 1 España
('Cataluña'), -- 1 España
('Florida'), -- 2 USA
('Bretaña'), -- 3 Francia
('Tasmania'), -- 4 Australia
('London'); -- 5 United Kingdom

-- Inserciones para ciudad
INSERT INTO ciudad (nombre, codigo_postal) VALUES 
('Madrid Ciudad', '28001'), -- 1 Madrid
('Fuenlabrada', '28100'),
('Alcalá de Henares', '28901'),
('Barcelona', '08001'), -- 2 Cataluña
('Tarragona', '43001'),
('Girona', '17001'),
('Miami', '33101'), -- 3 Florida
('Orlando', '32801'),
('Tampa', '33601'), 
('Rennes', '35000'), -- 4 Bretaña
('París', '29200'),
('Vannes', '56000'), 
('Hobart', '7000'), -- 5 Tasmania
('Launceston', '7250'),
('Devonport', '7310'),
('London', 'SW1A'), -- 6 London
('Manchester', 'M1'),
('Sídney', 'S1');

-- Inserciones para puesto
INSERT INTO puesto (puesto) VALUES 
('Director General'),
('Subdirector Marketing'),
('Subdirector Ventas'),
('Secretaria'),
('Representante Ventas'),
('Director Oficina');

-- Inserciones para estado_pedido
INSERT INTO estado_pedido (estado) VALUES 
('Entregado'),
('Rechazado'),
('Pendiente');

-- Inserciones para tipo_pago
INSERT INTO tipo_pago (tipo) VALUES 
('PayPal'),
('Transferencia'),
('Cheque');

-- Inserciones para tipo_telefono
INSERT INTO tipo_telefono (tipo) VALUES 
('Móvil'),
('Fijo'),
('Fax');

-- Inserciones para forma_pago
INSERT INTO forma_pago (forma) VALUES 
('Pago Completo'),
('Pago a Plazos');

-- Inserciones para oficina
INSERT INTO oficina (nombre) VALUES 
('Oficina Principal en Madrid'),
('Oficina en Fuenlabrada 1'),
('Oficina Madrid Centro'),
('Oficina Madrid Sur'),
('Oficina en Fuenlabrada 2'),
('Oficina en Barcelona Centro'),
('Oficina en Barcelona Norte'),
('Oficina en Girona'),
('Oficina en Fuenlabrada 3'),
('Oficina Madrid Este');

-- Inserciones para telefono_oficina
INSERT INTO telefono_oficina (fkid_oficina, fkid_tipo, numero) VALUES 
(1, 1, '123-456-789'),
(2, 3, '234-567-890'),
(3, 2, '345-678-901'),
(4, 2, '456-789-012'),
(5, 1, '567-890-123'),
(6, 2, '678-901-234'),
(7, 3, '789-012-345'),
(8, 3, '890-123-456'),
(9, 2, '901-234-567'),
(10, 2, '012-345-678');

-- Inserciones para direccion_oficina
INSERT INTO direccion_oficina (fkid_oficina, fkid_pais, fkid_region, fkid_ciudad, detalle) VALUES 
(1, 1, 1, 1, 'Calle Mayor 123, Madrid'),
(2, 1, 1, 2, 'Avenida de la Libertad 456, Fuenlabrada'),
(3, 1, 1, 1, 'Plaza de España 789, Madrid'),
(4, 1, 1, 1, 'Paseo del Mar 987, Madrid'),
(5, 1, 1, 2, 'Calle del Sol 654, Fuenlabrada'),
(6, 1, 2, 4, 'Carrer de Ferran 321, Barcelona'),
(7, 1, 2, 4, 'Avinguda Diagonal 123, Barcelona'),
(8, 1, 2, 5, 'Plaça Reial 456, Girona'),
(9, 1, 1, 2, 'Carrer Ballesteries 789, Fuenlabrada'),
(10, 1, 1, 1, 'Passeig Arqueològic 987, Madrid');


-- Inserciones para empleado
-- Oficina de Madrid
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, fkid_oficina, fkid_jefe, fkid_puesto) VALUES 
('Juan', 'Pérez', 'García', '101', 'juan.perez@example.com', 1, NULL, 1), -- Jefe - Director General
('Ana', 'López', 'Martínez', '102', 'ana.lopez@example.com', 1, 1, 2),
('Carlos', 'Sánchez', 'Domínguez', '103', 'carlos.sanchez@example.com', 1, 1, 3),
('Laura', 'Díaz', 'Hernández', '104', 'laura.diaz@example.com', 1, 1, 4),
('Juan', 'Navas', 'Becerra', '1234', 'juan.perez@example.com', 1, 1, 5),
('María', 'González', 'Martínez', '2345', 'maria.gonzalez@example.com', 1, 1, 6);

-- Oficina de Fuenlabrada
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, fkid_oficina, fkid_jefe, fkid_puesto) VALUES 
('Pedro', 'Martínez', 'Gómez', '5678', 'pedro.martinez@example.com', 2, NULL, 6), -- Jefe
('Sofía', 'Fernández', 'Díaz', '6789', 'sofia.fernandez@example.com', 2, 7, 2),
('Pablo', 'López', 'Pérez', '7890', 'pablo.lopez@example.com', 2, 7, 3),
('Elena', 'Gómez', 'Sánchez', '8901', 'elena.gomez@example.com', 5, 7, 3),
('Carlos', 'Rodríguez', 'López', '3456', 'carlos.rodriguez@example.com',5, 7, 4),
('Ana', 'Sánchez', 'Hernández', '4567', 'ana.sanchez@example.com', 5, 7, 4);

-- Oficina de Barcelona
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, fkid_oficina, fkid_jefe, fkid_puesto) VALUES 
('Alejandro', 'Díaz', 'Martínez', '9012', 'alejandro.diaz@example.com', 7, NULL, 6), -- Jefe
('Lucía', 'Pérez', 'Fernández', '0123', 'lucia.perez@example.com', 7, 13, 2),
('Diego', 'Hernández', 'González', '1234', 'diego.hernandez@example.com', 7, 13, 5),
('Laura', 'Martínez', 'López', '2345', 'laura.martinez@example.com', 7, 13, 5),
('Manuel', 'García', 'Sánchez', '3456', 'manuel.garcia@example.com', 6, 13, 2),
('Carmen', 'Sánchez', 'Martínez', '4567', 'carmen.sanchez@example.com', 2, 13, 3),
('Javier', 'González', 'Pérez', '5678', 'javier.gonzalez@example.com', 1, 13, 4);


-- Inserciones para contacto
INSERT INTO contacto (nombre, apellido, email) VALUES 
('Roberto', 'Martínez', 'roberto@gmail.com'),
('Alejandra', 'López', 'alejandraL@gmail.com'),
('Fernando', 'Sánchez', 'fernando.sanchez@gmail.com'),
('Isabel', 'Gutiérrez', 'isabel.gutierrez@gmail.com'),
('Gabriel', 'Rodríguez', 'gabriel.rodriguez@gmail.com'),
('Verónica', 'Pérez', 'veronica.perez@gmail.com'),
('Marina', 'Fernández', 'marina.fernandez@gmail.com'),
('Andrés', 'Ramírez', 'andres.ramirez@gmail.com');

-- Inserciones para cliente
INSERT INTO cliente (nombre, fkid_contacto, fkid_empleado, limite_credito) VALUES 
('Roberto Martínez', 1, 10, 10000.00),
('Alejandra López', 2, 4, 8000.00),
('Fernando Sánchez', 3, 3, 10000.00),
('Isabel Gutiérrez', 4, 9, 6000.00),
('Gabriel Rodríguez', 5, 5, 7000.00),
('Verónica Pérez', 6, 8, 9000.00),
('Marina Fernández', 7, 15, 7500.00),
('Andrés Ramírez', 8, 2, 8500.00);

-- Inserciones para pago
INSERT INTO pago (fkid_cliente, fkid_forma_pago, fkid_tipo_pago, fecha_pago, total) VALUES 
(1, 1, 1, '2008-09-01', 150.00),
(2, 1, 2, '2024-04-03', 200.00),
(3, 1, 3, '2008-05-25', 300.00),
(1, 2, 1, '2008-06-15', 250.00),
(3, 2, 3, '2008-05-20', 180.00),
(1, 1, 1, '2009-04-02', 150.00),
(2, 1, 2, '2009-04-03', 200.00),
(3, 1, 3, '2008-06-09', 300.00),
(1, 2, 1, '2024-04-05', 250.00),
(3, 2, 3, '2008-04-05', 180.00);

-- Inserciones para telefono_cliente
INSERT INTO telefono_cliente (fkid_cliente, fkid_tipo, numero) VALUES 
(1, 1, '123-456-789'),
(2, 2, '234-567-890'),
(3, 1, '345-678-901'),
(4, 2, '456-789-012'),
(5, 1, '567-890-123'),
(6, 2, '678-901-234'),
(7, 1, '789-012-345'),
(8, 2, '890-123-456');

-- Inserciones para direccion_cliente
INSERT INTO direccion_cliente (fkid_cliente, fkid_pais, fkid_region, fkid_ciudad, detalle) VALUES 
(1, 1, 1, 1, 'Calle Mayor 123, Madrid'),
(2, 1, 1, 2, 'Avenida de la Libertad 456, Fuenlabrada'),
(3, 1, 1, 1, 'Plaza de España 789, Madrid'),
(4, 1, 1, 1, 'Paseo del Mar 987, Madrid'),
(5, 1, 1, 2, 'Calle del Sol 654, Fuenlabrada'),
(6, 1, 2, 4, 'Carrer de Ferran 321, Barcelona'),
(7, 1, 2, 4, 'Avinguda Diagonal 123, Barcelona'),
(8, 1, 2, 5, 'Plaça Reial 456, Girona');


-- Inserciones para producto
-- Productos de la gama Herbáceas 3
INSERT INTO producto (nombre, fkid_gama, dimensiones, descripcion, cantidad_en_stock) VALUES 
('Planta de Lavanda', 1, '2.5, 1.8, 0.7', 'Planta de lavanda aromática.', 10),
('Planta de Menta', 1, '2.5, 1.8, 0.7', 'Planta de menta fresca para infusiones.', 25),
('Hierba de Limón', 1, '2.5, 1.8, 0.7', 'Hierba de limón para uso culinario y aromático.', 18);

-- Productos de la gama Herramientas 3
INSERT INTO producto (nombre, fkid_gama, dimensiones, descripcion, cantidad_en_stock) VALUES 
('Set de Herramientas de Jardinería', 2, '10.0, 8.0, 4.0', 'Incluye pala, rastrillo y tijeras de podar.', 20),
('Cortadora de Césped', 2, '2.5, 1.8, 0.7', 'Cortadora de césped eléctrica con motor de 1500W.', 5),
('Set de Riego Automático', 2, '2.5, 1.8, 0.7', 'Incluye temporizador y manguera para riego automático.', 8);

-- Productos de la gama Aromáticas 3
INSERT INTO producto (nombre, fkid_gama, dimensiones, descripcion, cantidad_en_stock) VALUES 
('Incienso de Sándalo', 3, '2.5, 1.8, 0.7', 'Incienso de sándalo para aromaterapia.', 50),
('Vela de Lavanda', 3, '2.5, 1.8, 0.7', 'Vela aromática de lavanda para relajación.', 25),
('Aceite Esencial de Eucalipto', 3, '2.5, 1.8, 0.7', 'Aceite esencial de eucalipto para difusores.', 40);

-- Productos de la gama Frutales 5
INSERT INTO producto (nombre, fkid_gama, dimensiones, descripcion, cantidad_en_stock) VALUES 
('Manzanas Gala', 4, '10.0, 8.0, 4.0', 'Manzanas frescas de la variedad Gala.', 30),
('Naranjas Valencia', 4, '10.0, 8.0, 4.0', 'Naranjas frescas de la variedad Valencia.', 25),
('Plátanos Canarios', 4, '10.0, 8.0, 4.0', 'Plátanos frescos de las Islas Canarias.', 35),
('Uvas Thompson', 4, '10.0, 8.0, 4.0', 'Uvas frescas de la variedad Thompson.', 40),
('Fresas Frescas', 4, '10.0, 8.0, 4.0', 'Fresas maduras y jugosas.', 20);

-- Productos de la gama Ornamentales 5
INSERT INTO producto (nombre, fkid_gama, dimensiones, descripcion, cantidad_en_stock) VALUES 
('Rosa Roja', 5, '5.0, 3.0, 1.5', 'Rosa roja de floración temprana.', 15),
('Lirio Blanco', 5, '5.0, 3.0, 1.5', 'Lirio blanco de fragancia suave y delicada.', 25),
('Begonia Escarlata', 5, '10.0, 8.0, 4.0', 'Begonia de color escarlata intenso.', 18),
('Girasol Gigante', 5, '5.0, 3.0, 1.5', 'Girasol de variedad gigante con flores de gran tamaño.', 12),
('Orquídea Phalaenopsis', 5, '5.0, 3.0, 1.5', 'Orquídea Phalaenopsis en maceta de cerámica.', 20);

INSERT INTO producto (nombre, fkid_gama, dimensiones, descripcion, cantidad_en_stock) VALUES 
('Tulipán Amarillo', 5, '6.0, 4.0, 2.0', 'Tulipán de color amarillo brillante.', 100),
('Azalea Rosa', 5, '8.0, 6.0, 4.0', 'Azalea de flores rosas en maceta de barro.', 200),
('Margarita Blanca', 5, '5.0, 3.0, 1.5', 'Margarita blanca de tallos largos y resistentes.', 150),
('Violeta Morada', 5, '5.0, 3.0, 1.5', 'Violeta de color morado intenso y aroma dulce.', 315),
('Clavel Rojo', 5, '5.0, 3.0, 1.5', 'Clavel rojo de larga duración en florero de cristal.', 125);


-- Inserciones para proveedor
INSERT INTO proveedor (nombre) VALUES 
('Acme Corporation'),
('Global Tech Solutions'),
('Northwind Traders'),
('Exotic Imports');

-- Inserciones para telefono_proveedor
INSERT INTO telefono_proveedor (fkid_proveedor, fkid_tipo, numero) VALUES 
(1, 1, '123-456-789'),
(2, 2, '234-567-890'),
(3, 2, '345-678-901'),
(4, 3, '456-789-012');

-- Inserciones para direccion_proveedor
INSERT INTO direccion_proveedor (fkid_proveedor, fkid_pais, fkid_region, fkid_ciudad, detalle) VALUES 
(1, 1, 1, 1, 'Calle Mayor 123, Madrid'),
(2, 1, 1, 2, 'Avenida de la Libertad 456, Fuenlabrada'),
(3, 1, 1, 1, 'Plaza de España 789, Madrid'),
(4, 1, 1, 1, 'Paseo del Mar 987, Madrid');

-- Inserciones para precio
-- Herbáceas3
INSERT INTO precio (fkid_producto, precio_venta, fkid_proveedor, precio_proveedor) VALUES 
(1, 5.99, 4, 3.50),
(2, 4.49, 4, 2.75),
(3, 3.99, 4, 2.25);

-- Herramientas3
INSERT INTO precio (fkid_producto, precio_venta, fkid_proveedor, precio_proveedor) VALUES 
(4, 39.99, 2, 25.00),
(5, 149.99, 2, 100.00),
(6, 29.99, 2, 20.00);

-- Aromáticas3
INSERT INTO precio (fkid_producto, precio_venta, fkid_proveedor, precio_proveedor) VALUES 
(7, 2.99, 1, 1.50),
(8, 2.99, 1, 2.50),
(9, 9.99, 2, 6.00);

-- Frutales5
INSERT INTO precio (fkid_producto, precio_venta, fkid_proveedor, precio_proveedor) VALUES 
(10, 0.99, 1, 0.50),
(11, 1.49, 1, 0.75),
(12, 0.89, 1, 0.40),
(13, 2.99, 4, 1.80),
(14, 3.49, 3, 2.00);

-- Ornamentales5
INSERT INTO precio (fkid_producto, precio_venta, fkid_proveedor, precio_proveedor) VALUES 
(15, 3.99, 3, 2.00),
(16, 4.49, 3, 2.50),
(17, 3.79, 3, 2.00),
(18, 5.99, 3, 3.50),
(19, 8.99, 3, 5.00);

INSERT INTO precio (fkid_producto, precio_venta, fkid_proveedor, precio_proveedor) VALUES 
(20, 10.99, 3, 9.00),
(21, 8.49, 3, 7.50),
(22, 9.79, 3, 8.00),
(23, 11.99, 3, 10.50),
(24, 7.99, 3, 6.00);


-- Inserciones para pedido
INSERT INTO pedido (fecha_pedido, fecha_esperada, fecha_entrega, fkid_estado_pedido, fkid_cliente, fkid_pago, comentarios) VALUES 
('2024-04-01', '2024-04-05', '2024-04-03', 1, 1, 1, 'Entregado'),
('2024-04-02', '2024-04-06', '2024-04-10', 1, 1, 4, 'Entregado antes de tiempo'),
('2024-04-03', '2024-04-07', '2024-04-05', 2, 1, 6, 'Rechazado'),
('2024-04-04', '2024-04-08', '2024-04-10', 3, 1, 9, NULL),
('2024-04-05', '2024-04-09', '2024-04-05', 1, 3, 3, 'Entregado antes de tiempo'),
('2024-04-06', '2024-04-10', '2024-04-15', 1, 3, 5, 'Entregado'),
('2024-04-07', '2024-04-11', '2024-04-11', 2, 3, 8, 'Rechazado'),
('2024-04-08', '2024-04-12', '2024-04-05', 3, 3, 10, NULL),
('2024-04-09', '2024-04-13', '2024-04-04', 1, 2, 2, 'Entregado antes de tiempo'),
('2008-04-10', '2008-04-14', '2008-04-18', 2, 2, 7, 'Rechazado');

INSERT INTO pedido (fecha_pedido, fecha_esperada, fecha_entrega, fkid_estado_pedido, fkid_cliente, fkid_pago, comentarios) VALUES 
('2009-04-10', '2009-04-14', '2009-04-18', 2, 2, 7, 'Rechazado'),
('2009-04-07', '2009-04-11', '2009-04-11', 2, 3, 8, 'Rechazado'),
('2009-04-03', '2009-04-07', '2009-04-05', 2, 1, 6, 'Rechazado');

INSERT INTO pedido (fecha_pedido, fecha_esperada, fecha_entrega, fkid_estado_pedido, fkid_cliente, fkid_pago, comentarios) VALUES 
('2023-10-06', '2023-12-10', '2024-01-15', 1, 3, 5, 'Entregado'),
('2008-10-07', '2009-01-21', '2009-01-11', 1, 3, 1, 'Entregado antes de tiempo'),
('2023-10-01', '2024-12-05', '2024-01-03', 1, 1, 1, 'Entregado');


-- Inserciones para detalle_pedido
-- Detalles del pedido 1
INSERT INTO detalle_pedido (fkid_producto, fkid_pedido, cantidad, numero_linea) VALUES 
(10, 1, 3, 1),
(11, 1, 2, 2),
(12, 1, 3, 1),
(13, 2, 5, 2);

-- Detalles del pedido 2
INSERT INTO detalle_pedido (fkid_producto, fkid_pedido, cantidad, numero_linea) VALUES 
(19, 2, 1, 1),
(18, 2, 2, 2),
(17, 2, 3, 1),
(16, 2, 5, 2);

-- Detalles del pedido 3
INSERT INTO detalle_pedido (fkid_producto, fkid_pedido, cantidad, numero_linea) VALUES 
(1, 3, 2, 2),
(2, 3, 2, 2),
(3, 3, 2, 2);

-- Detalles del pedido 4
INSERT INTO detalle_pedido (fkid_producto, fkid_pedido, cantidad, numero_linea) VALUES 
(4, 4, 1, 2),
(5, 4, 1, 2),
(6, 4, 1, 2);

-- Detalles del pedido 5
INSERT INTO detalle_pedido (fkid_producto, fkid_pedido, cantidad, numero_linea) VALUES 
(7, 5, 1, 2),
(8, 5, 1, 2),
(9, 5, 1, 2);

-- Detalles del pedido 6
INSERT INTO detalle_pedido (fkid_producto, fkid_pedido, cantidad, numero_linea) VALUES 
(1, 6, 2, 2),
(6, 6, 1, 2),
(9, 6, 1, 2);

-- Detalles del pedido 7
INSERT INTO detalle_pedido (fkid_producto, fkid_pedido, cantidad, numero_linea) VALUES 
(12, 7, 3, 1),
(13, 7, 5, 2);

-- Detalles del pedido 8
INSERT INTO detalle_pedido (fkid_producto, fkid_pedido, cantidad, numero_linea) VALUES 
(5, 8, 1, 2),
(8, 8, 1, 2),
(12, 8, 3, 1);

-- Detalles del pedido 9
INSERT INTO detalle_pedido (fkid_producto, fkid_pedido, cantidad, numero_linea) VALUES 
(3, 9, 2, 2);

-- Detalles del pedido 10
INSERT INTO detalle_pedido (fkid_producto, fkid_pedido, cantidad, numero_linea) VALUES 
(13, 10, 5, 2),
(19, 10, 1, 1);



-- Daniel Navas - C.C: 1.***.***.797