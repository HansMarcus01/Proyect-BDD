--@Autor: Hansel Yael Tepal Briseno y Luis Daniel Salazar Islas
--@Fecha creacion: 29/05/2026
--@Descripcion: Creacion de vistas a expeción de aquellas que contienen datos de tipo blob

--sucursal
Prompt Creando la vista Vista sucursal
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
prompt Creando la Vista sucursal_venta
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
    from sucursal_venta_f4;

--sucursal taller
prompt Creando la Vista sucursal_taller
create or replace view sucursal_taller as
select sucursal_id,dia_descanso,telefono_atencion
    from sucursal_taller_f1
union all
select sucursal_id,dia_descanso,telefono_atencion
    from sucursal_taller_f2
union all
select sucursal_id,dia_descanso,telefono_atencion
    from sucursal_taller_f3
union all
select sucursal_id,dia_descanso,telefono_atencion
    from sucursal_taller_f4;

-- Laptop inventario
prompt Creando la Vista laptop_inventario
create or replace view laptop_inventario as
select l1.laptop_id, l1.fecha_status, l1.status_laptop_id,
    l1.sucursal_id, l2.rfc_cliente, l2.num_tarjeta
from laptop_inventario_f2 l1, laptop_inventario_f1 l2
where l1.laptop_id = l2.laptop_id;

-- Historico status laptop
prompt Creando la Vista historico_status_laptop
create or replace view historico_status_laptop as
select historico_status_laptop_id, laptop_id, fecha_status, status_laptop_id
from historico_status_laptop_f1
union all
select historico_status_laptop_id, laptop_id, fecha_status, status_laptop_id
from historico_status_laptop_f2;

-- Tipo_procesador
prompt Creando la Vista tipo_procesador
create or replace view tipo_procesador as
select tipo_procesador_id, clave, descripcion
from tipo_procesador_r1;

-- Tipo_tarjeta_video
prompt Creando la Vista tipo_tarjeta_video
create or replace view tipo_tarjeta_video as
select tipo_tarjeta_video_id, clave, descripcion
from tipo_tarjeta_video_r1;

-- Tipo_almacenamiento
prompt Creando la Vista tipo_almacenamiento
create or replace view tipo_almacenamiento as
select tipo_almacenamiento_id, clave, descripcion
from tipo_almacenamiento_r1;

-- Tipo_monitor
prompt Creando la Vista tipo_monitor
create or replace view tipo_monitor as
select tipo_monitor_id, clave, descripcion
from tipo_monitor_r1;

prompt Listo!