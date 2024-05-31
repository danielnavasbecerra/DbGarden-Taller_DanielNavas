
-- #####################################################
-- ###### COMANDOS DML (DB Garden) - Daniel Navas ######
-- #####################################################

-- Inserciones para gama_producto
INSERT INTO gama_producto (descripcion_texto, descripcion_html, imagen) VALUES 
('Gama de productos ornamentales', NULL, 'ornamentales.jpg');

-- Inserciones para pais
INSERT INTO pais (nombre) VALUES 
('España'),
('México');

-- Inserciones para region
INSERT INTO region (nombre) VALUES 
('Madrid'),
('Cataluña'),
('Ciudad de México');

-- Inserciones para ciudad
INSERT INTO ciudad (nombre, codigo_postal) VALUES 
('Madrid', '28001'),
('Barcelona', '08001'),
('Ciudad de México', '01000');

-- Inserciones para puesto
INSERT INTO puesto (puesto) VALUES 
('Gerente'),
('Vendedor'),
('Representante de Ventas');

-- Inserciones para estado_pedido
INSERT INTO estado_pedido (estado) VALUES 
('Pendiente'),
('Completado'),
('Rechazado');

-- Inserciones para tipo_pago
INSERT INTO tipo_pago (tipo) VALUES 
('Tarjeta de Crédito'),
('Transferencia Bancaria'),
('Paypal');

-- Inserciones para tipo_telefono
INSERT INTO tipo_telefono (tipo) VALUES 
('Móvil'),
('Fijo');

-- Inserciones para forma_pago
INSERT INTO forma_pago (forma) VALUES 
('Pago Completo'),
('Pago a Plazos');

-- Inserciones para oficina
INSERT INTO oficina (nombre) VALUES 
('Oficina Principal en Madrid'),
('Oficina en Barcelona'),
('Oficina en Ciudad de México');

-- Inserciones para telefono_oficina
INSERT INTO telefono_oficina (fkid_oficina, fkid_tipo, numero) VALUES 
(1, 1, '600123456'),
(2, 1, '600987654'),
(3, 2, '550123456');

-- Inserciones para direccion_oficina
INSERT INTO direccion_oficina (fkid_oficina, fkid_pais, fkid_region, fkid_ciudad, detalle) VALUES 
(1, 1, 1, 1, 'Calle de Alcalá 123, Madrid'),
(2, 1, 2, 2, 'Calle de Example 123, Barcelona'),
(3, 2, 3, 3, 'Avenida de Reforma 123, Ciudad de México');

-- Inserciones para empleado
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, fkid_oficina, fkid_jefe, fkid_puesto) VALUES 
('Juan', 'Pérez', 'García', '101', 'juan.perez@example.com', 1, NULL, 1), -- Gerente
('Ana', 'López', 'Martínez', '102', 'ana.lopez@example.com', 2, 1, 2), -- Vendedor
('Carlos', 'Sánchez', 'Domínguez', '103', 'carlos.sanchez@example.com', 1, 1, 3), -- Representante de Ventas
('Laura', 'Díaz', 'Hernández', '104', 'laura.diaz@example.com', 1, 7, 2); -- Vendedor con jefe 7

-- Inserciones para contacto
INSERT INTO contacto (nombre, apellido, email) VALUES 
('Contacto', 'Uno', 'contacto.uno@example.com'),
('Contacto', 'Dos', 'contacto.dos@example.com');

-- Inserciones para cliente
INSERT INTO cliente (nombre, fkid_contacto, fkid_empleado, limite_credito) VALUES 
('Cliente Madrid', 1, 1, 10000.00),
('Cliente Barcelona', 2, 2, 5000.00);

-- Inserciones para pago
INSERT INTO pago (fkid_cliente, fkid_forma_pago, fkid_tipo_pago, fecha_pago, total) VALUES 
(1, 1, 3, '2008-05-20', 1000.00),
(2, 2, 1, '2008-06-15', 2000.00);

-- Inserciones para telefono_cliente
INSERT INTO telefono_cliente (fkid_cliente, fkid_tipo, numero) VALUES 
(1, 1, '600123123'),
(2, 2, '931231231');

-- Inserciones para direccion_cliente
INSERT INTO direccion_cliente (fkid_cliente, fkid_pais, fkid_region, fkid_ciudad, detalle) VALUES 
(1, 1, 1, 1, 'Calle de Cliente 123, Madrid'),
(2, 1, 2, 2, 'Avenida del Cliente 456, Barcelona');

-- Inserciones para producto
INSERT INTO producto (nombre, fkid_gama, dimensiones, descripcion, cantidad_en_stock) VALUES 
('Ornamental A', 1, '10x10x10', 'Descripción del Producto A', 150),
('Ornamental B', 1, '20x20x20', 'Descripción del Producto B', 50);

-- Inserciones para proveedor
INSERT INTO proveedor (nombre) VALUES 
('Proveedor 1'),
('Proveedor 2');

-- Inserciones para telefono_proveedor
INSERT INTO telefono_proveedor (fkid_proveedor, fkid_tipo, numero) VALUES 
(1, 1, '333333333'),
(2, 2, '444444444');

-- Inserciones para direccion_proveedor
INSERT INTO direccion_proveedor (fkid_proveedor, fkid_pais, fkid_region, fkid_ciudad, detalle) VALUES 
(1, 1, 1, 1, 'Calle del Proveedor 123, Madrid'),
(2, 2, 2, 2, 'Avenida del Proveedor 456, Barcelona');

-- Inserciones para precio
INSERT INTO precio (fkid_producto, precio_venta, fkid_proveedor, precio_proveedor) VALUES 
(1, 150.00, 1, 100.00),
(2, 250.00, 2, 200.00);

-- Inserciones para pedido
INSERT INTO pedido (fecha_pedido, fecha_esperada, fecha_entrega, fkid_estado_pedido, fkid_cliente, fkid_pago, comentarios) VALUES 
('2009-03-01', '2009-03-15', '2009-03-20', 3, 1, 1, 'Rechazado'),
('2008-04-01', '2008-04-15', '2008-04-10', 2, 2, 2, 'Entregado antes de tiempo');

-- Inserciones para detalle_pedido
INSERT INTO detalle_pedido (fkid_producto, fkid_pedido, cantidad, numero_linea) VALUES 
(1, 1, 10, 1),
(2, 2, 20, 2);




-- Daniel Navas - C.C: 1.***.***.797