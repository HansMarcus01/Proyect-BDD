--@Autor: Hansel Yael Tepal Briseno y Luis Daniel Salazar Islas
--@Fecha creacion: 29/05/2026
--@Descripcion: Creacion de vistas

--sucursal
Prompt Vista sucursal
create or replace view sucursal as
select sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url
	from sucursal_f1
union all
select sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url
	from sucursal_f2
union all
select sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url
	from sucursal_f3
union all
select sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url
	from sucursal_f4;

--sucursal venta
create or replace view sucursal_venta as
select sucursal_id,hora_apertura,hora_cierre
    from sucursal_venta_f1
union all
select sucursal_id,hora_apertura,hora_cierre
    from sucursal_venta_f2
union all
select sucursal_id,hora_apertura,hora_cierre
    from sucursal_venta_f3
union all
select sucursal_id,hora_apertura,hora_cierre
    from sucursal_venta_f4

--sucursal taller
create or replace view sucursal_taller as
select sucursal_id,hora_apertura,hora_cierre
    from sucursal_taller_f1
union all
select sucursal_id,hora_apertura,hora_cierre
    from sucursal_taller_f2
union all
select sucursal_id,hora_apertura,hora_cierre
    from sucursal_taller_f3
union all
select sucursal_id,hora_apertura,hora_cierre
    from sucursal_taller_f4

-- Laptop inventario
create or replace view laptop_inventario as
select laptop_id,