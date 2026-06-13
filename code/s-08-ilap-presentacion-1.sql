--@Autor: Hansel Yael Tepal Briseño y Luis Daniel Salazar Islas
--@Fecha creación: 31/05/2026
--@Descripción: Archivo de ejecución de todos los scripts

clear screen
whenever sqlerror exit rollback;
Prompt Iniciando con la creación de la BDD.

accept syspass char prompt 'Proporcione la contaseña del usuario SYS: ' hide

@s-01-ilap-main-usuario.sql
@s-02-ilap-ligas.sql
@s-03-ilap-main-ddl.sql
@s-04-ilap-main-sinonimos.sql
@s-05-ilap-main-vistas.sql
@s-06-ilap-main-triggers.sql
@s-07-ilap-main-soporte-blobs.sql
Prompt Listo !
exit