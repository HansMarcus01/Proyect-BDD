--@Autor: Hansel Yael Tepal Briseño y Luis Daniel Salazar Islas
--@Fecha creación: 31/05/2026
--@Descripción: Creación de trigger para implementar transparencia de
-- inserción
clear screen
whenever sqlerror exit rollback;

Prompt ==============================
Prompt Creando triggers en htbbdd_s1
Prompt ==============================
connect ilap_bdd/ilap_bdd@htbbdd_s1
prompt Creando trigger para la tabla sucursal
@s-06-ilap-sucursal-trigger.sql
prompt Creando trigger para la tabla sucursal_taller
@s-06-ilap-htbbdd_s1-sucursal_taller-trigger.sql
prompt Creando trigger para la tabla sucursal_venta
@s-06-ilap-htbbdd_s1-sucursal-venta-trigger.sql
prompt Creando trigger para la tabla laptop
@s-06-ilap-laptop-trigger.sql
prompt Creando trigger para la tabla historico_status_laptop
@s-06-ilap-historico_status_laptop-trigger.sql
prompt Creando trigger para la tabla laptop_inventario
@s-06-ilap-laptop_inventario-trigger.sql
prompt Creando trigger para la tabla servicio_laptop
@s-06-ilap-htbbdd_s1-servicio_laptop-trigger.sql
prompt Creando trigger para la tabla tipo_procesador
@s-06-ilap-tipo_procesador-trigger.sql
prompt Creando trigger para la tabla tipo_tarjeta_video
@s-06-ilap-tipo_tarjeta_video-trigger.sql
prompt Creando trigger para la tabla tipo_almacenamiento
@s-06-ilap-tipo_almacenamiento-trigger.sql
prompt Creando trigger para la tabla tipo_monitor
@s-06-ilap-tipo_monitor-trigger.sql

Prompt ==============================
Prompt Creando triggers en htbbdd_s2
Prompt ==============================
connect ilap_bdd/ilap_bdd@htbbdd_s2

prompt Creando trigger para la tabla sucursal
@s-06-ilap-sucursal-trigger.sql
prompt Creando trigger para la tabla sucursal_taller
@s-06-ilap-htbbdd_s2-sucursal_taller-trigger.sql
prompt Creando trigger para la tabla sucursal_venta
@s-06-ilap-htbbdd_s2-sucursal-venta-trigger.sql
prompt Creando trigger para la tabla laptop
@s-06-ilap-laptop-trigger.sql
prompt Creando trigger para la tabla historico_status_laptop
@s-06-ilap-historico_status_laptop-trigger.sql
prompt Creando trigger para la tabla laptop_inventario
@s-06-ilap-laptop_inventario-trigger.sql
prompt Creando trigger para la tabla servicio_laptop
@s-06-ilap-htbbdd_s2-servicio_laptop-trigger.sql
prompt Creando trigger para la tabla tipo_procesador
@s-06-ilap-tipo_procesador-trigger.sql
prompt Creando trigger para la tabla tipo_tarjeta_video
@s-06-ilap-tipo_tarjeta_video-trigger.sql
prompt Creando trigger para la tabla tipo_almacenamiento
@s-06-ilap-tipo_almacenamiento-trigger.sql
prompt Creando trigger para la tabla tipo_monitor
@s-06-ilap-tipo_monitor-trigger.sql

Prompt ==============================
Prompt Creando triggers en lsibdd_s1
Prompt ==============================
connect ilap_bdd/ilap_bdd@lsibdd_s1

prompt Creando trigger para la tabla sucursal
@s-06-ilap-sucursal-trigger.sql
prompt Creando trigger para la tabla sucursal_taller
@s-06-ilap-lsibdd_s1-sucursal_taller-trigger.sql
prompt Creando trigger para la tabla sucursal_venta
@s-06-ilap-lsibdd_s1-sucursal-venta-trigger.sql
prompt Creando trigger para la tabla laptop
@s-06-ilap-laptop-trigger.sql
prompt Creando trigger para la tabla historico_status_laptop
@s-06-ilap-historico_status_laptop-trigger.sql
prompt Creando trigger para la tabla laptop_inventario
@s-06-ilap-laptop_inventario-trigger.sql
prompt Creando trigger para la tabla servicio_laptop
@s-06-ilap-lsibdd_s1-servicio_laptop-trigger.sql
prompt Creando trigger para la tabla tipo_procesador
@s-06-ilap-tipo_procesador-trigger.sql
prompt Creando trigger para la tabla tipo_tarjeta_video
@s-06-ilap-tipo_tarjeta_video-trigger.sql
prompt Creando trigger para la tabla tipo_almacenamiento
@s-06-ilap-tipo_almacenamiento-trigger.sql
prompt Creando trigger para la tabla tipo_monitor
@s-06-ilap-tipo_monitor-trigger.sql

Prompt ==============================
Prompt Creando triggers en lsibdd_s1
Prompt ==============================
connect ilap_bdd/ilap_bdd@lsibdd_s1

prompt Creando trigger para la tabla sucursal
@s-06-ilap-sucursal-trigger.sql
prompt Creando trigger para la tabla sucursal_taller
@s-06-ilap-lsibdd_s1-sucursal_taller-trigger.sql
prompt Creando trigger para la tabla sucursal_venta
@s-06-ilap-lsibdd_s1-sucursal-venta-trigger.sql
prompt Creando trigger para la tabla laptop
@s-06-ilap-lsibdd_s2-laptop-trigger.sql
prompt Creando trigger para la tabla historico_status_laptop
@s-06-ilap-historico_status_laptop-trigger.sql
prompt Creando trigger para la tabla laptop_inventario
@s-06-ilap-laptop_inventario-trigger.sql
prompt Creando trigger para la tabla servicio_laptop
@s-06-ilap-lsibdd_s1-servicio_laptop-trigger.sql
prompt Creando trigger para la tabla tipo_procesador
@s-06-ilap-tipo_procesador-trigger.sql
prompt Creando trigger para la tabla tipo_tarjeta_video
@s-06-ilap-tipo_tarjeta_video-trigger.sql
prompt Creando trigger para la tabla tipo_almacenamiento
@s-06-ilap-tipo_almacenamiento-trigger.sql
prompt Creando trigger para la tabla tipo_monitor
@s-06-ilap-tipo_monitor-trigger.sql

prompt Listo!
disconnect
exit