
-- TABLAS

CREATE TABLE Clientes(

  Id_cliente INT IDENTITY,

  Nombre VARCHAR(100) NOT NULL,

  Apellido1 VARCHAR(100) NOT NULL,

  Apellido2 VARCHAR(100),

  Ciudad VARCHAR(100) NOT NULL,

  Categoria INT NOT NULL CHECK (Categoria>=100 AND Categoria<1000), 

  PRIMARY KEY (Id_cliente)

);

 

CREATE TABLE Comerciales(

  Id_comercial INT IDENTITY,

  Nombre VARCHAR(100) NOT NULL,

  Apellido1 VARCHAR(100) NOT NULL,

  Apellido2 VARCHAR(100) NOT NULL,

  Ciudad VARCHAR(100) NULL,

  Comision DECIMAL(5,2) NOT NULL CHECK (Comision>0 AND Comision<1), 

  PRIMARY KEY (Id_comercial)

);

 

CREATE TABLE Pedidos(

  Id_pedido INT IDENTITY,

  Cantidad DECIMAL(8,2) NOT NULL,

  Fecha DATE NOT NULL,

  Id_cliente INT NOT NULL,

  Id_comercial INT NOT NULL,

  PRIMARY KEY (Id_pedido),

  FOREIGN KEY (Id_cliente) REFERENCES Clientes (Id_cliente),

  FOREIGN KEY (Id_comercial) REFERENCES Comerciales (Id_comercial)

);

-- Procedimientos Almacenados:

CREATE PROCEDURE add_clientes
	@Nombre VARCHAR(100),
	@Apellido1 VARCHAR(100),
	@Apellido2 VARCHAR(100),
	@Ciudad VARCHAR(100),
	@Categoria INT
AS
 BEGIN
	INSERT INTO Clientes(Nombre,Apellido1,Apellido2,Ciudad,Categoria) 
	VALUES(@Nombre,@Apellido1,@Apellido2,@Ciudad,@Categoria)
END
GO
EXEC add_clientes 'Aarón','Rivero','Gómez','Almería',100
EXEC add_clientes 'Adela','Salas','Díaz','Granada',200
EXEC add_clientes 'Adolfo','Rubio','Flores','Sevilla',100
EXEC add_clientes 'Adrian','Suarez',NULL,'Jaén',300
EXEC add_clientes 'Marcos','Loyola','Méndez','Almeria',200
EXEC add_clientes 'María','Santana','Moreno','Cádiz',100
EXEC add_clientes 'Pilar','Ruiz',NULL,'Sevilla',300
EXEC add_clientes 'Pepe','Ruiz','Santana','Huelva',200
EXEC add_clientes 'Guillermo','López','Gómez','Granada',225
EXEC add_clientes 'Daniel','Santana','Loyola','Sevilla',125

CREATE PROCEDURE add_pedidos
	@Cantidad FLOAT,
	@Fecha DATE,
	@Id_cliente INT,
	@Id_comercial INT
AS
 BEGIN
	INSERT INTO Pedidos(Cantidad,Fecha,Id_cliente,Id_comercial) 
	VALUES(@Cantidad,@Fecha,@Id_cliente,@Id_comercial)
END
GO
EXEC add_pedidos 150.5,'2017-10-05',5,2
EXEC add_pedidos 270.65,'2016-09-10',1,5
EXEC add_pedidos 65.26,'2017-10-05',2,1
EXEC add_pedidos 110.5,'2016-08-17',8,3
EXEC add_pedidos 948.5,'2017-09-10',5,2
EXEC add_pedidos 2400.6,'2016-07-27',7,1
EXEC add_pedidos 5760,'2015-09-10',2,1
EXEC add_pedidos 1983.43,'2017-10-10',4,6
EXEC add_pedidos 2480.4,'2016-10-10',8,3
EXEC add_pedidos 250.45,'2015-06-27',8,2
EXEC add_pedidos 75.29,'2016-08-17',3,7
EXEC add_pedidos 3045.6,'2017-04-25',2,1 
EXEC add_pedidos 545.75,'2019-01-25',6,1 
EXEC add_pedidos 145.82,'2017-02-02',6,1 
EXEC add_pedidos 370.85,'2019-03-11',1,5 
EXEC add_pedidos 2389.23,'2019-03-11',1,5 


CREATE PROCEDURE add_comerciales
	@Nombre VARCHAR(100),
	@Apellido1 VARCHAR(100),
	@Apellido2 VARCHAR(100),
	@Comision FLOAT
AS
 BEGIN
	INSERT INTO Comerciales(Nombre,Apellido1,Apellido2,Comision) 
	VALUES(@Nombre,@Apellido1,@Apellido2,@Comision)
END
GO
EXEC add_comerciales 'Daniel','Sáez','Vega',0.15
EXEC add_comerciales 'Juan','Gómez','López',0.13
EXEC add_comerciales 'Diego','Flores','Salas',0.11
EXEC add_comerciales 'Marta','Herrera','Gil',0.14
EXEC add_comerciales 'Antonio','Carretero','Ortega',0.12
EXEC add_comerciales 'Manuel','Domínguez','Hernández',0.13
EXEC add_comerciales 'Antonio','Vega','Hernández',0.11
EXEC add_comerciales 'Alfredo','Ruiz','Flores',0.05

-- Procedimiento Almacenado para modificar tabla.

CREATE PROCEDURE ModificarCliente(
	@Id_cliente INT,
	@Nombre VARCHAR(100),
	@Apellido1 VARCHAR(100),
	@Apellido2 VARCHAR(100),
	@Ciudad VARCHAR(100)
)
AS
BEGIN

UPDATE Clientes
SET Nombre = @Nombre
	Apellido1 = @Apellido1
	Apellido2 = @Apellido2
	Ciudad = @Ciudad
WHERE Id_cliente = @Id_cliente

END
GO

EXEC ModificarCliente 1,'Aaron','Rivero','Gomez'.'Almería'

--
CREATE PROCEDURE EliminaPedidos(



SELECT * FROM Clientes
SELECT * FROM Comerciales
SELECT * FROM Pedidos