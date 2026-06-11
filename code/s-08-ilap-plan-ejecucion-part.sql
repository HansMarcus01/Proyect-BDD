--@Autor: Hansel Yael Tepal Briseno y Luis Daniel Salazar Islas
--@Fecha creacion: 27/05/2026
--@Descripcion: Planes de ejecución para validar partition pruning

prompt ======================================
prompt Validación de particiones por rango e intervalo en el sitio 1
prompt ======================================
connect ilap_bdd/ilap_bdd@htbbdd_s1
set linesize 200
col historico_status_laptop_id format a30
col fecha_status format a20

explain plan for
select historico_status_laptop_id, fecha_status
from historico_status_laptop_f2_htb_s1
where fecha_status = to_date('2010', 'YYYY');

select * from table(dbms_xplan.display);

prompt ======================================
prompt Validación de particiones por hash en el sitio 1
prompt ======================================
connect ilap_bdd/ilap_bdd@htbbdd_s1
set linesize 200
col laptop_id format a30

explain plan for
select laptop_id
from servicio_laptop_f1_htb_s1
where num_servicio = '1';

select * from table(dbms_xplan.display);
