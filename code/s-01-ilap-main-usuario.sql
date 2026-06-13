--@Autor: Hansel Yael Tepal Briseño y Luis Daniel Salazar Islas
--@Fecha creación: 26/05/2026
--@Descripción: Conexión a cada uno de los nodos para ejecutar el scrip de usuarios.

clear screen
whenever sqlerror exit rollback;
set serveroutput on

prompt Inciando la creación/eliminación de usuario ilap_bdd

prompt =====================================
prompt Creando usuario en htbbdd_s1
prompt =====================================
connect sys/&&syspass@htbbdd_s1 as sysdba
@s-01-ilap-usuario.sql

prompt =====================================
prompt Creando usuario en htbbdd_s2
prompt =====================================
connect sys/&&syspass@htbbdd_s2 as sysdba
@s-01-ilap-usuario.sql

prompt =====================================
prompt Creando usuario en lsibdd_s1
prompt =====================================
connect sys/&&syspass@lsibdd_s1 as sysdba
@s-01-ilap-usuario.sql

prompt =====================================
prompt Creando usuario en lsibdd_s2
prompt =====================================
connect sys/&&syspass@lsibdd_s2 as sysdba
@s-01-ilap-usuario.sql

prompt Ejecución Finalizada!
