--@Autor: Hansel Yael Tepal Briseño
--@Fecha creación: 26/05/2026
--@Descripción: Definicion del esquma de fragmentación para el sitio EA (HTBBDDbdd_s2)
-- y de sus respectivas secuencias

prompt creando el fragmento 2 de la tabla sucursal
drop table if exists suscursal_F2_HTBBDD_S2 cascade constraints;
create table suscursal_F2_HTBBDD_S2(
    sucursal_id number(10,0) not null,
    es_taller boolean not null,
    es_venta boolean not null,
    latitud float not null,
    longitud float not null,
    url varchar2(200) not null,
    nombre varchar2(40) not null,
    clave varchar2(10) not null,
    constraint sucursal_F2_HTBBDD_S2_pk primary key (sucursal_id)
);

prompt creando la secuencia para la tabla sucursal del fragmento 2
drop sequence if exists sucursal_F2_HTBBDD_S2_seq;
create sequence sucursal_F2_HTBBDD_S2_seq
    start with 1
    increment by 1
    nomaxvalue
    nocycle
    cache 20
    order;

prompt creando el fragmento 

