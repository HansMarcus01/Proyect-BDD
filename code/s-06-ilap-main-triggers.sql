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

@s-06-ilap-trigger-sucursal.sql
@s-06-ilap-trigger-htbbdd_s1-sucursal_taller.sql
@s-06-ilap-trigger-htbbdd_s1-sucursal-venta.sql
@s-06-ilap-laptop-trigger.sql
@s-06-ilap-trigger-historico_status_laptop.sql
@s-06-ilap-trigger-laptop_inventario.sql
@s-06-ilap-trigger-htbbdd_s1-servicio_laptop.sql
@s-06-ilap-tipo_procesador-trigger.sql
@s-06-ilap-tipo_tarjeta_video-trigger.sql
@s-06-ilap-tipo_almacenamiento-trigger.sql
@s-06-ilap-tipo_monitor-trigger.sql

Prompt ==============================
Prompt Creando triggers en htbbdd_s2
Prompt ==============================
connect ilap_bdd/ilap_bdd@htbbdd_s2

@s-06-ilap-trigger-sucursal.sql
@s-06-ilap-trigger-htbbdd_s2-sucursal_taller.sql
@s-06-ilap-trigger-htbbdd_s2-sucursal-venta.sql
@s-06-ilap-laptop-trigger.sql
@s-06-ilap-trigger-historico_status_laptop.sql
@s-06-ilap-trigger-laptop_inventario.sql
@s-06-ilap-trigger-htbbdd_s2-servicio_laptop.sql
@s-06-ilap-tipo_procesador-trigger.sql
@s-06-ilap-tipo_tarjeta_video-trigger.sql
@s-06-ilap-tipo_almacenamiento-trigger.sql
@s-06-ilap-tipo_monitor-trigger.sql

Prompt ==============================
Prompt Creando triggers en lsibdd_s1
Prompt ==============================
connect ilap_bdd/ilap_bdd@lsibdd_s1

@s-06-ilap-trigger-sucursal.sql
@s-06-ilap-trigger-lsibdd_s1-sucursal_taller.sql
@s-06-ilap-trigger-lsibdd_s1-sucursal-venta.sql
@s-06-ilap-laptop-trigger.sql
@s-06-ilap-trigger-historico_status_laptop.sql
@s-06-ilap-trigger-laptop_inventario.sql
@s-06-ilap-trigger-lsibdd_s1-servicio_laptop.sql
@s-06-ilap-tipo_procesador-trigger.sql
@s-06-ilap-tipo_tarjeta_video-trigger.sql
@s-06-ilap-tipo_almacenamiento-trigger.sql
@s-06-ilap-tipo_monitor-trigger.sql

Prompt ==============================
Prompt Creando triggers en lsibdd_s1
Prompt ==============================
connect ilap_bdd/ilap_bdd@lsibdd_s1

@s-06-ilap-trigger-sucursal.sql
@s-06-ilap-trigger-lsibdd_s1-sucursal_taller.sql
@s-06-ilap-trigger-lsibdd_s1-sucursal-venta.sql
@s-06-ilap-lsibdd_s2-laptop-trigger.sql
@s-06-ilap-trigger-historico_status_laptop.sql
@s-06-ilap-trigger-laptop_inventario.sql
@s-06-ilap-trigger-lsibdd_s1-servicio_laptop.sql
@s-06-ilap-tipo_procesador-trigger.sql
@s-06-ilap-tipo_tarjeta_video-trigger.sql
@s-06-ilap-tipo_almacenamiento-trigger.sql
@s-06-ilap-tipo_monitor-trigger.sql
