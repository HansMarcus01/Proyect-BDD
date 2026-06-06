--@Autor: Hansel Yael Tepal Briseño y Luis Daniel Salazar Islas
--@Fecha creación: 26/05/2026
--@Descripción: Creación de ligas en los 4 nodos.

clear screen
whenever sqlerror exit rollback;

prompt =====================================
prompt Creando ligas en htbbdd_s1
prompt =====================================
connect ilap_bdd/ilap_bdd@htbbdd_s1
-- PDB Local
create database link htbbdd_s2.fi.unam using 'HTBBDD_S2';
-- PDBS Remotas
create database link lsibdd_s1.fi.unam using 'LSIBDD_S1';
create database link lsibdd_s2.fi.unam using 'LSIBDD_S2';

prompt =====================================
prompt Creando ligas en htbbdd_s2
prompt =====================================
connect ilap_bdd/ilap_bdd@htbbdd_s2
-- PDB Local
create database link htbbdd_s1.fi.unam using 'HTBBDD_S1';
-- PDBS Remotas
create database link lsibdd_s1.fi.unam using 'LSIBDD_S1';
create database link lsibdd_s2.fi.unam using 'LSIBDD_S2';

prompt =====================================
prompt Creando ligas en lsibdd_s1
prompt =====================================
connect ilap_bdd/ilap_bdd@lsibdd_s1
-- PDB Local
create database link lsibdd_s2.fi.unam using 'LSIBDD_S2';
-- PDBS Remotas
create database link htbbdd_s1.fi.unam using 'HTBBDD_S1';
create database link htbbdd_s2.fi.unam using 'HTBBDD_S2';

prompt =====================================
prompt Creando ligas en lsibdd_s2
prompt =====================================
connect ilap_bdd/ilap_bdd@lsibdd_s2
-- PDB Local
create database link lsibdd_s1.fi.unam using 'LSIBDD_S1';
-- PDBS Remotas
create database link htbbdd_s1.fi.unam using 'HTBBDD_S1';
create database link htbbdd_s2.fi.unam using 'HTBBDD_S2';

prompt Ejecución Finalizada!
