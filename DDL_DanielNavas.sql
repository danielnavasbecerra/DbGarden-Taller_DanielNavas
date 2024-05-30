
-- #####################################################
-- ###### COMANDOS DDL (DB Garden) - Daniel Navas ######
-- #####################################################


-- ########## NOMBRES DE TABLAS Y ORGANIZACION ##########
-- /-/-/ Se realiza un tipo de esquema en el cual se mostrara la organizacion de las tablas de la DDBB /-/-/

-- gama_producto;
-- pais;
-- region;
-- ciudad;
-- puesto;
-- estado_pedido;
-- tipo_pago;
-- tipo_telefono;
-- forma_pago;
-- oficina;
-- telefono_oficina -----> tipo_telefono, oficina;
-- direccion_oficina -----> pais, oficina;
-- empleado -----> oficina, jefe, puesto;
-- contacto;
-- cliente -----> empleado, contacto;
-- pago -----> cliente, forma_pago, tipo_pago;
-- telefono_cliente -----> cliente, tipo_telefono;
-- direccion_cliente -----> cliente, pais, region, ciudad;
-- producto -----> gama_producto;
-- proveedor;
-- telefono_proveedor -----> tipo_telefono, proveedor;
-- direccion_proveedor -----> proveedor, pais, region, ciudad;
-- precio -----> proveeedor, producto;
-- pedido -----> pago, estado_pedido, cliente;
-- detallepedido -----> pedido, producto;


-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////


-- Creación de la base de datos
CREATE DATABASE garden;

-- Selección de la base de datos
USE garden;

-- Creación de las tablas
CREATE TABLE gama_producto (
	id INT(7) AUTO_INCREMENT,
	descripcion_texto TEXT,
	descripcion_html TEXT,
	imagen VARCHAR(256),
	CONSTRAINT PK_GamaProducto_Id PRIMARY KEY(id)
);

CREATE TABLE pais (
	id INT(7) AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Pais_Id PRIMARY KEY(id)
);

CREATE TABLE region (
	id INT(7) AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Region_Id PRIMARY KEY(id)
);

CREATE TABLE ciudad (
	id INT(7) AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	codigo_postal VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Ciudad_Id PRIMARY KEY(id)
);

CREATE TABLE puesto (
	id INT(7) AUTO_INCREMENT,
	puesto VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Puesto_Id PRIMARY KEY(id)
);

CREATE TABLE estado_pedido (
	id INT(7) AUTO_INCREMENT,
	estado VARCHAR(50) NOT NULL,
	CONSTRAINT PK_EstadoPedido_Id PRIMARY KEY(id)
);

CREATE TABLE tipo_pago (
	id INT(7) AUTO_INCREMENT,
	tipo VARCHAR(50) NOT NULL,
	CONSTRAINT PK_TipoPago_Id PRIMARY KEY(id)
);
CREATE TABLE tipo_telefono (
	id INT(7) AUTO_INCREMENT,
	tipo VARCHAR(50) NOT NULL,
	CONSTRAINT PK_TipoTelefono_Id PRIMARY KEY(id)
);

CREATE TABLE forma_pago (
	id INT(7) AUTO_INCREMENT,
	forma VARCHAR(50) NOT NULL,
	CONSTRAINT PK_FormaPago_Id PRIMARY KEY(id)
);

CREATE TABLE oficina (
	id INT(7) AUTO_INCREMENT,
	nombre VARCHAR(50),
	CONSTRAINT PK_Oficina_Id PRIMARY KEY(id)
);

CREATE TABLE telefono_oficina (
	id INT(7) AUTO_INCREMENT,
	fkid_oficina INT(7),
	fkid_tipo INT(7),
	numero VARCHAR(50) UNIQUE,
	CONSTRAINT PK_TelefonoOficina_Id PRIMARY KEY(id),
	CONSTRAINT FK_TipoTelefono_TelefonoOficina_Id FOREIGN KEY(fkid_tipo) REFERENCES tipo_telefono(id),
	CONSTRAINT FK_Oficina_TelefonoOficina_Id FOREIGN KEY(fkid_oficina) REFERENCES oficina(id)
);

CREATE TABLE direccion_oficina (
	id INT(7) AUTO_INCREMENT,
	fkid_oficina INT(7),
	fkid_pais INT(7),
	fkid_region INT(7),
	fkid_ciudad INT(7),
	detalle TEXT NOT NULL,
	CONSTRAINT PK_DireccionOficina_Id PRIMARY KEY(id),
	CONSTRAINT FK_Oficina_DireccionOficina_Id FOREIGN KEY(fkid_oficina) REFERENCES oficina(id),
	CONSTRAINT FK_Pais_DireccionOficina_Id FOREIGN KEY(fkid_pais) REFERENCES pais(id),
	CONSTRAINT FK_Region_DireccionOficina_Id FOREIGN KEY(fkid_region) REFERENCES region(id),
	CONSTRAINT FK_Ciudad_DireccionOficina_Id FOREIGN KEY(fkid_ciudad) REFERENCES ciudad(id)
);

CREATE TABLE empleado (
	id INT(7) AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	apellido1 VARCHAR(50) NOT NULL,
	apellido2 VARCHAR(50) NOT NULL,
	extension VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	fkid_oficina INT(7),
	fkid_jefe INT(7),
	fkid_puesto INT(7),
	CONSTRAINT PK_Empleado_Id PRIMARY KEY(id),
	CONSTRAINT FK_Oficina_Empleado_Id FOREIGN KEY(fkid_oficina) REFERENCES oficina(id), 
	CONSTRAINT FK_Jefe_Empleado_Id FOREIGN KEY (fkid_jefe) REFERENCES empleado(id),
	CONSTRAINT FK_Puesto_Empleado_Id FOREIGN KEY(fkid_puesto) REFERENCES puesto(id)
);

CREATE TABLE contacto (
	id INT(7) AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Contacto_Id PRIMARY KEY(id)
);

CREATE TABLE cliente (
	id INT(7) AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	fkid_contacto INT(7),
	fkid_empleado INT(7),
	limite_credito DECIMAL(15,2),
	CONSTRAINT PK_Cliente_Id PRIMARY KEY(id),
	CONSTRAINT FK_Contacto_Cliente_Id FOREIGN KEY (fkid_contacto) REFERENCES contacto(id), 
	CONSTRAINT FK_Empleado_Cliente_Id FOREIGN KEY (fkid_empleado) REFERENCES empleado(id)
);

CREATE TABLE pago (
	id INT(7) AUTO_INCREMENT,
	fkid_cliente INT(7),
	fkid_forma_pago INT(7),
	fkid_tipo_pago INT(7),
	fecha_pago DATE NOT NULL,
	total DECIMAL (15,2) NOT NULL,
	CONSTRAINT PK_Transaccion_Id PRIMARY KEY(id),
	CONSTRAINT FK_Cliente_Pago_Id FOREIGN KEY (fkid_cliente) REFERENCES cliente(id),
	CONSTRAINT FK_FormaPago_Pago_Id FOREIGN KEY (fkid_forma_pago) REFERENCES forma_pago(id),
	CONSTRAINT FK_TipoPago_Pago_Id FOREIGN KEY (fkid_tipo_pago) REFERENCES tipo_pago(id)
);

CREATE TABLE telefono_cliente (
	id INT(7) AUTO_INCREMENT,
	fkid_cliente INT(7),
	fkid_tipo INT(7),
	numero VARCHAR(50) UNIQUE,
	CONSTRAINT PK_TelefonoCliente_Id PRIMARY KEY(id),
	CONSTRAINT FK_Cliente_TelefonoCliente_Id FOREIGN KEY(fkid_cliente) REFERENCES cliente(id),
	CONSTRAINT FK_TipoTelefono_TelefonoCliente_Id FOREIGN KEY(fkid_tipo) REFERENCES tipo_telefono(id)
);

CREATE TABLE direccion_cliente (
	id INT(7) AUTO_INCREMENT,
	fkid_cliente INT(7),
	fkid_pais INT(7),
	fkid_region INT(7),
	fkid_ciudad INT(7),
	detalle TEXT NOT NULL,
	CONSTRAINT PK_DireccionCliente_Id PRIMARY KEY(id),
	CONSTRAINT FK_Cliente_DireccionCliente_Id FOREIGN KEY(fkid_cliente) REFERENCES cliente(id),
	CONSTRAINT FK_Pais_DireccionCliente_Id FOREIGN KEY(fkid_pais) REFERENCES pais(id),
	CONSTRAINT FK_Region_DireccionCliente_Id FOREIGN KEY(fkid_region) REFERENCES region(id),
	CONSTRAINT FK_Ciudad_DireccionCliente_Id FOREIGN KEY(fkid_ciudad) REFERENCES ciudad(id)
);

CREATE TABLE producto (
	id INT(7) AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	fkid_gama INT(7),
	dimensiones VARCHAR(25) NULL,
	descripcion TEXT NULL,
	cantidad_en_stock SMALLINT(6) NOT NULL,
	CONSTRAINT PK_Producto_Id PRIMARY KEY(id),
	CONSTRAINT FK_GamaProducto_Producto_Id FOREIGN KEY(fkid_gama) REFERENCES gama_producto(id)
);

CREATE TABLE proveedor(
	id INT(7) AUTO_INCREMENT,
	nombre VARCHAR(70) NOT NULL,
	CONSTRAINT PK_Proveedor_Id PRIMARY KEY(id)
);

CREATE TABLE telefono_proveedor(
	id INT(7) AUTO_INCREMENT,
	fkid_proveedor INT(7),
	fkid_tipo INT(7),
	numero VARCHAR(50),
	CONSTRAINT PK_TelefonoProveedor_Id PRIMARY KEY(id),
	CONSTRAINT FK_Proveedor_TelefonoProveedor_Id FOREIGN KEY(fkid_proveedor) REFERENCES proveedor(id),
	CONSTRAINT FK_TipoTelefono_TelefonoProveedor_Id FOREIGN KEY(fkid_tipo) REFERENCES tipo_telefono(id)
);

CREATE TABLE direccion_proveedor (
	id INT(7) AUTO_INCREMENT,
	fkid_proveedor INT(7),
	fkid_pais INT(7),
	fkid_region INT(7),
	fkid_ciudad INT(7),
	detalle TEXT NOT NULL,
	CONSTRAINT PK_DireccionProveedor_Id PRIMARY KEY(id),
	CONSTRAINT FK_Proveedor_DireccionProveedor_Id FOREIGN KEY(fkid_proveedor) REFERENCES proveedor(id),
	CONSTRAINT FK_Pais_DireccionProveedor_Id FOREIGN KEY(fkid_pais) REFERENCES pais(id),
	CONSTRAINT FK_Region_DireccionProveedor_Id FOREIGN KEY(fkid_region) REFERENCES region(id),
	CONSTRAINT FK_Ciudad_DireccionProveedor_Id FOREIGN KEY(fkid_ciudad) REFERENCES ciudad(id)
);

CREATE TABLE precio (
	fkid_producto INT(7),
	precio_venta DECIMAL(15, 2) NOT NULL,
	fkid_proveedor INT(7),
	precio_proveedor DECIMAL(15, 2) NOT NULL,
	CONSTRAINT PK_Precio_Id PRIMARY KEY(fkid_producto, fkid_proveedor),
	CONSTRAINT FK_Producto_Precio_Id FOREIGN KEY(fkid_producto) REFERENCES producto(id),
	CONSTRAINT FK_Proveedor_Precio_Id FOREIGN KEY(fkid_proveedor) REFERENCES proveedor(id)
);

CREATE TABLE pedido (
	id INT(7) AUTO_INCREMENT,
	fecha_pedido DATE NOT NULL,
	fecha_esperada DATE NOT NULL,
	fecha_entrega DATE NOT NULL,
	fkid_estado_pedido INT(7),
	fkid_cliente INT(7),
	fkid_pago INT(7),
	comentarios TEXT,
	CONSTRAINT PK_Pedido_Id PRIMARY KEY(id),
	CONSTRAINT FK_EstadoPedido_Pedido_Id FOREIGN KEY (fkid_estado_pedido) REFERENCES estado_pedido(id),
	CONSTRAINT FK_Cliente_Pedido_Id FOREIGN KEY (fkid_cliente) REFERENCES cliente(id),
	CONSTRAINT FK_Pago_Pedido_Id FOREIGN KEY (fkid_pago) REFERENCES pago(id)
);

CREATE TABLE detalle_pedido (
	fkid_producto INT(7),
	fkid_pedido INT(7),
	cantidad INT(10) NOT NULL,
	numero_linea SMALLINT(6) NOT NULL,
	CONSTRAINT PK_DetallePedido_Id PRIMARY KEY(fkid_producto, fkid_pedido),
	CONSTRAINT FK_Producto_DetallePedido_Id FOREIGN KEY (fkid_producto) REFERENCES producto(id),
	CONSTRAINT FK_Pedido_DetallePedido_Id FOREIGN KEY (fkid_pedido) REFERENCES pedido(id)
);




-- Daniel Navas - C.C: 1.***.***.797