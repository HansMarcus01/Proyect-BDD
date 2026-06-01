--@Autor: Hansel Yael Tepal Briseño y Luis Daniel Salazar Islas
--@Fecha creación: 31/05/2026
--@Descripción: Archivo de carga de datos en status laptop


clear screen
whenever sqlerror exit rollback;
--Para visualizar export NLS_LANG=SPANISH_SPAIN.WE8ISO8859P1
Prompt ======================================
Prompt Cargando catálogos de forma manual en htbbdd_s1
Prompt ======================================
connect ilap_bdd/ilap_bdd@htbbdd_s1
delete from status_laptop;

@carga-inicial/status_laptop.sql
commit;
Prompt ======================================
Prompt Cargando catálogos de forma manual en htbbdd_s2
Prompt ======================================
connect ilap_bdd/ilap_bdd@htbbdd_s2
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;
Prompt ======================================
Prompt Cargando catálogos de forma manual en lsibdd_s1
Prompt ======================================
connect ilap_bdd/ilap_bdd@lsibdd_s1
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;
Prompt ======================================
Prompt Cargando catálogos de forma manual en lsibdd_s2
Prompt ======================================
connect ilap_bdd/ilap_bdd@lsibdd_s2
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;
Prompt Listo!
exit