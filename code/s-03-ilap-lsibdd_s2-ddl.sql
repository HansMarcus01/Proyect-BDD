--@Autor: Hansel Yael Tepal Briseño y Luis Daniel Salazar Islas
--@Fecha creación: 26/05/2026
--@Descripción: Definicion del esquma de fragmentación para el sitio SO (LSI_s2)
-- y de sus respectivas secuencias

prompt creadno el fragmento 4 de la tabla sucursal
drop table if exists sucursal_F4_LSI_S2 cascade constraints;
create table sucursal_F4_LSI_S2(
    sucursal_id number(10,0) not null,
    es_taller number(1,0) not null,
    es_venta number(1,0) not null,
    latitud float not null,
    longitud float not null,
    url varchar2(200) not null,
    nombre varchar2(40) not null,
    clave varchar2(10) not null,
    constraint sucursal_F4_LSI_S2_pk primary key (sucursal_id),
    -- constraint sucursal_F4_LSI_S2_uk_clave unique (clave),
    -- constraint sucursal_F4_LSI_S2_uk_url unique (url),
    constraint sucursal_F4_LSI_S2_es_taller_chk check (es_taller in (0, 1)),
    constraint sucursal_F4_LSI_S2_es_venta_chk check (es_venta in (0, 1))
    -- constraint sucursal_F4_LSI_S2_tipo_sucursal_chk
    --     check (es_venta = 1 or es_taller = 1) -- al menos una de las dos debe ser true
);

prompt creando el fragmento 4 de la tabla sucursal_venta
drop table if exists sucursal_venta_F4_LSI_S2 cascade constraints;
create table sucursal_venta_F4_LSI_S2(
    sucursal_id number(10,0) not null,
    hora_apertura date not null,
    hora_cierre date not null,
    constraint sucursal_venta_F4_LSI_S2_pk primary key (sucursal_id),
    constraint sucursal_venta_F4_LSI_S2_sucursal_id_fk foreign key (sucursal_id)
        references sucursal_F4_LSI_S2(sucursal_id)
);

prompt creando el fragmento 4 de la tabla sucursal_taller
drop table if exists sucursal_taller_F4_LSI_S2 cascade constraints;
create table sucursal_taller_F4_LSI_S2(
    sucursal_id number(10,0) not null,
    dia_descanso number(1,0) not null,
    telefono_atencion varchar2(20) not null,
    constraint sucursal_taller_F4_LSI_S2_pk primary key (sucursal_id),
    constraint sucursal_taller_F4_LSI_S2_telefono_atencion_uk unique (telefono_atencion),
    constraint sucursal_taller_F4_LSI_S2_dia_descanso_chk check (dia_descanso between 1 and 7),
    constraint sucursal_taller_F4_LSI_S2_sucursal_id_fk foreign key (sucursal_id)
        references sucursal_F4_LSI_S2(sucursal_id)
);

prompt creando el fragmento replicado 4 de la tabla tipo_procesador
drop table if exists tipo_procesador_R_LSI_S2 cascade constraints;
create table tipo_procesador_R_LSI_S2(
    tipo_procesador_id number(5,0) not null,
    clave varchar2(40) not null,
    descripcion varchar2(400) not null,
    constraint tipo_procesador_R_LSI_S2_pk primary key (tipo_procesador_id)
);

prompt creando el fragmento replicado 4 de la tabla tipo_tarjeta_video
drop table if exists tipo_tarjeta_video_R_LSI_S2 cascade constraints;
create table tipo_tarjeta_video_R_LSI_S2(
    tipo_tarjeta_video_id number(5,0) not null,
    clave varchar2(40) not null,
    descripcion varchar2(400) not null,
    constraint tipo_tarjeta_video_R_LSI_S2_pk primary key (tipo_tarjeta_video_id)
);

prompt creando el fragmento replicado 4 de la tabla tipo_almacenamiento
drop table if exists tipo_almacenamiento_R_LSI_S2 cascade constraints;
create table tipo_almacenamiento_R_LSI_S2(
    tipo_almacenamiento_id number(5,0) not null,
    clave varchar2(40) not null,
    descripcion varchar2(400) not null,
    constraint tipo_almacenamiento_R_LSI_S2_pk primary key (tipo_almacenamiento_id)
);

prompt creando el fragmento replicado 4 de la tabla tipo_monitor
drop table if exists tipo_monitor_R_LSI_S2 cascade constraints;
create table tipo_monitor_R_LSI_S2(
    tipo_monitor_id number(5,0) not null,
    clave varchar2(40) not null,
    descripcion varchar2(400) not null,
    constraint tipo_monitor_R_LSI_S2_pk primary key (tipo_monitor_id)
);

prompt creando el fragmento 1 de la tabla laptop
drop table if exists laptop_F1_LSI_S2 cascade constraints;
create table laptop_F1_LSI_S2(
    laptop_id number(10,0) not null,
    foto blob not null,
    constraint laptop_F1_LSI_S2_pk primary key (laptop_id)
);

prompt creando el fragmento 3 de la tabla laptop
drop table if exists laptop_F3_LSI_S2 cascade constraints;
create table laptop_F3_LSI_S2(
    laptop_id number(10,0) not null,
    num_serie varchar2(18) not null,
    cantidad_ram number(6,0) not null,
    caracteristicas_extras varchar2(2000) not null,
    tipo_procesador_id number(5,0) not null,
    tipo_tarjeta_video_id number(5,0) not null,
    tipo_almacenamiento_id number(5,0) not null,
    tipo_monitor_id number(5,0) not null,
    laptop_reemplazo_id number(10,0),
    constraint laptop_F3_LSI_S2_pk primary key (laptop_id),
    constraint laptop_F3_LSI_S2_num_serie_uk unique (num_serie),
    constraint laptop_F3_LSI_S2_tipo_procesador_id_fk foreign key (tipo_procesador_id)
        references tipo_procesador_R_LSI_S2(tipo_procesador_id),
    constraint laptop_F3_LSI_S2_tipo_tarjeta_video_id_fk foreign key (tipo_tarjeta_video_id)
        references tipo_tarjeta_video_R_LSI_S2(tipo_tarjeta_video_id),
    constraint laptop_F3_LSI_S2_tipo_almacenamiento_id_fk foreign key (tipo_almacenamiento_id)
        references tipo_almacenamiento_R_LSI_S2(tipo_almacenamiento_id),
    constraint laptop_F3_LSI_S2_tipo_monitor_id_fk foreign key (tipo_monitor_id)
        references tipo_monitor_R_LSI_S2(tipo_monitor_id),
    constraint laptop_F3_LSI_S2_laptop_reemplazo_id_fk foreign key (laptop_reemplazo_id)
        references laptop_F1_LSI_S2(laptop_id)
);

prompt creando el fragmento 4 de la tabla servicio_laptop
drop table if exists servicio_laptop_F4_LSI_S2 cascade constraints;
create table servicio_laptop_F4_LSI_S2(
    laptop_id number(10,0) not null,
    num_servicio number(10,0) not null,
    importe number(8,2) not null,
    diagnostico varchar2(2000) not null,
    factura blob,
    sucursal_id number(10,0) not null,
    constraint servicio_laptop_F4_LSI_S2_pk primary key (laptop_id, num_servicio),
    constraint servicio_laptop_F4_LSI_S2_importe_chk check (importe > 0),
    constraint servicio_laptop_F4_LSI_S2_laptop_id_fk foreign key (laptop_id)
        references laptop_F1_LSI_S2(laptop_id),
    constraint servicio_laptop_F4_LSI_S2_sucursal_id_fk foreign key (sucursal_id)
        references sucursal_taller_F4_LSI_S2(sucursal_id)
);

prompt creando la tabla Status_laptop en LSI_S2
drop table if exists status_laptop cascade constraints;
create table status_laptop (
    status_laptop_id number(5,0) not null,
    clave varchar2(40) not null,
    descripcion varchar2(200) not null,
    constraint status_laptop_pk primary key (status_laptop_id)
);