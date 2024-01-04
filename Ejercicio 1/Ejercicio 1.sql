CREATE TABLE Pub(
	Cod_Pub VARCHAR(50) NOT NULL,
	
	Nombre VARCHAR(20) NOT NULL,

	Licencia_Fiscal VARCHAR(50) NOT NULL,

	Domicilio VARCHAR(50),

	Fecha_Apertura DATE NOT NULL,
	
	Horario VARCHAR(50) NOT NULL,

	Cod_Localidad NUMERIC NOT NULL,

	PRIMARY KEY (Cod_Pub),

	CONSTRAINT Horario CHECK (Horario IN ('HOR1','HOR2','HOR3'))
);

CREATE TABLE Titular(
	Dni_Titular INT NOT NULL,

	Nombre_Titular VARCHAR(50) NOT NULL,

	Domicilio VARCHAR(50),

	Cod_Pub VARCHAR(50) NOT NULL,

	PRIMARY KEY (Dni_Titular),

	FOREIGN KEY (Cod_Pub) REFERENCES Pub(Cod_Pub)
);

CREATE TABLE Empleados(
	Dni_Empleado INT NOT NULL,

	Nombre_Empleado VARCHAR(50) NOT NULL,

	Domicilio VARCHAR(50),

	PRIMARY KEY (Dni_Empleado)


);

CREATE TABLE Existencias(
	Cod_Articulo VARCHAR(50),

	Nombre VARCHAR(50) NOT NULL,

	Cantidad INT NOT NULL,

	Precio DECIMAL NOT NULL,

	Cod_Pub VARCHAR(50) NOT NULL,

	PRIMARY KEY (Cod_Articulo),

	FOREIGN KEY (Cod_Pub) REFERENCES Pub(Cod_Pub)
);

CREATE TABLE Localidad(
	Cod_Localidad INT NOT NULL,

	Nombre VARCHAR(50),

	PRIMARY KEY (Cod_Localidad),

);

CREATE TABLE Pub_Empleado(
	Cod_Pub VARCHAR(50) NOT NULL,

	Empleado VARCHAR(50) NOT NULL,

	Funcion VARCHAR(50) NOT NULL,

	PRIMARY KEY (Cod_Pub,Empleado,Funcion)
	
	FOREIGN KEY 

	CONSTRAINT Funcion CHECK (Funcion IN ('CAMARERO','SEGURIDAD','LIMPIEZA'))
);

DROP TABLE Empleado