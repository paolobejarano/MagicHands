/* Este codigo crea las tablas */

CREATE TABLE Cliente (
  ID_cliente int NOT NULL,
  nombre_completo varchar(100) NOT NULL,
  email varchar(100) UNIQUE,
  celular varchar(9) UNIQUE);

CREATE TABLE Solicitud (
  ID_solicitud int NOT NULL,
  fecha_y_hora_de_solicitud datetime NOT NULL,
  ID_cliente int NOT NULL);

CREATE TABLE Servicio (
  ID_servicio int NOT NULL,
  fecha_del_servicio date NOT NULL,
  hora_de_inicio time NOT NULL,
  numero_de_horas int NOT NULL,
  requerimientos_especificos char,
  precio_servicio float NOT NULL,
  comision_empresa float NOT NULL,
  pago_a_trabajador float NOT NULL,
  ID_solicitud int NOT NULL,
  ID_direccion int NOT NULL,
  ID_trabajador int NOT NULL);

CREATE TABLE Calificacion_de_servicio(
  ID_calificacion int NOT NULL,
  nivel_de_caificacion int NOT NULL,
  ID_servicio int NOT NULL);

CREATE TABLE Trabajador (
  ID_trabajador int NOT NULL,
  dni varchar(8) NOT NULL UNIQUE,
  nombres varchar(100) NOT NULL,
  apellidos varchar(100) NOT NULL,
  contacto_de_emergencia varchar(250) NOT NULL,
  direccion varchar(250),
  disponible bit NOT NULL,
  ID_distrito int NOT NULL); -- Se refiere al distrito en el que vive el trabajador

CREATE TABLE Proveedor (
  ID_proveedor int NOT NULL,
  RUC varchar(11) NOT NULL UNIQUE,
  razon_social varchar(100) UNIQUE,
  email varchar(100) UNIQUE,
  celular varchar(9) UNIQUE);

CREATE TABLE Distrito (
  ID_distrito int NOT NULL,
  nombre varchar(50) NOT NULL,
  provincia varchar(50) NOT NULL,
  region varchar(50) NOT NULL,
  disponible bit NOT NULL); --La variable disponible toma el valor de 1 cuando en el distrito sí se presta servicio; caso contrario es 0

CREATE TABLE Direccion (
  ID_direccion int NOT NULL,
  direccion varchar(250) NOT NULL,
  referencias varchar(250) NOT NULL,
  ID_distrito int NOT NULL,
  ID_cliente int NOT NULL);

CREATE TABLE Producto (
  ID_producto int NOT NULL,
  nombre varchar(100),
  stock_disponible int);

CREATE TABLE Producto_por_servicio (
  ID_producto_por_servicio int NOT NULL,
  cantidad int NOT NULL,
  ID_producto int NOT NULL,
  ID_servicio int NOT NULL);

CREATE TABLE Proveedor_por_producto(
  ID_proveedor_por_producto int NOT NULL,
  ID_proveedor int NOT NULL,
  ID_producto int NOT NULL);

/* Primary Keys */
ALTER TABLE Cliente ADD CONSTRAINT PK_cliente PRIMARY KEY(ID_cliente);
ALTER TABLE Solicitud ADD CONSTRAINT PK_solicitud PRIMARY KEY(ID_solicitud);
ALTER TABLE Servicio ADD CONSTRAINT PK_servicio PRIMARY KEY(ID_servicio);
ALTER TABLE Calificacion_de_servicio ADD CONSTRAINT PK_calificacion PRIMARY KEY(ID_calificacion);
ALTER TABLE Trabajador ADD CONSTRAINT PK_trabajador PRIMARY KEY(ID_trabajador);
ALTER TABLE Proveedor ADD CONSTRAINT PK_proveedor PRIMARY KEY(ID_proveedor);
ALTER TABLE Distrito ADD CONSTRAINT PK_distrito PRIMARY KEY(ID_distrito);
ALTER TABLE Direccion ADD CONSTRAINT PK_direccion PRIMARY KEY(ID_direccion);
ALTER TABLE Producto ADD CONSTRAINT PK_producto PRIMARY KEY(ID_producto);
ALTER TABLE Producto_por_servicio ADD CONSTRAINT PK_producto_por_servicio PRIMARY KEY(ID_producto_por_servicio);
ALTER TABLE Proveedor_por_producto ADD CONSTRAINT PK_proveedor_por_producto PRIMARY KEY(ID_proveedor_por_producto);

/* Relaciones */
ALTER TABLE Solicitud ADD CONSTRAINT FK_Solicitud_Cliente FOREIGN KEY(ID_cliente) REFERENCES Cliente (ID_cliente);
ALTER TABLE Servicio ADD CONSTRAINT FK_Servicio_Solicitud FOREIGN KEY(ID_solicitud) REFERENCES Solicitud (ID_solicitud);
ALTER TABLE Servicio ADD CONSTRAINT FK_Servicio_Direccion FOREIGN KEY(ID_direccion) REFERENCES Direccion (ID_direccion);
ALTER TABLE Servicio ADD CONSTRAINT FK_Servicio_Trabajador FOREIGN KEY(ID_trabajador) REFERENCES Trabajador (ID_trabajador);
ALTER TABLE Calificacion_de_servicio ADD CONSTRAINT FK_Calificacion_Servicio FOREIGN KEY(ID_servicio) REFERENCES Servicio (ID_servicio);
ALTER TABLE Trabajador ADD CONSTRAINT FK_Trabajador_Distrito FOREIGN KEY(ID_distrito) REFERENCES Distrito (ID_distrito);
ALTER TABLE Direccion ADD CONSTRAINT FK_Direccion_Distrito FOREIGN KEY(ID_distrito) REFERENCES Distrito (ID_distrito);
ALTER TABLE Direccion ADD CONSTRAINT FK_Direccion_Cliente FOREIGN KEY(ID_cliente) REFERENCES Cliente (ID_cliente);
ALTER TABLE Producto_por_servicio ADD CONSTRAINT FK_Producto_por_servicio_Producto FOREIGN KEY(ID_producto) REFERENCES Producto (ID_producto);
ALTER TABLE Producto_por_servicio ADD CONSTRAINT FK_Producto_por_servicio_Servicio FOREIGN KEY(ID_servicio) REFERENCES Servicio (ID_servicio);
ALTER TABLE Proveedor_por_producto ADD CONSTRAINT FK_Proveedor_por_producto_Proveedor FOREIGN KEY(ID_proveedor) REFERENCES Proveedor (ID_proveedor);
ALTER TABLE Proveedor_por_producto ADD CONSTRAINT FK_Proveedor_por_producto_Producto FOREIGN KEY(ID_producto) REFERENCES Producto (ID_producto);

/* Datos de distritos */
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(1, 'Lima', 'Lima', 'Lima', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(2, 'Ancón', 'Lima', 'Lima', 0);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(3, 'Ate', 'Lima', 'Lima', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(4, 'Barranco', 'Lima', 'Lima', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(5, 'Breña', 'Lima', 'Lima', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(6, 'Carabayllo', 'Lima', 'Lima', 0);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(7, 'Chaclacayo', 'Lima', 'Lima', 0);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(8, 'Chorrillos', 'Lima', 'Lima', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(9, 'Cienieguilla', 'Lima', 'Lima', 0);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(10, 'Comas', 'Lima', 'Lima', 0);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(11, 'El Agustino', 'Lima', 'Lima', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(12, 'Independencia', 'Lima', 'Lima', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(13, 'Jesus María', 'Lima', 'Lima', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(14, 'La Molina', 'Lima', 'Lima', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(15, 'La Victoria', 'Lima', 'Lima', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(16, 'Lince', 'Lima', 'Lima', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(17, 'Los Olivos', 'Lima', 'Lima', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(18, 'Lurigancho', 'Lima', 'Lima', 0);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(19, 'Lurín', 'Lima', 'Lima', 0);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(20, 'Magdalena del Mar', 'Lima', 'Lima', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(21, 'Miraflores', 'Lima', 'Lima', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(22, 'Pachacámac', 'Lima', 'Lima', 0);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(23, 'Pucusana', 'Lima', 'Lima', 0);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(24, 'Pueblo Libre', 'Lima', 'Lima', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(25, 'Puente Piedra', 'Lima', 'Lima', 0);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(26, 'Punta Hermosa', 'Lima', 'Lima', 0);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(27, 'Punta Negra', 'Lima', 'Lima', 0);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(28, 'Rímac', 'Lima', 'Lima', 0);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(29, 'San Bartolo', 'Lima', 'Lima', 0);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(30, 'San Borja', 'Lima', 'Lima', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(31, 'San Isidro', 'Lima', 'Lima', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(32, 'San Juan de Lurigancho', 'Lima', 'Lima', 0);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(33, 'San Juan de Miraflores', 'Lima', 'Lima', 0);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(34, 'San Luis', 'Lima', 'Lima', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(35, 'San Martín de Porres', 'Lima', 'Lima', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(36, 'San Miguel', 'Lima', 'Lima', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(37, 'Santa Anita', 'Lima', 'Lima', 0);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(38, 'Santa María del Mar', 'Lima', 'Lima', 0);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(39, 'Santa Rosa', 'Lima', 'Lima', 0);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(40, 'Santiago de Surco', 'Lima', 'Lima', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(41, 'Surquillo', 'Lima', 'Lima', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(42, 'Villa El Salvador', 'Lima', 'Lima', 0);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(43, 'Villa María del Triunfo', 'Lima', 'Lima', 0);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(44, 'Callao', 'Callao', 'Callao', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(45, 'Bellavista', 'Callao', 'Callao', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(46, 'Carmen de La Legua Reynoso', 'Callao', 'Callao', 0);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(47, 'La Perla', 'Callao', 'Callao', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(48, 'La Punta', 'Callao', 'Callao', 1);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(49, 'Ventanilla', 'Callao', 'Callao', 0);
INSERT INTO Distrito(ID_distrito, nombre, provincia, region, disponible) VALUES(50, 'Mi Perú', 'Callao', 'Callao', 0);

/* Ejemplos de datos de clientes */
INSERT INTO Cliente (ID_cliente, nombre_completo, email, celular) VALUES(1, 'Paolo Bejarano','paolobejarano@mail.com', '983776344');
INSERT INTO Cliente (ID_cliente, nombre_completo, email, celular) VALUES(2, 'Claudia Padilla','claudiapadilla@mail.com', '987263827');
INSERT INTO Cliente (ID_cliente, nombre_completo, email, celular) VALUES(3, 'Valeria Orme','valeriaorme@mail.com', '927736543');
INSERT INTO Cliente (ID_cliente, nombre_completo, email, celular) VALUES(4, 'Kathy Barrantes','kathybarrantes@mail.com', '928738621');
INSERT INTO Cliente (ID_cliente, nombre_completo, email, celular) VALUES(5, 'Mishelle Murrugarra','mishellemurrugarra@mail.com', '996232111');

/* Ejemplos de direcciones */
INSERT INTO Direccion(ID_direccion, direccion, referencias, id_distrito, id_cliente) VALUES(1, 'Av. Las Leyendas 264 Dpto. 701', 'Al frente de Metro de La Marina', 36, 1);
INSERT INTO Direccion(ID_direccion, direccion, referencias, id_distrito, id_cliente) VALUES(2, 'Av. Victor Andres Belaunde 147, Via Real 133, Edificio Real Dos', 'Edifico de colores', 31, 1);
INSERT INTO Direccion(ID_direccion, direccion, referencias, id_distrito, id_cliente) VALUES(3, 'Av. Pezet 1310 Dpto. 301', 'Al frente del Golf Club', 31, 2);
INSERT INTO Direccion(ID_direccion, direccion, referencias, id_distrito, id_cliente) VALUES(4, '', '', , );
INSERT INTO Direccion(ID_direccion, direccion, referencias, id_distrito, id_cliente) VALUES(5, '', '', , );
INSERT INTO Direccion(ID_direccion, direccion, referencias, id_distrito, id_cliente) VALUES(6, '', '', , );
INSERT INTO Direccion(ID_direccion, direccion, referencias, id_distrito, id_cliente) VALUES(7, '', '', , );

INSERT INTO Trabajador(ID_trabajador, dni, nombres, apellidos, contacto_de_emergencia, disponible) VALUES(1, '29506272', '', '', '', 1)
INSERT INTO Trabajador(ID_trabajador, dni, nombres, apellidos, contacto_de_emergencia, disponible) VALUES(2, '20526343', '', '', '', 1)
INSERT INTO Trabajador(ID_trabajador, dni, nombres, apellidos, contacto_de_emergencia, disponible) VALUES(3, '01987266', '', '', '', 1)
INSERT INTO Trabajador(ID_trabajador, dni, nombres, apellidos, contacto_de_emergencia, disponible) VALUES(4, '01229867', '', '', '', 1)
INSERT INTO Trabajador(ID_trabajador, dni, nombres, apellidos, contacto_de_emergencia, disponible) VALUES(5, '', '', '', '', 1)

/* Consultas */
SELECT COUNT(*) FROM clientes; -- Muestra el número de clientes registrados
SELECT COUNT(*) FROM distritos WHERE disponible = 1; -- Muestra el número de distritos en los que sí se presta servicio
SELECT COUNT(DISTINCT region) FROM distritos; -- Muestra en cuantas regiones están disponibles los servicios

