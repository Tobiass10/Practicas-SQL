CREATE DATABASE PROVEEDORES
use PROVEEDORES
go
CREATE PROCEDURE InsertarProveedor
    @P# VARCHAR(2),
    @PNOMBRE VARCHAR(30),
    @CATEGORIA INT,
    @CIUDAD VARCHAR(30)
AS
BEGIN
    INSERT INTO PROVEEDORES (P#, PNOMBRE, CATEGORIA, CIUDAD)
    VALUES (@P#, @PNOMBRE, @CATEGORIA, @CIUDAD)
END
go
CREATE PROCEDURE InsertarComponente
    @C# VARCHAR(2),
    @CNOMBRE VARCHAR(30),
    @COLOR VARCHAR(15),
    @PESO INT,
    @CIUDAD VARCHAR(30)
AS
BEGIN
    INSERT INTO COMPONENTES (C#, CNOMBRE, COLOR, PESO, CIUDAD)
    VALUES (@C#, @CNOMBRE, @COLOR, @PESO, @CIUDAD)
END
go
CREATE PROCEDURE InsertarArticulo
    @T# VARCHAR(2),
    @TNOMBRE VARCHAR(30),
    @CIUDAD VARCHAR(30)
AS
BEGIN
    INSERT INTO ARTICULOS (T#, TNOMBRE, CIUDAD)
    VALUES (@T#, @TNOMBRE, @CIUDAD)
END
go
CREATE PROCEDURE InsertarEnvio
    @P# VARCHAR(2),
    @C# VARCHAR(2),
    @T# VARCHAR(2),
    @CANTIDAD INT
AS
BEGIN
    INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD)
    VALUES (@P#, @C#, @T#, @CANTIDAD)
END
go
EXEC InsertarProveedor '10', 'Proveedor 1', 1, 'Ciudad A'
go
EXEC InsertarComponente '10', 'Componente 1', 'Rojo', 100, 'Ciudad B'
go
EXEC InsertarArticulo '10', 'Articulo 1', 'Ciudad C'
go
EXEC InsertarEnvio '10', '10', '10', 50
go
/*Delete  from envios where ENVIOS.C#='10';
delete from ARTICULOS  where ARTICULOS.T#='10';
delete from COMPONENTES where COMPONENTES.C#='10';
delete from PROVEEDORES where PROVEEDORES.P#='10';*/

CREATE PROCEDURE EliminarProveedor
    @P# VARCHAR(2)
AS
BEGIN
    DELETE FROM PROVEEDORES
    WHERE P# = @P#
END
go
CREATE PROCEDURE EliminarComponente
    @C# VARCHAR(2)
AS
BEGIN
    DELETE FROM COMPONENTES
    WHERE C# = @C#
END
go
CREATE PROCEDURE EliminarArticulo
    @T# VARCHAR(2)
AS
BEGIN
    DELETE FROM ARTICULOS
    WHERE T# = @T#
END
go
CREATE PROCEDURE EliminarEnvio
    @P# VARCHAR(2),
    @C# VARCHAR(2),
    @T# VARCHAR(2)
AS
BEGIN
    DELETE FROM ENVIOS
    WHERE P# = @P# AND C# = @C# AND T# = @T#
END
go
EXEC EliminarEnvio '10', '10', '10'
go
EXEC EliminarProveedor '10'
go
EXEC EliminarComponente '10'
go
EXEC EliminarArticulo '10'
go

CREATE PROCEDURE ActualizarProveedor
    @P# VARCHAR(2),
    @PNOMBRE VARCHAR(30),
    @CATEGORIA INT,
    @CIUDAD VARCHAR(30)
AS
BEGIN
    UPDATE PROVEEDORES
    SET PNOMBRE = @PNOMBRE, CATEGORIA = @CATEGORIA, CIUDAD = @CIUDAD
    WHERE P# = @P#
END
go
CREATE PROCEDURE ActualizarComponente
    @C# VARCHAR(2),
    @CNOMBRE VARCHAR(30),
    @COLOR VARCHAR(15),
    @PESO INT,
    @CIUDAD VARCHAR(30)
AS
BEGIN
    UPDATE COMPONENTES
    SET CNOMBRE = @CNOMBRE, COLOR = @COLOR, PESO = @PESO, CIUDAD = @CIUDAD
    WHERE C# = @C#
END
go
CREATE PROCEDURE ActualizarArticulo
    @T# VARCHAR(2),
    @TNOMBRE VARCHAR(30),
    @CIUDAD VARCHAR(30)
AS
BEGIN
    UPDATE ARTICULOS
    SET TNOMBRE = @TNOMBRE, CIUDAD = @CIUDAD
    WHERE T# = @T#
END
go
CREATE PROCEDURE ActualizarEnvio
    @P# VARCHAR(2),
    @C# VARCHAR(2),
    @T# VARCHAR(2),
    @CANTIDAD INT
AS
BEGIN
    UPDATE ENVIOS
    SET CANTIDAD = @CANTIDAD
    WHERE P# = @P# AND C# = @C# AND T# = @T#
END
go
EXEC ActualizarProveedor '10', 'Nuevo Nombre', 2, 'Nueva Ciudad'
go
EXEC ActualizarComponente '10', 'Nuevo Componente', 'Azul', 120, 'Otra Ciudad'
go
EXEC ActualizarArticulo '10', 'Nuevo Artículo', 'Otra Ciudad'
go
EXEC ActualizarEnvio '10', '10', '10', 75
go
CREATE PROCEDURE ListarProveedores
AS
BEGIN
    SELECT P#, PNOMBRE, CATEGORIA, CIUDAD
    FROM PROVEEDORES
END
go
CREATE PROCEDURE ListarComponentes
AS
BEGIN
    SELECT C#, CNOMBRE, COLOR, PESO, CIUDAD
    FROM COMPONENTES
END
go
CREATE PROCEDURE ListarArticulos
AS
BEGIN
    SELECT T#, TNOMBRE, CIUDAD
    FROM ARTICULOS
END
go
CREATE PROCEDURE ListarEnvios
AS
BEGIN
    SELECT P#, C#, T#, CANTIDAD
    FROM ENVIOS
END
go
EXEC ListarProveedores
go
EXEC ListarComponentes
go
EXEC ListarArticulos
go
EXEC ListarEnvios
go



DROP PROCEDURE InsertarEnvio