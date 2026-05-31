--@Autor: Hansel Yael Tepal Briseño y Luis Daniel Salazar islas
--@Fecha creación: 30/05/2026
--@Descripción: Creación de vistas para todos los sitios

clear screen;
whenever sqlerror exit rollback;

prompt ===========================================
prompt Creando vistas para htbbdd_s1
prompt ===========================================

connect ilap_bdd/ilap_bdd@htbbdd_s1
prompt creando vistas que no requieren manejo de objetos BLOBs
@s-05-ilap-vistas.sql

prompt creando tablas temporales
@s-05-ilap-tablas-temporales.sql

prompt creando objetos para manejo de BLOBs
@s-05-ilap-funciones-blob.sql

prompt creando vistas con soporte para BLOBs
@s-05-ilap-htbbdd_s1-vistas-blob.sql

prompt ===========================================
prompt Creando vistas para htbbdd_s2
prompt ===========================================

connect ilap_bdd/ilap_bdd@htbbdd_s2
prompt creando vistas que no requieren manejo de objetos BLOBs
@s-05-ilap-vistas.sql

prompt creando tablas temporales
@s-05-ilap-tablas-temporales.sql

prompt creando objetos para manejo de BLOBs
@s-05-ilap-funciones-blob.sql

prompt creando vistas con soporte para BLOBs
@s-05-ilap-htbbdd_s2-vistas-blob.sql

prompt ===========================================
prompt Creando vistas para lsibdd_s1
prompt ===========================================

connect ilap_bdd/ilap_bdd@lsibdd_s1
prompt creando vistas que no requieren manejo de objetos BLOBs
@s-05-ilap-vistas.sql

prompt creando tablas temporales
@s-05-ilap-tablas-temporales.sql

prompt creando objetos para manejo de BLOBs
@s-05-ilap-funciones-blob.sql

prompt creando vistas con soporte para BLOBs
@s-05-ilap-lsibdd_s1-vistas-blob.sql

prompt ===========================================
prompt Creando vistas para lsibdd_s2
prompt ===========================================

connect ilap_bdd/ilap_bdd@lsibdd_s2
prompt creando vistas que no requieren manejo de objetos BLOBs
@s-05-ilap-vistas.sql

prompt creando tablas temporales
@s-05-ilap-tablas-temporales.sql

prompt creando objetos para manejo de BLOBs
@s-05-ilap-funciones-blob.sql

prompt creando vistas con soporte para BLOBs
@s-05-ilap-lsibdd_s2-vistas-blob.sql

prompt Listo!
disconnect
exit