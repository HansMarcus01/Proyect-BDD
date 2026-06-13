--@Autor: Hansel Yael Tepal Briseño y Luis Daniel Salazar Islas
--@Fecha creación: 26/05/2026
--@Descripción: Creando los tables spaces para las particiones existentes en la base de datos

whenever sqlerror exit rollback;
set serveroutput on


connect sys/&&syspass@htbbdd_s1 as sysdba
prompt limpiando los tablespaces existentes en htbbdd_s1
declare
    cursor cur_tablespaces is
        select tablespace_name from dba_tablespaces
        where tablespace_name in (
            'TS_HIST_STATUS_F2_HTB_S1_1', 'TS_HIST_STATUS_F2_HTB_S1_2',
            'TS_SERV_LAPTOP_F1_HTB_S1_1', 'TS_SERV_LAPTOP_F1_HTB_S1_2'
        );
begin
    for r in cur_tablespaces loop
        execute immediate 'drop tablespace ' || r.tablespace_name || ' including contents and datafiles';
        dbms_output.put_line('Tablespace ' || r.tablespace_name || ' eliminado.');
    end loop;
end;
/

prompt creando los tablespaces para las particiones de la tabla historico_status_laptop
create tablespace ts_hist_status_F2_HTB_S1_1 datafile
    '/opt/oracle/oradata/FREE/htbbdd_s1/ts_hist_status_F2_HTB_S1_1.dbf'
    size 10m autoextend on next 10m maxsize unlimited;
create tablespace ts_hist_status_F2_HTB_S1_2 datafile
    '/opt/oracle/oradata/FREE/htbbdd_s1/ts_hist_status_F2_HTB_S1_2.dbf'
    size 10m autoextend on next 10m maxsize unlimited;

prompt creando los tablespaces para las particiones de la tabla servicio_laptop
create tablespace ts_serv_laptop_F1_HTB_S1_1 datafile
    '/opt/oracle/oradata/FREE/htbbdd_s1/ts_serv_laptop_F1_HTB_S1_1.dbf'
    size 10m autoextend on next 10m maxsize unlimited;
create tablespace ts_serv_laptop_F1_HTB_S1_2 datafile
    '/opt/oracle/oradata/FREE/htbbdd_s1/ts_serv_laptop_F1_HTB_S1_2.dbf'
    size 10m autoextend on next 10m maxsize unlimited;

alter user ilap_bdd quota unlimited on ts_hist_status_F2_HTB_S1_1;
alter user ilap_bdd quota unlimited on ts_hist_status_F2_HTB_S1_2;
alter user ilap_bdd quota unlimited on ts_serv_laptop_F1_HTB_S1_1;
alter user ilap_bdd quota unlimited on ts_serv_laptop_F1_HTB_S1_2;

connect sys/&&syspass@htbbdd_s2 as sysdba
prompt limpiando los tablespaces existentes en htbbdd_s2

declare
    cursor cur_tablespaces is
        select tablespace_name from dba_tablespaces
        where tablespace_name in (
            'TS_SERV_LAPTOP_F2_HTB_S2_1', 'TS_SERV_LAPTOP_F2_HTB_S2_2'
        );
begin
    for r in cur_tablespaces loop
        execute immediate 'drop tablespace ' || r.tablespace_name || ' including contents and datafiles';
        dbms_output.put_line('Tablespace ' || r.tablespace_name || ' eliminado.');
    end loop;
end;
/

prompt creando los tablespaces para las particiones de la tabla servicio_laptop
create tablespace ts_serv_laptop_F2_HTB_S2_1 datafile
    '/opt/oracle/oradata/FREE/htbbdd_s2/ts_serv_laptop_F2_HTB_S2_1.dbf'
    size 10m autoextend on next 10m maxsize unlimited;
create tablespace ts_serv_laptop_F2_HTB_S2_2 datafile
    '/opt/oracle/oradata/FREE/htbbdd_s2/ts_serv_laptop_F2_HTB_S2_2.dbf'
    size 10m autoextend on next 10m maxsize unlimited;

alter user ilap_bdd quota unlimited on ts_serv_laptop_F2_HTB_S2_1;
alter user ilap_bdd quota unlimited on ts_serv_laptop_F2_HTB_S2_2;

connect sys/&&syspass@lsibdd_s1 as sysdba
prompt limpiando los tablespaces existentes en lsibdd_s1
declare
    cursor cur_tablespaces is
        select tablespace_name from dba_tablespaces
        where tablespace_name in (
            'TS_SERV_LAPTOP_F3_LSI_S1_1', 'TS_SERV_LAPTOP_F3_LSI_S1_2'
        );
begin
    for r in cur_tablespaces loop
        execute immediate 'drop tablespace ' || r.tablespace_name || ' including contents and datafiles';
        dbms_output.put_line('Tablespace ' || r.tablespace_name || ' eliminado.');
    end loop;
end;
/

prompt creando los tablespaces para las particiones de la tabla servicio_laptop
create tablespace ts_serv_laptop_F3_LSI_S1_1 datafile
    '/opt/oracle/oradata/FREE/lsibdd_s1/ts_serv_laptop_F3_LSI_S1_1.dbf'
    size 10m autoextend on next 10m maxsize unlimited;
create tablespace ts_serv_laptop_F3_LSI_S1_2 datafile
    '/opt/oracle/oradata/FREE/lsibdd_s1/ts_serv_laptop_F3_LSI_S1_2.dbf'
    size 10m autoextend on next 10m maxsize unlimited;

alter user ilap_bdd quota unlimited on ts_serv_laptop_F3_LSI_S1_1;
alter user ilap_bdd quota unlimited on ts_serv_laptop_F3_LSI_S1_2;

connect sys/&&syspass@lsibdd_s2 as sysdba
prompt limpiando los tablespaces existentes en lsibdd_s2
declare
    cursor cur_tablespaces is
        select tablespace_name from dba_tablespaces
        where tablespace_name in (
            'TS_SERV_LAPTOP_F4_LSI_S2_1', 'TS_SERV_LAPTOP_F4_LSI_S2_2'
        );
begin
    for r in cur_tablespaces loop
        execute immediate 'drop tablespace ' || r.tablespace_name || ' including contents and datafiles';
        dbms_output.put_line('Tablespace ' || r.tablespace_name || ' eliminado.');
    end loop;
end;
/

prompt creando los tablespaces para las particiones de la tabla servicio_laptop
create tablespace ts_serv_laptop_F4_LSI_S2_1 datafile
    '/opt/oracle/oradata/FREE/lsibdd_s2/ts_serv_laptop_F4_LSI_S2_1.dbf'
    size 10m autoextend on next 10m maxsize unlimited;
create tablespace ts_serv_laptop_F4_LSI_S2_2 datafile
    '/opt/oracle/oradata/FREE/lsibdd_s2/ts_serv_laptop_F4_LSI_S2_2.dbf'
    size 10m autoextend on next 10m maxsize unlimited;

alter user ilap_bdd quota unlimited on ts_serv_laptop_F4_LSI_S2_1;
alter user ilap_bdd quota unlimited on ts_serv_laptop_F4_LSI_S2_2;
