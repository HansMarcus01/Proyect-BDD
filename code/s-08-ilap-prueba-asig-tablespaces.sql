--@Autor: Hansel Yael Tepal Briseno y Luis Daniel Salazar Islas
--@Fecha creacion: 27/05/2026
--@Descripcion: Script de validacion para verificar la correcta creacion de las particiones y asignacion de tablespaces en cada sitio

set linesize 200
col table_name format a35
col partition_name format a30
col tablespace_name format a35
col high_value format a30

prompt validando la existencia de las particiones en el sitio 1
connect ilap_bdd/ilap_bdd@htbbdd_s1

select table_name, partition_name, tablespace_name, high_value
from user_tab_partitions;

prompt validando la existencia de las particiones en el sitio 2
connect ilap_bdd/ilap_bdd@htbbdd_s2
select table_name, partition_name, tablespace_name
from user_tab_partitions;

prompt validando la existencia de las particiones en el sitio 3
connect ilap_bdd/ilap_bdd@lsibdd_s1
select table_name, partition_name, tablespace_name
from user_tab_partitions;

prompt validando la existencia de las particiones en el sitio 4
connect ilap_bdd/ilap_bdd@lsibdd_s2
select table_name, partition_name, tablespace_name
from user_tab_partitions;

exit;
