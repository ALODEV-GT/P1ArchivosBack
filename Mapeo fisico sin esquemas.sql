CREATE USER brayan WITH PASSWORD 'contra123';
GRANT ALL PRIVILEGES ON DATABASE electronicHomes TO brayan; 

CREATE DATABASE electronic_homes;

CREATE TABLE tipo_establecimiento(
    id_tipo_establecimiento INT NOT NULL,
    descripcion VARCHAR(25) NOT NULL,
    PRIMARY KEY(id_tipo_establecimiento)  
);

CREATE TABLE establecimiento(
    id_establecimiento INT NOT NULL,
    id_tipo_establecimiento INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    direccion VARCHAR(30),
    PRIMARY KEY(id_establecimiento),
    FOREIGN KEY(id_tipo_establecimiento) REFERENCES tipo_establecimiento(id_tipo_establecimiento)
);

--CREATE TABLE tipo_producto(
  --  id_tipo_producto INT NOT NULL,
  --  nombre VARCHAR(30) NOT NULL,
  --  unidades INT NOT NULL,
  --  PRIMARY KEY(id_tipo_producto)  
--);

CREATE TABLE producto(
    id_producto SERIAL,
    id_establecimiento INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    precio DECIMAL(8,2) NOT NULL,
    disponible BOOLEAN NOT NULL,
    PRIMARY KEY(id_producto),
    FOREIGN KEY(id_establecimiento) REFERENCES establecimiento(id_establecimiento)
);

CREATE TABLE rol_empleado(
    id_rol_empleado INT NOT NULL,
    nombre VARCHAR(25) NOT NULL,
    PRIMARY KEY(id_rol_empleado)  
);

CREATE TABLE empleado(
    id_empleado SERIAL,
    id_rol_empleado INT NOT NULL,
    id_establecimiento INT NOT NULL,
    usuario VARCHAR(20) NOT NULL,
    contrasena VARCHAR(20) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    PRIMARY KEY(id_empleado),
    FOREIGN KEY(id_rol_empleado) REFERENCES rol_empleado(id_rol_empleado),
    FOREIGN KEY(id_establecimiento) REFERENCES establecimiento(id_establecimiento)
);

CREATE TABLE cliente(
    nit VARCHAR(9) NOT NULL,
    nombre VARCHAR(30),
    PRIMARY KEY(nit)  
);

CREATE TABLE venta(
    id_venta SERIAL,
    nit_cliente VARCHAR(9) NOT NULL,
    id_empleado INT NOT NULL,
    total DECIMAL(8,2),
    descuento DECIMAL(8,2),
    porcentaje_descuento DECIMAL(8,2),
    PRIMARY KEY(id_venta),
    FOREIGN KEY(nit_cliente) REFERENCES cliente(nit),
    FOREIGN KEY(id_empleado) REFERENCES empleado(id_empleado)
);

CREATE TABLE detalle(
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    PRIMARY KEY(id_venta, id_producto),
    FOREIGN KEY(id_venta) REFERENCES venta(id_venta),
    FOREIGN KEY(id_producto) REFERENCES producto(id_producto)
);


-- TIPO ESTABLECIMIENTO
INSERT INTO tipo_establecimiento VALUES(1,'SUCURSAL');
INSERT INTO tipo_establecimiento VALUES(2,'BODEGA');

-- ESTABLECIMIENTO
INSERT INTO establecimiento VALUES(1,1,'SUCURSAL CENTRAL','XELA ZONA 3');
INSERT INTO establecimiento VALUES(2,1,'SUCURSAL NORTE','QUCHE ZONA 4');
INSERT INTO establecimiento VALUES(3,1,'SUCURSAL SUR','HUEHUE ZONA 2');
INSERT INTO establecimiento VALUES(4,2,'BODEGA','TOTO ZONA 1');

-- ROLES
INSERT INTO rol_empleado VALUES(1,'Administracion');
INSERT INTO rol_empleado VALUES(2,'Ventas');
INSERT INTO rol_empleado VALUES(3,'Inventario');
INSERT INTO rol_empleado VALUES(4,'Bodega');

-- USUARIOS
INSERT INTO empleado(id_rol_empleado, id_establecimiento, usuario, contrasena, nombre) VALUES(1,1,'admin', 'contra123', 'Juan Perez');

-- PERSONAL SUCURSAL 1
INSERT INTO empleado(id_rol_empleado, id_establecimiento, usuario, contrasena, nombre) VALUES(2,1,'vendedor1S1', 'contra123', 'Ana Garcia');
INSERT INTO empleado(id_rol_empleado, id_establecimiento, usuario, contrasena, nombre) VALUES(2,1,'vendedor2S1', 'contra123', 'Luis Hernandez');
INSERT INTO empleado(id_rol_empleado, id_establecimiento, usuario, contrasena, nombre) VALUES(2,1,'vendedor3S1', 'contra123', 'María Rodriguez');
INSERT INTO empleado(id_rol_empleado, id_establecimiento, usuario, contrasena, nombre) VALUES(3,1,'inventarioS1', 'contra123','Carlos Sánchez');

-- PERSONAL SUCURSAL 2
INSERT INTO empleado(id_rol_empleado, id_establecimiento, usuario, contrasena, nombre) VALUES(2,2,'vendedor1S2', 'contra123', 'Marta Gonzalez');
INSERT INTO empleado(id_rol_empleado, id_establecimiento, usuario, contrasena, nombre) VALUES(2,2,'vendedor2S2', 'contra123', 'David Martinez');
INSERT INTO empleado(id_rol_empleado, id_establecimiento, usuario, contrasena, nombre) VALUES(2,2,'vendedor3S2', 'contra123', 'Laura Jimenez');
INSERT INTO empleado(id_rol_empleado, id_establecimiento, usuario, contrasena, nombre) VALUES(3,2,'inventarioS2', 'contra123','Jorge Torres');

-- PERSONAL SUCURSAL 3
INSERT INTO empleado(id_rol_empleado, id_establecimiento, usuario, contrasena, nombre) VALUES(2,3,'vendedor1S3', 'contra123', 'Silvia Fernandez');
INSERT INTO empleado(id_rol_empleado, id_establecimiento, usuario, contrasena, nombre) VALUES(2,3,'vendedor2S3', 'contra123', 'Pedro Gomez');
INSERT INTO empleado(id_rol_empleado, id_establecimiento, usuario, contrasena, nombre) VALUES(2,3,'vendedor3S3', 'contra123', 'Carmen Ruiz');
INSERT INTO empleado(id_rol_empleado, id_establecimiento, usuario, contrasena, nombre) VALUES(3,3,'inventarioS3', 'contra123','Roberto Ortiz');

-- BODEGUEROS
INSERT INTO empleado(id_rol_empleado, id_establecimiento, usuario, contrasena, nombre) VALUES(4,4,'bodeguero1', 'contra123', 'Patricia Flores');
INSERT INTO empleado(id_rol_empleado, id_establecimiento, usuario, contrasena, nombre) VALUES(4,4,'bodeguero2', 'contra123', 'Sergio Castro');
INSERT INTO empleado(id_rol_empleado, id_establecimiento, usuario, contrasena, nombre) VALUES(4,4,'bodeguero3', 'contra123', 'Andrea Ramirez');
INSERT INTO empleado(id_rol_empleado, id_establecimiento, usuario, contrasena, nombre) VALUES(4,4,'bodeguero4', 'contra123', 'Raul Medina');

-- COMODIN
INSERT INTO empleado(id_rol_empleado, id_establecimiento, usuario, contrasena, nombre) VALUES(2,1,'comodin', 'comodin', 'vendedor comodin');

-- TIPO PRODUCTOS
--INSERT INTO tipo_producto VALUES (1,'',0); 
--INSERT INTO tipo_producto VALUES (2,'',0); 
--INSERT INTO tipo_producto VALUES (3,'',0); 
--INSERT INTO tipo_producto VALUES (4,'',0); 
--INSERT INTO tipo_producto VALUES (5,'',0); 
--INSERT INTO tipo_producto VALUES (6,'',0); 
--INSERT INTO tipo_producto VALUES (7,'',0); 
--INSERT INTO tipo_producto VALUES (8,'',0); 
--INSERT INTO tipo_producto VALUES (9,'',0); 
--INSERT INTO tipo_producto VALUES(10,'',0);
--INSERT INTO tipo_producto VALUES(11,'',0);
--INSERT INTO tipo_producto VALUES(12,'',0);
--INSERT INTO tipo_producto VALUES(13,'',0);
--INSERT INTO tipo_producto VALUES(14,'',0);
--INSERT INTO tipo_producto VALUES(15,'',0);
--INSERT INTO tipo_producto VALUES(16,'',0);
--INSERT INTO tipo_producto VALUES(17,'',0);
--INSERT INTO tipo_producto VALUES(18,'',0);
--INSERT INTO tipo_producto VALUES(19,'',0);
--INSERT INTO tipo_producto VALUES(20,'',0);
--INSERT INTO tipo_producto VALUES(21,'',0);
--INSERT INTO tipo_producto VALUES(22,'',0);
--INSERT INTO tipo_producto VALUES(23,'',0);
--INSERT INTO tipo_producto VALUES(24,'',0);
--INSERT INTO tipo_producto VALUES(25,'',0);
--INSERT INTO tipo_producto VALUES(26,'',0);
--INSERT INTO tipo_producto VALUES(27,'',0);
--INSERT INTO tipo_producto VALUES(28,'',0);
--INSERT INTO tipo_producto VALUES(29,'',0);
--INSERT INTO tipo_producto VALUES(30,'',0);


-- PRODUCTOS SUCURSAL 1
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Nevera',275, FALSE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Congelador',290,FALSE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Lavadora',305,FALSE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Secadora',320,FALSE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Lavavajillas',335,FALSE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Horno',350,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Microondas',365,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Estufa eléctrica',380,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Estufa de gas',395,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Campana extractora',410,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Licuadora',425,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Batidora',440,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Procesador de alimentos',455,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Cafetera eléctrica',470,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Cafetera de cápsulas',485,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Tostadora',250,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Sandwichera',265,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Parrilla eléctrica',280,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Parrilla de gas',295,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Freidora eléctrica',310,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Aspiradora',325,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Robot de limpieza',340,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Plancha de ropa',355,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Centro de planchado',370,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Calentador eléctrico',385,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Calentador de gas',400,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Termo eléctrico',415,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Termo de gas',430,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Aire acondicionado portátil',445,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(1,'Aire acondicionado de ventana',460,TRUE);


-- PRODUCTOS SUCURSAL 2
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Nevera',275,FALSE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Congelador',290,FALSE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Lavadora',305,FALSE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Secadora',320,FALSE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Lavavajillas',335,FALSE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Horno',350,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Microondas',365,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Estufa eléctrica',380,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Estufa de gas',395,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Campana extractora',410,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Licuadora',425,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Batidora',440,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Procesador de alimentos',455,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Cafetera eléctrica',470,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Cafetera de cápsulas',485,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Tostadora',250,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Sandwichera',265,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Parrilla eléctrica',280,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Parrilla de gas',295,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Freidora eléctrica',310,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Aspiradora',325,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Robot de limpieza',340,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Plancha de ropa',355,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Centro de planchado',370,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(2,'Calentador eléctrico',385,TRUE);

-- PRODUCTOS SUCURSAL 3
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(3,'Nevera',275,FALSE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(3,'Congelador',290,FALSE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(3,'Lavadora',305,FALSE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(3,'Secadora',320,FALSE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(3,'Lavavajillas',335,FALSE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(3,'Horno',350,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(3,'Microondas',365,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(3,'Estufa eléctrica',380,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(3,'Estufa de gas',395,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(3,'Campana extractora',410,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(3,'Licuadora',425,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(3,'Batidora',440,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(3,'Procesador de alimentos',455,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(3,'Cafetera eléctrica',470,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(3,'Cafetera de cápsulas',485,TRUE);

-- PRODUCTOS BODEGA
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Nevera',275,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Congelador',290,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Lavadora',305,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Secadora',320,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Lavavajillas',335,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Horno',350,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Microondas',365,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Estufa eléctrica',380,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Estufa de gas',395,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Campana extractora',410,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Licuadora',425,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Batidora',440,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Procesador de alimentos',455,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Cafetera eléctrica',470,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Cafetera de cápsulas',485,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Tostadora',250,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Sandwichera',265,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Parrilla eléctrica',280,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Parrilla de gas',295,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Freidora eléctrica',310,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Aspiradora',325,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Robot de limpieza',340,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Plancha de ropa',355,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Centro de planchado',370,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Calentador eléctrico',385,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Calentador de gas',400,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Termo eléctrico',415,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Termo de gas',430,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Aire acondicionado portátil',445,TRUE);
INSERT INTO producto(id_establecimiento, nombre, precio, disponible) VALUES(4,'Aire acondicionado de ventana',460,TRUE);

-- CLIENTES
INSERT INTO cliente VALUES(12345678,'Ana García');
INSERT INTO cliente VALUES(87654321,'Luis Hernández');
INSERT INTO cliente VALUES(98765432,'María Martínez');
INSERT INTO cliente VALUES(23456789,'David Pérez');
INSERT INTO cliente VALUES(87654322,'Laura Ramírez');
INSERT INTO cliente VALUES(34567890,'Pablo Gómez');
INSERT INTO cliente VALUES(90123456,'Carmen Sánchez');
INSERT INTO cliente VALUES(76543210,'Juan Rodríguez');

-- CONSUMIDOR FINAL 
INSERT INTO cliente VALUES(0,'Consumidor final');

-- VENTAS SUCURSAL 1
INSERT INTO venta(nit_cliente, id_empleado, total, descuento, porcentaje_descuento) VALUES(12345678,2,275,0,0);
INSERT INTO venta(nit_cliente, id_empleado, total, descuento, porcentaje_descuento) VALUES(87654321,3,290,0,0);
INSERT INTO venta(nit_cliente, id_empleado, total, descuento, porcentaje_descuento) VALUES(98765432,4,305,0,0);
INSERT INTO venta(nit_cliente, id_empleado, total, descuento, porcentaje_descuento) VALUES(23456789,2,320,0,0);
INSERT INTO venta(nit_cliente, id_empleado, total, descuento, porcentaje_descuento) VALUES(87654322,3,335,0,0);

INSERT INTO detalle(id_venta,id_producto) VALUES(1,1);
INSERT INTO detalle(id_venta,id_producto) VALUES(2,2);
INSERT INTO detalle(id_venta,id_producto) VALUES(3,3);
INSERT INTO detalle(id_venta,id_producto) VALUES(4,4);
INSERT INTO detalle(id_venta,id_producto) VALUES(5,5);

-- VENTAS SUCURSAL 2
INSERT INTO venta(nit_cliente, id_empleado, total, descuento, porcentaje_descuento) VALUES(12345678,6,275,0,0);
INSERT INTO venta(nit_cliente, id_empleado, total, descuento, porcentaje_descuento) VALUES(87654321,7,290,0,0);
INSERT INTO venta(nit_cliente, id_empleado, total, descuento, porcentaje_descuento) VALUES(98765432,8,305,0,0);
INSERT INTO venta(nit_cliente, id_empleado, total, descuento, porcentaje_descuento) VALUES(23456789,6,320,0,0);
INSERT INTO venta(nit_cliente, id_empleado, total, descuento, porcentaje_descuento) VALUES(87654322,7,335,0,0);

INSERT INTO detalle(id_venta,id_producto) VALUES(6,31);
INSERT INTO detalle(id_venta,id_producto) VALUES(7,32);
INSERT INTO detalle(id_venta,id_producto) VALUES(8,33);
INSERT INTO detalle(id_venta,id_producto) VALUES(9,34);
INSERT INTO detalle(id_venta,id_producto) VALUES(10,35);

-- VENTAS SUCURSAL 3
INSERT INTO venta(nit_cliente, id_empleado, total, descuento, porcentaje_descuento) VALUES(12345678,10,275,0,0);
INSERT INTO venta(nit_cliente, id_empleado, total, descuento, porcentaje_descuento) VALUES(87654321,11,290,0,0);
INSERT INTO venta(nit_cliente, id_empleado, total, descuento, porcentaje_descuento) VALUES(98765432,12,305,0,0);
INSERT INTO venta(nit_cliente, id_empleado, total, descuento, porcentaje_descuento) VALUES(23456789,10,320,0,0);
INSERT INTO venta(nit_cliente, id_empleado, total, descuento, porcentaje_descuento) VALUES(87654322,11,335,0,0);

INSERT INTO detalle(id_venta,id_producto) VALUES(11,56);
INSERT INTO detalle(id_venta,id_producto) VALUES(12,57);
INSERT INTO detalle(id_venta,id_producto) VALUES(13,58);
INSERT INTO detalle(id_venta,id_producto) VALUES(14,59);
INSERT INTO detalle(id_venta,id_producto) VALUES(15,60);

