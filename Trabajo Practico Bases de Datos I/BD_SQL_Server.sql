CREATE TABLE [equipos] (
  [equipo_id] int PRIMARY KEY IDENTITY(1, 1),
  [nombre] nvarchar(255),
  [estadio_id] int
)
GO

CREATE TABLE [jugadores] (
  [jugador_id] int PRIMARY KEY IDENTITY(1, 1),
  [nombre] nvarchar(255),
  [apellido] nvarchar(255),
  [fecha_nacimiento] date,
  [direccion] nvarchar(255),
  [numero_telefono] nvarchar(255),
  [correo_electronico] nvarchar(255),
  [posicion_campo] nvarchar(255),
  [numero_camiseta] int,
  [equipo_id] int
)
GO

CREATE TABLE [partidos] (
  [partido_id] int PRIMARY KEY IDENTITY(1, 1),
  [fecha] int,
  [hora] time,
  [estadio_id] int,
  [equipo_local_id] int,
  [equipo_visitante_id] int,
  [goles_local] int,
  [goles_visitante] int
)
GO

CREATE TABLE [socios] (
  [socio_id] int PRIMARY KEY IDENTITY(1, 1),
  [nombre] nvarchar(255),
  [apellido] nvarchar(255),
  [direccion] nvarchar(255),
  [numero_telefono] nvarchar(255),
  [correo_electronico] nvarchar(255),
  [equipo_id] int,
  [tipo_pago_id] int
)
GO

CREATE TABLE [entrenadores] (
  [entrenador_id] int PRIMARY KEY IDENTITY(1, 1),
  [nombre] nvarchar(255),
  [apellido] nvarchar(255),
  [direccion] nvarchar(255),
  [numero_telefono] nvarchar(255),
  [correo_electronico] nvarchar(255),
  [equipo_id] int
)
GO

CREATE TABLE [contratos] (
  [contrato_id] int PRIMARY KEY IDENTITY(1, 1),
  [jugador_id] int,
  [salario] decimal,
  [fecha_inicio] date,
  [fecha_finalizacion] date
)
GO

CREATE TABLE [estadio] (
  [estadio_id] int PRIMARY KEY IDENTITY(1, 1),
  [nombre] nvarchar(255),
  [capacidad] int
)
GO

CREATE TABLE [tipo_pago] (
  [tipo_pago_id] int PRIMARY KEY IDENTITY(1, 1),
  [nombre] nvarchar(255)
)
GO

CREATE TABLE [puntos] (
  [posicion] int,
  [equipo_id] int PRIMARY KEY,
  [puntos] int,
  [partidos_jugados] int,
  [partidos_ganados] int,
  [partidos_perdidos] int,
  [goles_a_favor] int,
  [goles_en_contra] int,
  [diferencia_goles] int
)
GO

ALTER TABLE [equipos] ADD FOREIGN KEY ([estadio_id]) REFERENCES [estadio] ([estadio_id])
GO

ALTER TABLE [jugadores] ADD FOREIGN KEY ([equipo_id]) REFERENCES [equipos] ([equipo_id])
GO

ALTER TABLE [partidos] ADD FOREIGN KEY ([estadio_id]) REFERENCES [estadio] ([estadio_id])
GO

ALTER TABLE [partidos] ADD FOREIGN KEY ([equipo_local_id]) REFERENCES [equipos] ([equipo_id])
GO

ALTER TABLE [partidos] ADD FOREIGN KEY ([equipo_visitante_id]) REFERENCES [equipos] ([equipo_id])
GO

ALTER TABLE [socios] ADD FOREIGN KEY ([equipo_id]) REFERENCES [equipos] ([equipo_id])
GO

ALTER TABLE [socios] ADD FOREIGN KEY ([tipo_pago_id]) REFERENCES [tipo_pago] ([tipo_pago_id])
GO

ALTER TABLE [entrenadores] ADD FOREIGN KEY ([equipo_id]) REFERENCES [equipos] ([equipo_id])
GO

ALTER TABLE [contratos] ADD FOREIGN KEY ([jugador_id]) REFERENCES [jugadores] ([jugador_id])
GO

ALTER TABLE [puntos] ADD FOREIGN KEY ([equipo_id]) REFERENCES [equipos] ([equipo_id])
GO
