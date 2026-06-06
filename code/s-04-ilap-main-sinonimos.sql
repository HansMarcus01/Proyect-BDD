--@Autor: Hansel Yael Tepal Briseno y Luis Daniel Salazar Islas
--@Fecha creacion: 27/05/2026
--@Descripcion: Creacion de sinonimos - main

clear screen
whenever sqlerror exit rollback;

prompt =====================================
prompt Creando sinonimos para htbbdd_s1
prompt =====================================
connect ilap_bdd/ilap_bdd@htbbdd_s1
@s-04-ilap-htbbdd_s1-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql

prompt =====================================
prompt Creando sinonimos para htbbdd_s2
prompt =====================================
connect ilap_bdd/ilap_bdd@htbbdd_s2
@s-04-ilap-htbbdd_s2-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql

prompt =====================================
prompt Creando sinonimos para lsibdd_s1
prompt =====================================
connect ilap_bdd/ilap_bdd@lsibdd_s1
@s-04-ilap-lsibdd_s1-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql

prompt =====================================
prompt Creando sinonimos para lsibdd_s2
prompt =====================================
connect ilap_bdd/ilap_bdd@lsibdd_s2
@s-04-ilap-lsibdd_s2-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql

prompt Listo!
