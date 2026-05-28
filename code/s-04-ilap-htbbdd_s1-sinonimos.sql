--@Autor: Hansel Yael Tepal Briseno y Luis Daniel Salazar Islas
--@Fecha creacion: 27/05/2026
--@Descripcion: Creacion de sinonimos para transparencia de localizacion en HTBBDD_S1

clear screen
whenever sqlerror exit rollback;

prompt =====================================
prompt Creando sinonimos en htbbdd_s1
prompt =====================================
connect ilap_bdd/ilap_bdd@htbbdd_s1

prompt Creando sinonimos de sucursal
create or replace synonym sucursal_f1 for sucursal_F1_HTB_S1;
create or replace synonym sucursal_f2 for sucursal_F2_HTB_S2@htbbdd_s2.fi.unam;
create or replace synonym sucursal_f3 for sucursal_F3_LSI_S1@lsibdd_s1.fi.unam;
create or replace synonym sucursal_f4 for sucursal_F4_LSI_S2@lsibdd_s2.fi.unam;

prompt Creando sinonimos de sucursal_venta
create or replace synonym sucursal_venta_f1 for sucursal_venta_F1_HTB_S1;
create or replace synonym sucursal_venta_f2 for sucursal_venta_F2_HTB_S2@htbbdd_s2.fi.unam;
create or replace synonym sucursal_venta_f3 for sucursal_venta_F3_LSI_S1@lsibdd_s1.fi.unam;
create or replace synonym sucursal_venta_f4 for sucursal_venta_F4_LSI_S2@lsibdd_s2.fi.unam;

prompt Creando sinonimos de sucursal_taller
create or replace synonym sucursal_taller_f1 for sucursal_taller_F1_HTB_S1;
create or replace synonym sucursal_taller_f2 for sucursal_taller_F2_HTB_S2@htbbdd_s2.fi.unam;
create or replace synonym sucursal_taller_f3 for sucursal_taller_F3_LSI_S1@lsibdd_s1.fi.unam;
create or replace synonym sucursal_taller_f4 for sucursal_taller_F4_LSI_S2@lsibdd_s2.fi.unam;

prompt Creando sinonimos de servicio_laptop
create or replace synonym servicio_laptop_f1 for servicio_laptop_F1_HTB_S1;
create or replace synonym servicio_laptop_f2 for servicio_laptop_F2_HTB_S2@htbbdd_s2.fi.unam;
create or replace synonym servicio_laptop_f3 for servicio_laptop_F3_LSI_S1@lsibdd_s1.fi.unam;
create or replace synonym servicio_laptop_f4 for servicio_laptop_F4_LSI_S2@lsibdd_s2.fi.unam;

prompt Creando sinonimos de laptop_inventario
create or replace synonym laptop_inventario_f1 for laptop_inventario_F1_LSI_S1@lsibdd_s1.fi.unam;
create or replace synonym laptop_inventario_f2 for laptop_inventario_F2_HTB_S1;

prompt Creando sinonimos de laptop
create or replace synonym laptop_f1 for laptop_F1_LSI_S2@lsibdd_s2.fi.unam;
create or replace synonym laptop_f2 for laptop_F2_HTB_S1;
create or replace synonym laptop_f3 for laptop_F3_LSI_S2@lsibdd_s2.fi.unam;
create or replace synonym laptop_f4 for laptop_F4_LSI_S1@lsibdd_s1.fi.unam;
create or replace synonym laptop_f5 for laptop_F5_HTB_S2@htbbdd_s2.fi.unam;

prompt Creando sinonimos de historico_status_laptop
create or replace synonym historico_status_laptop_f1 for historico_status_laptop_F1_HTB_S2@htbbdd_s2.fi.unam;
create or replace synonym historico_status_laptop_f2 for historico_status_laptop_F2_HTB_S1;

prompt Creando sinonimos de tipo_procesador
create or replace synonym tipo_procesador_r1 for tipo_procesador_R_HTB_S1;
create or replace synonym tipo_procesador_r2 for tipo_procesador_R_HTB_S2@htbbdd_s2.fi.unam;
create or replace synonym tipo_procesador_r3 for tipo_procesador_R_LSI_S1@lsibdd_s1.fi.unam;
create or replace synonym tipo_procesador_r4 for tipo_procesador_R_LSI_S2@lsibdd_s2.fi.unam;

prompt Creando sinonimos de tipo_tarjeta_video
create or replace synonym tipo_tarjeta_video_r1 for tipo_tarjeta_video_R_HTB_S1;
create or replace synonym tipo_tarjeta_video_r2 for tipo_tarjeta_video_R_HTB_S2@htbbdd_s2.fi.unam;
create or replace synonym tipo_tarjeta_video_r3 for tipo_tarjeta_video_R_LSI_S1@lsibdd_s1.fi.unam;
create or replace synonym tipo_tarjeta_video_r4 for tipo_tarjeta_video_R_LSI_S2@lsibdd_s2.fi.unam;

prompt Creando sinonimos de tipo_almacenamiento
create or replace synonym tipo_almacenamiento_r1 for tipo_almacenamiento_R_HTB_S1;
create or replace synonym tipo_almacenamiento_r2 for tipo_almacenamiento_R_HTB_S2@htbbdd_s2.fi.unam;
create or replace synonym tipo_almacenamiento_r3 for tipo_almacenamiento_R_LSI_S1@lsibdd_s1.fi.unam;
create or replace synonym tipo_almacenamiento_r4 for tipo_almacenamiento_R_LSI_S2@lsibdd_s2.fi.unam;

prompt Creando sinonimos de tipo_monitor
create or replace synonym tipo_monitor_r1 for tipo_monitor_R_HTB_S1;
create or replace synonym tipo_monitor_r2 for tipo_monitor_R_HTB_S2@htbbdd_s2.fi.unam;
create or replace synonym tipo_monitor_r3 for tipo_monitor_R_LSI_S1@lsibdd_s1.fi.unam;
create or replace synonym tipo_monitor_r4 for tipo_monitor_R_LSI_S2@lsibdd_s2.fi.unam;

prompt Ejecucion Finalizada!
disconnect
exit
