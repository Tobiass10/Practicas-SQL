--1 Los 10 contratos mejores pagos.

SELECT TOP 10
  j.nombre AS nombre,
  j.apellido AS apellido,
  c.salario AS salario
FROM
  jugadores j
JOIN
  contratos c ON j.jugador_id = c.jugador_id
ORDER BY
  c.salario DESC;

--2 Jugadores que hayan nacido entre 1999 y 2004.

SELECT
  *
FROM
  jugadores
WHERE
  fecha_nacimiento BETWEEN '1999-01-01' AND '2004-12-31';

--3 En que equipo juegan y cual es el nombre de su estadio.

SELECT
  j.nombre AS Nombre_Jugador,
  j.apellido AS Apellido_Jugador,
  e.nombre AS Nombre_Equipo,
  e.estadio_id AS Estadio_ID
FROM
  jugadores j
JOIN
  equipos e ON j.equipo_id = e.equipo_id;

--4 Mediocampistas cuyo entrenador es: ........

SELECT
  j.nombre AS Nombre_Jugador,
  j.apellido AS Apellido_Jugador,
  j.posicion_campo AS Posicion_Campo,
  et.nombre AS Nombre_Entrenador,
  et.apellido AS Apellido_Entrenador
FROM
  jugadores j
JOIN
  equipos e ON j.equipo_id = e.equipo_id
JOIN
  entrenadores et ON j.equipo_id = et.equipo_id
WHERE
  j.posicion_campo = 'mediocampista' AND et.apellido = 'Lopez';
/*FIJARSE EL APELLIDO DEL ENTRENADOR*/

--5 Los 3 estadio con mayor capacidad.

SELECT TOP 3
  nombre AS Nombre_Estadio,
  capacidad
FROM
  estadio
ORDER BY
  capacidad DESC;

--6 Promedio de capacidad de todos los estadios.

SELECT
  AVG(capacidad) AS Promedio_Capacidad
FROM
  estadio;

--7 Promedio de edad de los jugadores de la liga.

SELECT
  AVG(DATEDIFF(YEAR, fecha_nacimiento, GETDATE())) AS Promedio_Edad
FROM
  jugadores;

--8 Promedio de goles de la liga.

SELECT
  AVG(goles_local + goles_visitante) AS Promedio_Goles
FROM
  partidos;

--9 Equipo con mayor cantidad de goles.

SELECT TOP 1
  equipo_id AS Equipo_ID,
  SUM(CASE
        WHEN equipo_id = equipo_local_id THEN goles_local
        WHEN equipo_id = equipo_visitante_id THEN goles_visitante
        ELSE 0
      END) AS Total_Goles
FROM
  partidos
GROUP BY
  equipo_id
ORDER BY
  Total_Goles DESC;

--10 Equipo con mas partidos ganados.

SELECT TOP 1
  equipo_id AS Equipo_ID,
  COUNT(CASE
          WHEN equipo_id = equipo_local_id AND goles_local > goles_visitante THEN 1
          WHEN equipo_id = equipo_visitante_id AND goles_visitante > goles_local THEN 1
        END) AS Partidos_Ganados
FROM
  partidos
GROUP BY
  equipo_id
ORDER BY
  Partidos_Ganados DESC;

--11 Los 10 jugadores que tienen el contrato mas corto.

SELECT TOP 10
  j.nombre AS Nombre_Jugador,
  j.apellido AS Apellido_Jugador,
  c.salario AS Salario,
  c.fecha_inicio AS Fecha_Inicio_Contrato,
  c.fecha_finalizacion AS Fecha_Finalizacion_Contrato
FROM
  jugadores j
JOIN
  contratos c ON j.jugador_id = c.jugador_id
ORDER BY
  DATEDIFF(day, c.fecha_inicio, c.fecha_finalizacion) ASC;

--12 Cuantos equipos son de primera, infantil, juvenil.

SELECT
  categoria,
  COUNT(*) AS Cantidad_Equipos
FROM
  equipos
WHERE
  categoria IN ('infantil', 'primera', 'juvenil')
GROUP BY
  categoria;

--13 Cuantos jugadores tienen 1 entrenador cuyo apellido empieza con la letra "J".

SELECT
  COUNT(*) AS Cantidad_Jugadores
FROM
  jugadores j
JOIN
  entrenadores e ON j.equipo_id = e.equipo_id
WHERE
  SUBSTRING(e.apellido, 1, 1) = 'J';

--14 Entrenador del jugador con el salario mas alto.

SELECT TOP 1
  j.nombre AS Nombre_Jugador,
  j.apellido AS Apellido_Jugador,
  c.salario AS Salario,
  e.nombre AS Nombre_Entrenador,
  e.apellido AS Apellido_Entrenador
FROM
  jugadores j
JOIN
  contratos c ON j.jugador_id = c.jugador_id
JOIN
  entrenadores e ON j.equipo_id = e.equipo_id
ORDER BY
  c.salario DESC;

--15 Categoría del equipo donde juega el jugador con el salario mas bajo.

SELECT TOP 1
  j.nombre AS Nombre_Jugador,
  j.apellido AS Apellido_Jugador,
  c.salario AS Salario,
  e.categoria AS Categoria_Equipo
FROM
  jugadores j
JOIN
  contratos c ON j.jugador_id = c.jugador_id
JOIN
  equipos e ON j.equipo_id = e.equipo_id
ORDER BY
  c.salario ASC;

--16 Cantidad de jugadores cuyo nombre comience con la letra "M".

SELECT
  COUNT(*) AS Cantidad_Jugadores
FROM
  jugadores
WHERE
  nombre LIKE 'M%';

--17 Apellido del entrenador cuyo estadio es el mas chico.

SELECT TOP 1
  e.apellido AS Apellido_Entrenador
FROM
  entrenadores e
JOIN
  equipos eq ON e.equipo_id = eq.equipo_id
JOIN
  estadio es ON eq.estadio_id = es.estadio_id
ORDER BY
  es.capacidad ASC;

--18 Jugador con el contrato de mayor duración.

SELECT TOP 1
  j.nombre AS Nombre_Jugador,
  j.apellido AS Apellido_Jugador,
  c.salario AS Salario,
  c.fecha_inicio AS Fecha_Inicio_Contrato,
  c.fecha_finalizacion AS Fecha_Finalizacion_Contrato,
  DATEDIFF(day, c.fecha_inicio, c.fecha_finalizacion) AS Duracion_Contrato_Dias
FROM
  jugadores j
JOIN
  contratos c ON j.jugador_id = c.jugador_id
ORDER BY
  DATEDIFF(day, c.fecha_inicio, c.fecha_finalizacion) DESC;

--19 Jugadores y entrenadores que viven en la misma calle.

SELECT
  j.nombre AS Nombre_Jugador,
  j.apellido AS Apellido_Jugador,
  j.direccion AS Direccion_Jugador,
  e.nombre AS Nombre_Entrenador,
  e.apellido AS Apellido_Entrenador,
  e.direccion AS Direccion_Entrenador
FROM
  jugadores j
JOIN
  entrenadores e ON j.equipo_id = e.equipo_id
WHERE
  j.direccion = e.direccion;

--20 Cantidad de camisetas pares e impares.

SELECT
  COUNT(CASE WHEN numero_camiseta % 2 = 0 THEN 1 END) AS Camisetas_Pares,
  COUNT(CASE WHEN numero_camiseta % 2 <> 0 THEN 1 END) AS Camisetas_Impares
FROM
  jugadores;
