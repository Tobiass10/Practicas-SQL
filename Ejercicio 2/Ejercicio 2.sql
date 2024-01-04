CREATE DATABASE ejercicio_dos

USE ejercicio_dos

create table LUGAR
(
 l_codigo varchar(8) not null,
 l_nombre varchar(50) not null,
 l_tipo varchar(020) not null,
 l_clima varchar(20) not null,
 l_total_habitantes numeric(12,2) not null,
 l_descripcion varchar(100) not null
)
create table VIAJE
(
 v_codigo varchar(8) not null,
 v_fecha date not null,
 v_cd_pasajero varchar(8) not null,
 v_cd_lugar varchar(8) not null
)
create table PASAJERO
(
 p_codigo VARCHAR(8) not null,
 p_nombre VARCHAR(30) not null,
 p_apellido VARCHAR(30) not null,
 p_perfil VARCHAR(20) not null,
 p_fecha_nacimiento DATE not null,
 p_num_telefonico VARCHAR(12),
 p_cd_lugar VARCHAR(8) not null
)
alter table LUGAR
 add constraint L_PK_CODIGO primary key (L_CODIGO);
alter table LUGAR
 add constraint L_FK_LUGAR foreign key (L_CODIGO)
 references LUGAR (L_CODIGO);
alter table PASAJERO
 add constraint P_PASAJERO primary key (P_CODIGO);
alter table PASAJERO
 add constraint P_FK_LUGAR_PAIS_RESIDENCIA foreign key (P_CD_LUGAR) 
references LUGAR (L_CODIGO);
 alter table VIAJE
 add constraint V_FK_PASAJERO foreign key (V_CD_PASAJERO)
 references pasajero (P_CODIGO);
alter table VIAJE
add constraint V_FK_LUGAR foreign key (V_CD_LUGAR)
 references lugar (L_CODIGO);
alter table VIAJE
 add constraint V_PK_VIAJE primary key (V_CODIGO);SELECT * FROM LUGARSELECT * FROM VIAJESELECT * FROM PASAJERO -- 1 --SELECT * FROM LUGAR-- 2 --SELECT p_nombre,p_apellido FROM PASAJERO-- 3 --SELECT l_nombre,l_clima FROM LUGAR-- 4 --SELECT l_nombre,l_total_habitantes,l_total_habitantes + 100000 AS incremento_total_habitantes FROM LUGAR-- 5 --SELECT l_nombre,l_tipo,l_total_habitantes,l_total_habitantes * 2 AS Doble_de_habitantes FROM LUGAR-- 6 --SELECT DISTINCT l_clima FROM LUGAR-- 7 --SELECT DISTINCT p_perfil FROM PASAJERO-- 8 --SELECT DISTINCT p_apellido,p_perfil FROM PASAJERO-- 9 --SELECT p_nombre,p_apellido FROM PASAJERO WHERE p_perfil = 'Turista'-- 10 --SELECT l_nombreFROM LUGARWHERE (l_clima = 'Tropical')-- 11 --SELECT l_nombreFROM LUGARWHERE (l_tipo = 'Pais' AND l_total_habitantes > 10000000)-- 12 --SELECT *FROM PASAJEROWHERE (p_fecha_nacimiento BETWEEN '01-01-1970' AND '01-01-1980'-- 13 --SELECT p_nombre,p_fecha_nacimiento AS Nacido_elFROM PASAJEROWHERE p_perfil IN ('BUSINESS','PRIMERA_CLASE')-- 14 --SELECT l_climaFROM LUGARWHERE (l_clima <> 'MEDITERRANEO')-- 15 --SELECT p_nombreFROM PASAJEROWHERE p_nombre LIKE 'M%'-- 16 --SELECT l_nombreFROM LUGARWHERE l_nombre LIKE '%A%'-- 17 --SELECT DISTINCT p_apellidoFROM PASAJEROWHERE p_apellido LIKE 'M%EZ'-- 18 --SELECT l_nombreFROM LUGARWHERE l_clima is not null-- 19 --SELECT p_nombre, p_apellidoFROM PASAJEROWHERE p_perfil is null-- 20 --SELECT p_nombre, p_apellido	FROM PASAJEROWHERE p_nombre LIKE '%Y%' AND p_fecha_nacimiento BETWEEN '01-01-1975' AND '01-01-1985'-- 21 --SELECT p_nombre,p_apellido	FROM PASAJEROWHERE p_perfil = 'LOW_COST' AND p_apellido = 'RUIZ'-- 22 --SELECT l_nombre, l_climaFROM LUGARWHERE l_total_habitantes IS NULL AND l_nombre LIKE 'C%' AND (l_clima IS NULL OR l_clima = 'Mediterraneo')-- 23 --SELECT l_nombre,l_clima,l_total_habitantesFROM LUGARWHERE l_clima IS NULL AND l_nombre LIKE '%Ciudad%' OR l_total_habitantes < 5000000-- 24 --SELECT p_nombre,p_apellido,p_fecha_nacimiento,p_perfilFROM PASAJEROWHERE p_fecha_nacimiento > '01-01-1970' AND p_perfil = 'BUSINESS' AND p_nombre LIKE '%G%'-- 25 --SELECT l_nombre,l_total_habitantesFROM LUGARWHERE l_total_habitantes NOT BETWEEN 50000000 AND 10000000						 AND l_tipo = 'PAIS'						 AND l_nombre LIKE '%M%'						 AND l_tipo = 'CONTINENTE'						 AND l_nombre IN ('EUROPA', 'ASIA')-- 26 -- SELECT l_nombre,l_total_habitantesFROM LUGARWHERE l_tipo = 'PAIS'ORDER BY l_total_habitantes DESC-- 27 --SELECT p_apellido || ', ' || p_nombre 
AS 'Nombre y Apellido'
 FROM pasajero
ORDER BY p_apellido;-- 28 --SELECT l_nombre,l_climaFROM LUGARWHERE l_clima = 'TROPICAL' ORDER BY l_nombre-- 29 --SELECT p_nombre,p_apellido,p_fecha_nacimientoFROM PASAJEROORDER BY p_fecha_nacimiento,p_fecha_nacimiento DESC-- 30 --SELECT DISTINCT l_nombreFROM LUGARWHERE l_tipo = 'CONTINENTE' ORDER BY l_nombre ASC-- 31 --SELECT p_nombre,p_apellido,p_num_telefonicoFROM PASAJEROWHERE p_perfil <> 'BUSINESS'ORDER BY p_num_telefonico,p_apellido-- 32 --SELECT l_nombre,l_total_habitantesFROM LUGARWHERE l_tipo = 'PAIS'AND l_nombre NOT IN ('EUROPA','OCEANIA')ORDER BY l_nombre ASC ,l_total_habitantes DESC-- 33 --SELECT p_apellido,p_nombreFROM PASAJEROWHERE p_cd_lugar <> 'COLOMBIA'	AND p_apellido = 'FERNANDEZ'ORDER BY p_perfil,p_nombre-- 34 --SELECT l_nombre,l_clima,l_total_habitantesFROM LUGARWHERE l_total_habitantes > 10000	AND l_clima IS NOT NULL	AND l_descripcion LIKE '%UBICADA%SUR%'	ORDER BY l_nombre,l_total_habitantes ASC