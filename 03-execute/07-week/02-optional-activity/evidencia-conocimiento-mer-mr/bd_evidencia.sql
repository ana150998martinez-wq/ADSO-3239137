USE bd_evidencia;

-- ===============================================================================================
-- UBICACION
-- ===============================================================================================

CREATE TABLE continente (
	id_continente 		INT 			AUTO_INCREMENT 	PRIMARY KEY,
	nombre				VARCHAR(100) 	NOT NULL
	);

CREATE TABLE pais (
	id_pais 			INT 			AUTO_INCREMENT	PRIMARY KEY,
	nombre				VARCHAR(100) 	NOT NULL,
	id_continente		INT,
	FOREIGN KEY 		(id_continente)	REFERENCES continente (id_continente)
	);

CREATE TABLE departamento (
	id_departamento 	INT 			AUTO_INCREMENT	PRIMARY KEY,
	nombre				VARCHAR(100) 	NOT NULL,
	id_pais				INT,
	FOREIGN KEY 		(id_pais)		REFERENCES pais (id_pais)
	);

CREATE TABLE ciudad (
    id_ciudad 			INT 			AUTO_INCREMENT 	PRIMARY KEY,
    nombre 				VARCHAR(100) 	NOT NULL,
    id_departamento 	INT,
    FOREIGN KEY 		(id_departamento) REFERENCES departamento (id_departamento)
	);

CREATE TABLE barrio (
    id_barrio 			INT 			AUTO_INCREMENT 	PRIMARY KEY,
    nombre 				VARCHAR(100) 	NOT NULL,
    id_ciudad 			INT,
    FOREIGN KEY 		(id_ciudad) 	REFERENCES ciudad (id_ciudad)
	);


-- ===============================================================================================
-- SEGURIDAD
-- ===============================================================================================

CREATE TABLE rol (
    id_rol 				INT 			AUTO_INCREMENT PRIMARY KEY,
    tipo_rol 			VARCHAR(50) 	NOT NULL
    );

CREATE TABLE persona (
    id_persona 			INT 			AUTO_INCREMENT 	PRIMARY KEY,
    nombre 				VARCHAR(100) 	NOT NULL,
    documento 			VARCHAR(50) 	NOT NULL,
    id_barrio 			INT,
    FOREIGN KEY 		(id_barrio) 	REFERENCES barrio (id_barrio)
	);

CREATE TABLE usuario (
    id_usuario 			INT 			AUTO_INCREMENT 	PRIMARY KEY,
    usuario 			VARCHAR(50) 	NOT NULL,
    contrasena 			VARCHAR(100) 	NOT NULL,
    id_persona 			INT,
    id_rol 				INT,
    FOREIGN KEY 		(id_persona) 	REFERENCES persona (id_persona),
    FOREIGN KEY 		(id_rol) 		REFERENCES rol (id_rol)
	);

-- ===============================================================================================
-- COMERCIAL
-- ===============================================================================================

CREATE TABLE categoria (
    id_categoria 		INT 			AUTO_INCREMENT 	PRIMARY KEY,
    nombre 				VARCHAR(100) 	NOT NULL
	);

CREATE TABLE producto (
    id_producto 		INT 			AUTO_INCREMENT 	PRIMARY KEY,
    nombre 				VARCHAR(100) 	NOT NULL,
    precio 				DECIMAL(10,2) 	NOT NULL,
    id_categoria 		INT,
    FOREIGN KEY 		(id_categoria) REFERENCES categoria (id_categoria)
	);

CREATE TABLE factura (
    id_factura 			INT 			AUTO_INCREMENT 	PRIMARY KEY,
    fecha 				DATE			NOT NULL,
    id_persona 			INT,
    FOREIGN KEY 		(id_persona) 	REFERENCES persona (id_persona)
    );

CREATE TABLE detalle_factura (
    id_detalle_factura 	INT 			AUTO_INCREMENT 	PRIMARY KEY,
    cantidad 			INT 			NOT NULL,
    precio 				DECIMAL(10,2) 	NOT NULL,
    id_factura 			INT,
    id_producto 		INT,
    FOREIGN KEY 		(id_factura)	REFERENCES factura (id_factura),
    FOREIGN KEY 		(id_producto) 	REFERENCES producto (id_producto)
	);
-- ===============================================================================================

