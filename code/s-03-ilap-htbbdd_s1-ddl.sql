--@Autor: Hansel Yael Tepal Briseño y Luis Daniel Salazar Islas
--@Fecha creación: 26/05/2026
--@Descripción: Definicion del esquma de fragmentación para el sitio NO (HTB_s1)

prompt creando el fragmento 1 de la tabla sucursal
drop table if exists sucursal_F1_HTB_S1 cascade constraints;
create table sucursal_F1_HTB_S1(
    sucursal_id number(10,0) not null,
    es_taller boolean not null,
    es_venta boolean not null,
    latitud float not null,
    longitud float not null,
    url varchar2(200) not null,
    nombre varchar2(40) not null,
    clave varchar2(10) not null,
    constraint sucursal_F1_HTB_S1_pk primary key (sucursal_id),
    constraint sucursal_F1_HTB_S1_uk_clave unique (clave),
    constraint sucursal_F1_HTB_S1_uk_url unique (url),
    constraint sucursal_F1_HTB_S1_tipo_sucursal_chk
        check (es_venta = true or es_taller = true) -- al menos una de las dos debe ser true
);

prompt creando el fragmento 1 de la tabla sucursal_venta
drop table if exists sucursal_venta_F1_HTB_S1 cascade constraints;
create table sucursal_venta_F1_HTB_S1(
    sucursal_id number(10,0) not null,
    hora_apertura number(4,0) not null,
    hora_cierre number(4,0) not null,
    constraint sucursal_venta_F1_HTB_S1_pk primary key (sucursal_id),
    constraint sucursal_venta_F1_HTB_S1_hora_apertura_chk check (hora_apertura between 0 and 1440),
    constraint sucursal_venta_F1_HTB_S1_hora_cierre_chk check (hora_cierre between 0 and 1440),
    constraint sucursal_venta_F1_HTB_S1_sucursal_id_fk foreign key (sucursal_id)
        references sucursal_F1_HTB_S1(sucursal_id)
);

prompt creando el fragmento 1 de la tabla sucursal_taller
drop table if exists sucursal_taller_F1_HTB_S1 cascade constraints;
create table sucursal_taller_F1_HTB_S1(
    sucursal_id number(10,0) not null,
    dia_descanso number(1,0) not null,
    telefono_atencion varchar2(20) not null,
    constraint sucursal_taller_F1_HTB_S1_pk primary key (sucursal_id),
    constraint sucursal_taller_F1_HTB_S1_telefono_atencion_uk unique (telefono_atencion),
    constraint sucursal_taller_F1_HTB_S1_dia_descanso_chk check (dia_descanso between 1 and 7),
    constraint sucursal_taller_F1_HTB_S1_sucursal_id_fk foreign key (sucursal_id)
        references sucursal_F1_HTB_S1(sucursal_id)
);

prompt creando el fragmento 1 de la tabla servicio_laptop
drop table if exists servicio_laptop_F1_HTB_S1 cascade constraints;
create table servicio_laptop_F1_HTB_S1(
    laptop_id number(10,0) not null,
    num_servicio number(10,0) not null,
    importe number(8,2) not null,
    diagnostico varchar2(2000) not null,
    factura blob not null,
    sucursal_id number(10,0) not null,
    constraint servicio_laptop_F1_HTB_S1_pk primary key (laptop_id, num_servicio),
    constraint servicio_laptop_F1_HTB_S1_importe_chk check (importe > 0), -- adñadir en las demas
    constraint servicio_laptop_F1_HTB_S1_sucursal_id_fk foreign key (sucursal_id)
        references sucursal_taller_F1_HTB_S1(sucursal_id)
);

prompt creando el fragmento replicado 1 de la tabla tipo_procesador
drop table if exists tipo_procesador_R_HTB_S1 cascade constraints;
create table tipo_procesador_R_HTB_S1(
    tipo_procesador_id number(5,0) not null,
    clave varchar2(40) not null,
    descripcion varchar2(400) not null,
    constraint tipo_procesador_R_HTB_S1_pk primary key (tipo_procesador_id)
);



prompt creando el fragmento replicado 1 de la tabla tipo_tarjeta_video
drop table if exists tipo_tarjeta_video_R_HTB_S1 cascade constraints;
create table tipo_tarjeta_video_R_HTB_S1(
    tipo_tarjeta_video_id number(5,0) not null,
    clave varchar2(40) not null,
    descripcion varchar2(400) not null,
    constraint tipo_tarjeta_video_R_HTB_S1_pk primary key (tipo_tarjeta_video_id)
);

prompt creando el fragmento replicado 1 de la tabla tipo_almacenamiento
drop table if exists tipo_almacenamiento_R_HTB_S1 cascade constraints;
create table tipo_almacenamiento_R_HTB_S1(
    tipo_almacenamiento_id number(5,0) not null,
    clave varchar2(40) not null,
    descripcion varchar2(400) not null,
    constraint tipo_almacenamiento_R_HTB_S1_pk primary key (tipo_almacenamiento_id)
);

prompt creando el fragmento replicado 1 de la tabla tipo_monitor
drop table if exists tipo_monitor_R_HTB_S1 cascade constraints;
create table tipo_monitor_R_HTB_S1(
    tipo_monitor_id number(5,0) not null,
    clave varchar2(40) not null,
    descripcion varchar2(400) not null,
    constraint tipo_monitor_R_HTB_S1_pk primary key (tipo_monitor_id)
);

prompt creando la tabla Status_laptop en HTB_s1
drop table if exists status_laptop cascade constraints;
create table status_laptop (
    status_laptop_id number(5,0) not null, -- corregir a number (5,0 ) en las demas
    clave varchar2(40) not null,
    descripcion varchar2(200) not null,
    constraint status_laptop_pk primary key (status_laptop_id)
);

prompt creando el fragmento 2 de la tabla laptop_inventario
drop table if exists laptop_inventario_F2_HTB_S1 cascade constraints;
create table laptop_inventario_F2_HTB_S1(
    laptop_id number(10,0) not null,
    fecha_status date not null,
    sucursal_id number(10,0) not null,
    status_laptop_id number(5,0) not null,
    constraint laptop_inventario_F2_HTB_S1_pk primary key (laptop_id),
    constraint laptop_inventario_F2_HTB_S1_status_laptop_id_fk foreign key (status_laptop_id)
        references status_laptop(status_laptop_id)
);

prompt creando el fragmento 2 de la tabla laptop
drop table if exists laptop_F2_HTB_S1 cascade constraints;
create table laptop_F2_HTB_S1(
    laptop_id number(10,0) not null,
    num_serie varchar2(18) not null,
    cantidad_ram number(6,0) not null,
    caracteristicas_extras varchar2(2000) not null,
    tipo_procesador_id number(5,0) not null,
    tipo_tarjeta_video_id number(5,0) not null,
    tipo_almacenamiento_id number(5,0) not null,
    tipo_monitor_id number(5,0) not null,
    laptop_reemplazo_id number(10,0),
    constraint laptop_F2_HTB_S1_pk primary key (laptop_id),
    constraint laptop_F2_HTB_S1_num_serie_uk unique (num_serie), -- chacar orden de los contraints
    constraint laptop_F2_HTB_S1_tipo_procesador_id_fk foreign key (tipo_procesador_id)
        references tipo_procesador_R_HTB_S1(tipo_procesador_id),
    constraint laptop_F2_HTB_S1_tipo_tarjeta_video_id_fk foreign key (tipo_tarjeta_video_id)
        references tipo_tarjeta_video_R_HTB_S1(tipo_tarjeta_video_id),
    constraint laptop_F2_HTB_S1_tipo_almacenamiento_id_fk foreign key (tipo_almacenamiento_id)
        references tipo_almacenamiento_R_HTB_S1(tipo_almacenamiento_id),
    constraint laptop_F2_HTB_S1_tipo_monitor_id_fk foreign key (tipo_monitor_id)
        references tipo_monitor_R_HTB_S1(tipo_monitor_id),
    constraint laptop_F2_HTB_S1_laptop_reemplazo_id_fk foreign key (laptop_reemplazo_id)
        references laptop_inventario_F2_HTB_S1(laptop_id)
);

prompt creando el fragmento 2 de la tabla historico_status_laptop
drop table if exists historico_status_laptop_F2_HTB_S1 cascade constraints;
create table historico_status_laptop_F2_HTB_S1(
    historico_status_laptop_id number(10,0) not null,
    fecha_status date not null,
    laptop_id number(10,0) not null,
    status_laptop_id number(5,0) not null,
    constraint historico_status_laptop_F2_HTB_S1_pk primary key (historico_status_laptop_id),
    constraint historico_status_laptop_F2_HTB_S1_laptop_id_fk foreign key (laptop_id)
        references laptop_inventario_F2_HTB_S1(laptop_id),
    constraint historico_status_laptop_F2_HTB_S1_status_laptop_id_fk foreign key (status_laptop_id)
        references status_laptop(status_laptop_id)
);