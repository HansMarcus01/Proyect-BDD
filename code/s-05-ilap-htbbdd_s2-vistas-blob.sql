--@Autor: Hansel Yael Tepal Briseno y Luis Daniel Salazar Islas
--@Fecha creacion: 30/05/2026
--@Descripcion: Definición de las vistas con acceso a datos blob para el sitio HTBBDD_S2 (EA)

prompt crendo la vista para laptop
create or replace view laptop as
select laptop_id, num_serie, cantidad_ram, caracteristicas_extras,
    tipo_procesador_id, tipo_tarjeta_video_id, tipo_almacenamiento_id,
    tipo_monitor_id, laptop_reemplazo_id, get_remote_foto_f1_by_id(laptop_id) as foto
from (
    select laptop_id, num_serie, cantidad_ram, caracteristicas_extras, tipo_procesador_id,
    tipo_tarjeta_video_id, tipo_almacenamiento_id, tipo_monitor_id, laptop_reemplazo_id
    from laptop_f2
    union all
    select laptop_id, num_serie, cantidad_ram, caracteristicas_extras, tipo_procesador_id,
    tipo_tarjeta_video_id, tipo_almacenamiento_id, tipo_monitor_id, laptop_reemplazo_id
    from laptop_f3
    union all
    select laptop_id, num_serie, cantidad_ram, caracteristicas_extras, tipo_procesador_id,
    tipo_tarjeta_video_id, tipo_almacenamiento_id, tipo_monitor_id, laptop_reemplazo_id
    from laptop_f4
    union all
    select laptop_id, num_serie, cantidad_ram, caracteristicas_extras, tipo_procesador_id,
    tipo_tarjeta_video_id, tipo_almacenamiento_id, tipo_monitor_id, laptop_reemplazo_id
    from laptop_f5
) q1;

prompt creando la vista para servicio_laptop
create or replace view servicio_laptop as
select laptop_id, num_servicio, importe, diagnostico,
    get_remote_factura_f1_by_id(laptop_id, num_servicio) as factura, sucursal_id
from servicio_laptop_f1
union all
select laptop_id, num_servicio, importe, diagnostico, factura, sucursal_id
from servicio_laptop_f2
union all
select laptop_id, num_servicio, importe, diagnostico,
    get_remote_factura_f3_by_id(laptop_id, num_servicio) as factura, sucursal_id
from servicio_laptop_f3
union all
select laptop_id, num_servicio, importe, diagnostico,
    get_remote_factura_f4_by_id(laptop_id, num_servicio) as factura, sucursal_id
from servicio_laptop_f4;