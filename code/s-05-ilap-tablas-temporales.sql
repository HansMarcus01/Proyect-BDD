--@Autor: Hansel Yael Tepal Briseno y Luis Daniel Salazar Islas
--@Fecha creacion: 30/05/2026
--@Descripcion: Creación de tablas temporales para el manejo de datos BLOB

Prompt eliminando tablas temporales en caso de existir
declare
    cursor cur_tables is
        select table_name
        from user_tables
        where table_name in ('TI_LAPTOP_F1','TS_LAPTOP_F1')
        or table_name like 'T__SERVICIO_LAPTOP_F_';
begin
    for r in cur_tables loop
        execute immediate 'drop table ' || r.table_name || ' purge';
    end loop;
end;
/
prompt creando las tablas temporales para la tabla laptop
prompt creando la tabla temporal TI_LAPTOP_F1 para la insecion de fotos
create global temporary table ti_laptop_f1(
    laptop_id number (10,0) constraint pk_ti_laptop_f1 primary key,
    foto blob not null
)on commit preserve rows;

prompt creando la tabla temporal TS_LAPTOP_F1 para la consulta de fotos
create global temporary table ts_laptop_f1(
    laptop_id number (10,0) constraint pk_ts_laptop_f1 primary key,
    foto blob not null
)on commit preserve rows;

prompt creando las tablas temporales para la tabla insercion de servicio_laptop
prompt creando la tabla temporal TI_SERVICIO_LAPTOP_F1 para el sitio NO (HTB_S1)
create global temporary table ti_servicio_laptop_f1(
    laptop_id number (10,0) not null,
    num_servicio number(10,0) not null,
    importe number(8,2) not null,
    diagnostico varchar2(2000) not null,
    factura blob not null,
    sucursal_id number(10,0) not null,
    constraint pk_ti_servicio_laptop_f1 primary key (laptop_id, num_servicio)
)on commit preserve rows;

prompt creando la tabla temporal TI_SERVICIO_LAPTOP_F2 para el sitio EA (HTB_S2)
create global temporary table ti_servicio_laptop_f2(
    laptop_id number(10,0) not null,
    num_servicio number(10,0) not null,
    importe number(8,2) not null,
    diagnostico varchar2(2000) not null,
    factura blob not null,
    sucursal_id number(10,0) not null,
    constraint pk_ti_servicio_laptop_f2 primary key (laptop_id, num_servicio)
)on commit preserve rows;

prompt creando la tabla temporal TI_SERVICIO_LAPTOP_F3 para el sitio WS (LSI_S1)
create global temporary table ti_servicio_laptop_f3(
    laptop_id number(10,0) not null,
    num_servicio number(10,0) not null,
    importe number(8,2) not null,
    diagnostico varchar2(2000) not null,
    factura blob not null,
    sucursal_id number(10,0) not null,
    constraint pk_ti_servicio_laptop_f3 primary key (laptop_id, num_servicio)
)on commit preserve rows;

prompt creando la tabla tempora TI_SERVICIO_LAPTOP_F4 para el sitio SO (LSI_S2)
create global temporary table ti_servicio_laptop_f4(
    laptop_id number(10,0) not null,
    num_servicio number(10,0) not null,
    importe number(8,2) not null,
    diagnostico varchar2(2000) not null,
    factura blob not null,
    sucursal_id number(10,0) not null,
    constraint pk_ti_servicio_laptop_f4 primary key (laptop_id, num_servicio)
)on commit preserve rows;

prompt creando las tablas temporales para la consulta de servicio_laptop
prompt creando la tabla temporal TS_SERVICIO_LAPTOP_F1 para el sitio NO (HTB_S1)
create global temporary table ts_servicio_laptop_f1(
    laptop_id number(10,0) not null,
    num_servicio number(10,0) not null,
    importe number(8,2) not null,
    diagnostico varchar2(2000) not null,
    factura blob not null,
    sucursal_id number(10,0) not null,
    constraint pk_ts_servicio_laptop_f1 primary key (laptop_id, num_servicio)
)on commit preserve rows;

prompt creando la tabla temporal TS_SERVICIO_LAPTOP_F2 para el sitio EA (HTB_S2)
create global temporary table ts_servicio_laptop_f2(
    laptop_id number(10,0) not null,
    num_servicio number(10,0) not null,
    importe number(8,2) not null,
    diagnostico varchar2(2000) not null,
    factura blob not null,
    sucursal_id number(10,0) not null,
    constraint pk_ts_servicio_laptop_f2 primary key (laptop_id, num_servicio)
)on commit preserve rows;

prompt creando la tabla temporal TS_SERVICIO_LAPTOP_F3 para el sitio WS (LSI_S1)
create global temporary table ts_servicio_laptop_f3(
    laptop_id number(10,0) not null,
    num_servicio number(10,0) not null,
    importe number(8,2) not null,
    diagnostico varchar2(2000) not null,
    factura blob not null,
    sucursal_id number(10,0) not null,
    constraint pk_ts_servicio_laptop_f3 primary key (laptop_id, num_servicio)
)on commit preserve rows;

prompt creando la tabla temporal TS_SERVICIO_LAPTOP_F4 para el sitio SO (LSI_S2)
create global temporary table ts_servicio_laptop_f4(
    laptop_id number(10,0) not null,
    num_servicio number(10,0) not null,
    importe number(8,2) not null,
    diagnostico varchar2(2000) not null,
    factura blob not null,
    sucursal_id number(10,0) not null,
    constraint pk_ts_servicio_laptop_f4 primary key (laptop_id, num_servicio)
)on commit preserve rows;

prompt Listo!
exit
