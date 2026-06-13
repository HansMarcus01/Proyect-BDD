--@Autor: Hansel Yael Tepal Briseño y Luis Daniel Salazar Islas
--@Fecha creación: dd/mm/yyyy
--@Descripción: Creación de fragmentos en los 4 nodos

clear screen
whenever sqlerror exit rollback;


prompt =====================================
prompt Creando fragmentos en htbbdd_s1
prompt =====================================
connect ilap_bdd/ilap_bdd@htbbdd_s1
@s-03-ilap-htbbdd_s1-ddl.sql

prompt =====================================
prompt Creando fragmentos en htbbdd_s2
prompt =====================================
connect ilap_bdd/ilap_bdd@htbbdd_s2
@s-03-ilap-htbbdd_s2-ddl.sql

prompt =====================================
prompt Creando fragmentos en lsibdd_s1
prompt =====================================
connect ilap_bdd/ilap_bdd@lsibdd_s1
@s-03-ilap-lsibdd_s1-ddl.sql

prompt =====================================
prompt Creando fragmentos en lsibdd_s2
prompt =====================================
connect ilap_bdd/ilap_bdd@lsibdd_s2
@s-03-ilap-lsibdd_s2-ddl.sql

prompt Ejecución Finalizada!
