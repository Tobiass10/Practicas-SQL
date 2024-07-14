CREATE DATABASE ciclista
USE ciclista
GO

CREATE TABLE equipo(
	codigo_equipo INT IDENTITY,
	nombre_equipo VARCHAR(100),
	director VARCHAR(100),
	PRIMARY KEY (codigo_equipo)
	);

CREATE TABLE ciclistas(
	codigo_ciclista INT IDENTITY,
	nombre_ciclista VARCHAR(100),
	fecha_nacimiento DATE,
	peso DECIMAL,
	codigo_equipo INT,
	PRIMARY KEY (codigo_ciclista),
	FOREIGN KEY (codigo_equipo) REFERENCES equipo(codigo_equipo)
	);

CREATE TABLE etapa(
	num_etapa INT IDENTITY,
	km DECIMAL,
	salida VARCHAR(100) null,
	llegada VARCHAR(100) null,
	codigo_ciclista INT,
	PRIMARY KEY(num_etapa),
	FOREIGN KEY(codigo_ciclista) REFERENCES ciclistas(codigo_ciclista)
	);

CREATE TABLE camiseta(
	codigo_camiseta INT,
	tipo INT,
	premio INT,
	color VARCHAR(100),
	PRIMARY KEY(codigo_camiseta)
	);

CREATE TABLE lleva(
	num_etapa INT,
	codigo_camiseta INT,
	codigo_ciclista INT,
	PRIMARY KEY (num_etapa,codigo_camiseta,codigo_ciclista),
	FOREIGN KEY (num_etapa) REFERENCES etapa(num_etapa),
	FOREIGN KEY (codigo_camiseta) REFERENCES camiseta(codigo_camiseta),
	FOREIGN KEY (codigo_ciclista) REFERENCES ciclistas(codigo_ciclista)
	);

-- PROCEDIMIENTOS ALMACENADOS --
CREATE PROCEDURE carga_equipo(
	@nombre_equipo VARCHAR(100),
	@director VARCHAR(100)
)
AS
BEGIN
 INSERT INTO equipo(nombre_equipo,director) 
 VALUES(@nombre_equipo,@director);
END
GO

EXEC carga_equipo 'Rojo','Pablo'
EXEC carga_equipo 'Azul','Martin'
EXEC carga_equipo 'Verde','Franco'
EXEC carga_equipo 'Marron','Luis'
EXEC carga_equipo 'Violeta','Camila'

CREATE PROCEDURE carga_ciclistas(
	@nombre_ciclista VARCHAR(100),
	@fecha_nacimiento DATE,
	@peso DECIMAL,
	@codigo_equipo INT
)
AS
BEGIN
 INSERT INTO ciclistas(nombre_ciclista,fecha_nacimiento,peso,codigo_equipo) 
 VALUES(@nombre_ciclista,@fecha_nacimiento,@peso,@codigo_equipo);
END
GO

EXEC carga_ciclistas 'Nestor','1992-02-10',82.2,1
EXEC carga_ciclistas 'Luis','1990-04-08',82.2,1
EXEC carga_ciclistas 'Pablo','1995-09-04',80.4,2
EXEC carga_ciclistas 'Juan','1991-01-01',80.0,2
EXEC carga_ciclistas 'Tobias','2001-03-10',78.0,3
EXEC carga_ciclistas 'Pedro','1980-03-17',76.5,3
EXEC carga_ciclistas 'Florencia','1984-10-23',65.2,4
EXEC carga_ciclistas 'Juana','1988-11-29',67.7,4
EXEC carga_ciclistas 'Julian','1979-01-30',79.4,5
EXEC carga_ciclistas 'Oscar','1975-07-13',73.6,5
EXEC carga_ciclistas 'Alberto','1978-07-19',79.6,5

CREATE PROCEDURE carga_camiseta(
	@codigo_camiseta INT,
	@tipo INT,
	@premio INT,
	@color VARCHAR(100)
)
AS
BEGIN
	INSERT INTO camiseta(codigo_camiseta,tipo,premio,color)
	VALUES(@codigo_camiseta,@tipo,@premio,@color)
END
GO

EXEC carga_camiseta 1,1,1,'Rojo'
EXEC carga_camiseta 21,2,2,'Azul'
EXEC carga_camiseta 2,3,3,'Verde'
EXEC carga_camiseta 17,4,NULL,'Marron'
EXEC carga_camiseta 7,5,NULL,'Violeta'

CREATE PROCEDURE carga_etapa(
	@km DECIMAL,
	@salida VARCHAR(100) NULL,
	@llegada VARCHAR(100) NULL,
	@codigo_ciclista INT
)
AS
BEGIN
	INSERT INTO etapa(km,salida,llegada,codigo_ciclista)
	VALUES (@km,@salida,@llegada,@codigo_ciclista)
END
GO

EXEC carga_etapa 0,NULL,'Salta',1
EXEC carga_etapa 82.3,'CABA','Salta',2
EXEC carga_etapa 41.4,'CABA','Salta',3
EXEC carga_etapa 32.3,'CABA','Salta',4
EXEC carga_etapa 17.4,'CABA','Salta',5
EXEC carga_etapa 23.9,'Tierra del Fuego','Salta',6
EXEC carga_etapa 45.1,'Tierra del Fuego','CBA',7
EXEC carga_etapa 0,'Jujuy','CBA',8
EXEC carga_etapa 101.4,'Neuquen','Salta',9
EXEC carga_etapa 97.3,NULL,'Salta',10
EXEC carga_etapa 91.9,'CABA','CABA',11

CREATE PROCEDURE carga_lleva(
	@num_etapa INT,
	@codigo_camiseta INT,
	@codigo_ciclista INT
)
AS
BEGIN
	INSERT INTO lleva(num_etapa,codigo_camiseta,codigo_ciclista)
	VALUES(@num_etapa,@codigo_camiseta,@codigo_ciclista)
END
GO

EXEC carga_lleva 1,1,1
EXEC carga_lleva 2,21,2
EXEC carga_lleva 3,2,3
EXEC carga_lleva 4,17,4
EXEC carga_lleva 5,7,5

-- DROPS TABLES --
DROP TABLE camiseta
DROP TABLE ciclistas
DROP TABLE equipo
DROP TABLE etapa
DROP TABLE lleva

-- SELECT ALLS --
SELECT * FROM camiseta
SELECT * FROM ciclistas
SELECT * FROM equipo
SELECT * FROM etapa
SELECT * FROM lleva

-- DROP PROCEDURES --
DROP PROCEDURE carga_equipo
DROP PROCEDURE carga_ciclistas
DROP PROCEDURE carga_etapa
DROP PROCEDURE carga_lleva
DROP PROCEDURE carga_camiseta 

--1--
SELECT DISTINCT c.nombre_ciclista, e.nombre_equipo
FROM ciclistas c
INNER JOIN equipo e ON c.codigo_equipo = e.codigo_equipo
WHERE fecha_nacimiento > '1990-01-01'

--2--
SELECT DISTINCT c.nombre_ciclista, c.fecha_nacimiento, e.nombre_equipo
FROM ciclistas c
INNER JOIN equipo e ON c.codigo_equipo = e.codigo_equipo
WHERE fecha_nacimiento < '1995-01-01'

-- 3 --
SELECT *
FROM etapa e
WHERE e.salida = e.llegada

-- 4 --
SELECT *
FROM etapa e
WHERE e.salida is NULL OR e.llegada <> e.salida

-- 5 --
SELECT c.nombre_ciclista,e.nombre_equipo,ca.color,ca.codigo_camiseta
FROM ciclistas c, equipo e, camiseta ca, etapa et
WHERE ca.color = 'Rojo' AND et.nu



SELECT * FROM camiseta
SELECT * FROM ciclistas
SELECT * FROM equipo
SELECT * FROM etapa
SELECT * FROM lleva
