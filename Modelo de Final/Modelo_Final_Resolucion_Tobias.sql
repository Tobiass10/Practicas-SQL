-- EQUIPOS (NOMBRE (PK) , CIUDAD, CONFERENCIA, DIVISION)
-- JUGADORES(CODIGO (PK) , NOMBRE, PROCEDENCIA, ALTURA, PESO, POSICION, NOMBRE_EQUIPO (FK))
-- PARTIDOS(CODIGO(PK), EQUIPO_LOCAL (FK), EQUIPO_VISITANTE (FK) , PUNTOS_LOCAL, PUNTOS_VISITANTE, TEMPORADA)
-- ESTADISTICAS (TEMPORADA (PK) , JUGADOR (PK), PUNTOS_X_PARTIDO, ASISTENCIA_X_PARTIDO, TAPONES_X_PARTIDO, REBOTES_X_PARTIDO) 

-- PUNTO [1]

-- TABLA EQUIPOS
CREATE TABLE Equipos(
	Nombre VARCHAR(50),

	Ciudad VARCHAR(50),

	Conferencia VARCHAR(50),

	Division VARCHAR(50),
	
	PRIMARY KEY (Nombre)

);

-- TABLA JUGADORES
CREATE TABLE Jugadores(
	Codigo_Jugador INT IDENTITY,

	Nombre VARCHAR(50),

	Procedencia VARCHAR(50),

	Altura DECIMAL,

	Peso DECIMAL,

	Posicion VARCHAR(50),

	Nombre_Equipo VARCHAR(50),

	PRIMARY KEY (Codigo_Jugador),

	FOREIGN KEY (Nombre_Equipo) REFERENCES Equipos(Nombre)

);

-- TABLA PARTIDOS
CREATE TABLE Partidos(
	Codigo INT IDENTITY,

	Equipo_Local VARCHAR(50),

	Equipo_Visitante VARCHAR(50),

	Puntos_Local INT,

	Puntos_Visitante INT,

	Temporada VARCHAR(50),

	PRIMARY KEY(Codigo),

	FOREIGN KEY(Equipo_Local) REFERENCES Equipos(Nombre),

	FOREIGN KEY(Equipo_Visitante) REFERENCES Equipos(Nombre)

);

-- TABLA ESTADISTICAS
CREATE TABLE Estadisticas(

	Temporada VARCHAR(50),

	Codigo_Jugador INT,

	Puntos_X_Partido DECIMAL,

	Asistencia_X_Partido DECIMAL,

	Tapones_X_Partido DECIMAL,

	Rebotes_X_Partido DECIMAL,

	PRIMARY KEY(Temporada,Codigo_Jugador),

	FOREIGN KEY (Codigo_Jugador) REFERENCES Jugadores(Codigo_Jugador)

);


-- Procedimiento Almacenado Equipos
CREATE PROCEDURE Insertar_Equipos(
	@Nombre VARCHAR(50),
	@Ciudad VARCHAR(50),
	@Conferencia VARCHAR(50),
	@Division VARCHAR(50)
)
AS
 BEGIN
 INSERT INTO Equipos(Nombre,Ciudad,Conferencia,Division)
 VALUES (@Nombre,@Ciudad,@Conferencia,@Division)
END

GO

EXEC Insertar_Equipos 'Toronto Raptors','Toronto','Conferencia Este','NBA';
EXEC Insertar_Equipos 'Lakers','Los Angeles','Conferencia Oeste','NBA';
EXEC Insertar_Equipos 'Spurs','San Antonio','Conferencia Oeste','NBA';
EXEC Insertar_Equipos 'Golden State Warriors','San Francisco','Conferencia Oeste','NBA';
EXEC Insertar_Equipos 'Boston Celtics','Boston','Conferencia Este','NBA';


-- Procedimiento Almacenado Jugadores
CREATE PROCEDURE Insertar_Jugadores(
	@Nombre VARCHAR(50),
	@Procedencia VARCHAR(50),
	@Altura DECIMAL,
	@Peso DECIMAL,
	@Posicion VARCHAR,
	@Nombre_Equipo VARCHAR(50)
)
AS
 BEGIN
 INSERT INTO Jugadores(Nombre,Procedencia,Altura,Peso,Posicion,Nombre_Equipo)
 VALUES (@Nombre,@Procedencia,@Altura,@Peso,@Posicion,@Nombre_Equipo)
END

GO

EXEC Insertar_Jugadores 'Victor Wembanyama','Le Chesnay',224.0,95.0,'Ala-pívot, Pívot','Spurs'
EXEC Insertar_Jugadores 'LeBron James','Akron',205.0,113.0,'Ala-pívot, Alero','Lakers'
EXEC Insertar_Jugadores 'Stephen Curry','Akron',188.0,84.0,'Base','Golden State Warriors'
EXEC Insertar_Jugadores 'Jayson Tatum','San Luis',203.0,95.0,'Ala-pívot, Alero','Boston Celtics'
EXEC Insertar_Jugadores 'Scottie Barnes','West Palm Beach',206.0,109.0,'Alero, Escolta','Toronto Raptors'
EXEC Insertar_Jugadores 'Garet Bale','West Palm Beach',206.0,109.0,'Alero, Escolta','Toronto Raptors'
EXEC Insertar_Jugadores 'Manuel Ginobilli','Argentina',206.0,109.0,'Alero, Escolta','Spurs'

-- Procedimiento Almacenado Partidos
CREATE PROCEDURE Insertar_Partidos(
	@Equipo_Local VARCHAR(50),
	@Equipo_Visitante VARCHAR(50),
	@Puntos_Local INT,
	@Puntos_Visitante INT,
	@Temporada VARCHAR(50)
)
AS
 BEGIN
 INSERT INTO Partidos(Equipo_Local,Equipo_Visitante,Puntos_Local,Puntos_Visitante,Temporada)
 VALUES (@Equipo_Local,@Equipo_Visitante,@Puntos_Local,@Puntos_Visitante,@Temporada)
END

GO

EXEC Insertar_Partidos 'Spurs','Lakers',103,98,'Quinta Temporada'
EXEC Insertar_Partidos 'Golden State Warriors','Boston Celtics',114,110,'Quinta Temporada'
EXEC Insertar_Partidos 'Toronto Raptors','Lakers',92,100,'Quinta Temporada'
EXEC Insertar_Partidos 'Spurs','Golden State Warriors',89,110,'Quinta Temporada'
EXEC Insertar_Partidos 'Boston Celtics','Toronto Raptors',105,97,'Quinta Temporada'


-- Procedimiento Almacenado Estadisticas
CREATE PROCEDURE Insertar_Estadisticas(
	@Temporada VARCHAR(50),
	@Codigo_Jugador INT,
	@Puntos_X_Partido DECIMAL,
	@Asistencia_X_Partido DECIMAL,
	@Tapones_X_Partido DECIMAL,
	@Rebotes_X_Partido DECIMAL
)
AS
 BEGIN
 INSERT INTO Estadisticas(Temporada,Codigo_Jugador,Puntos_X_Partido,Asistencia_X_Partido,Tapones_X_Partido,Rebotes_X_Partido)
 VALUES (@Temporada,@Codigo_Jugador,@Puntos_X_Partido,@Asistencia_X_Partido,@Tapones_X_Partido,@Rebotes_X_Partido)
END

GO

EXEC Insertar_Estadisticas 'Quinta Temporada',1,20.30,8.36,6.19,4.90
EXEC Insertar_Estadisticas 'Quinta Temporada',2,25.10,5.46,7.31,5.55
EXEC Insertar_Estadisticas 'Quinta Temporada',3,32.46,4.56,5.72,6.34
EXEC Insertar_Estadisticas 'Quinta Temporada',4,14.21,3.94,9.45,7.21
EXEC Insertar_Estadisticas 'Quinta Temporada',5,19.53,10.12,10.56,8.18


-- PUNTO [2]
SELECT Nombre 
FROM Jugadores
WHERE Nombre LIKE '%J%' OR Nombre LIKE '%G%' ORDER BY Nombre

-- PUNTO [3]
SELECT Nombre,Posicion,Peso
FROM Jugadores
WHERE Posicion LIKE '%C%' OR Posicion LIKE '%A%' AND Peso > 100 ORDER BY Nombre

-- PUNTO [4]
CREATE VIEW Vista_Estadisticas AS
SELECT j.Nombre,Temporada,e.Codigo_Jugador,e.Puntos_X_Partido,e.Asistencia_X_Partido,e.Tapones_X_Partido,e.Rebotes_X_Partido
FROM Estadisticas e
INNER JOIN Jugadores j ON j.Codigo_Jugador = e.Codigo_Jugador
WHERE j.Nombre_Equipo = 'Toronto Raptors'

-- PUNTO [5]
CREATE VIEW Max_puntos_arg AS
SELECT j.Nombre,p.Puntos_Local
FROM Partidos p
INNER JOIN Jugadores j ON j.Nombre_Equipo = p.Equipo_Local
WHERE j.Procedencia = 'Argentina' AND j.Nombre_Equipo = 'Spurs'


-- PUNTO [6]

CREATE VIEW jugador_mas_alto AS
SELECT TOP 1 j.Altura,e.Nombre,e.Conferencia,e.Division
FROM Jugadores j
INNER JOIN Equipos e ON j.Nombre_Equipo = e.Nombre
WHERE j.Altura = (SELECT MAX(Altura) FROM Jugadores)

SELECT * FROM Max_puntos_arg
SELECT * FROM Vista_Estadisticas
SELECT * FROM jugador_mas_alto
SELECT * FROM Equipos
SELECT * FROM Jugadores
SELECT * FROM Partidos
SELECT * FROM Estadisticas


EXEC sp_helpconstraint 'Equipos';