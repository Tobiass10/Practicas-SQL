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
 add constraint V_PK_VIAJE primary key (V_CODIGO);
AS 'Nombre y Apellido'
 FROM pasajero
ORDER BY p_apellido;