--@Autor: Hansel Yael Tepal Briseño y Luis Daniel Salazar Islas
--@Fecha creación: 26/05/2026
--@Descripción: Eliminación y creación del usuario.

prompt Creando al usuario ilap_bdd
drop user if exists ilap_bdd cascade;
create user ilap_bdd identified by ilap_bdd quota unlimited on users;

prompt Otorgando cuota en tablespaces de fragmentos
declare
  cursor cur_ts is
    select tablespace_name
    from dba_tablespaces
    where contents = 'PERMANENT'
      and tablespace_name not in ('SYSTEM','SYSAUX','UNDOTBS1','TEMP','USERS');
begin
  for r in cur_ts loop
    execute immediate 'alter user ilap_bdd quota unlimited on ' || r.tablespace_name;
    dbms_output.put_line('  Cuota unlimited en ' || r.tablespace_name);
  end loop;
end;
/

prompt Otorgando cuota en SYSTEM (tablas catálogo existentes)
alter user ilap_bdd quota 100m on system;

prompt Otorgando privilegios al usuario ilap_bdd
grant create session, create table, create sequence, create procedure, create view,
    create synonym, create database link, create trigger to ilap_bdd;
grant create any directory to ilap_bdd;