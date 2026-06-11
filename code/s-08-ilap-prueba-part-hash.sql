--@Autor: Hansel Yael Tepal Briseno y Luis Daniel Salazar Islas
--@Fecha creacion: 27/05/2026
--@Descripcion: Script de validacion para verificar la simetria del particionamiento por hash en la tabla servicio_laptop

Prompt =>Seleccionar la PDB para insertar datos

connect ilap_bdd/ilap_bdd@&pdb

set serveroutput on

prompt ======================================
prompt Validando la simetria del particionamiento por hash en la tabla servicio_laptop
prompt ======================================
declare
    v_count number;
    v_total number := 0;
    v_query varchar2(500);
begin
    for i in (
        select table_name, partition_name
        from user_tab_partitions
        where table_name LIKE 'SERVICIO_LAPTOP%'
    ) loop
        v_query := 'select count(*) from ' || i.table_name || ' partition (' || i.partition_name || ')';
        execute immediate v_query into v_count;

        dbms_output.put_line('La tabla ' || i.table_name
            || ' en la particion'
            || i.partition_name
            || ' tiene '
            || v_count
            || ' registros.');
        v_total := v_total + v_count;
    end loop;
    dbms_output.put_line('Total de registros en la tabla particionada: ' || v_total);
end;
/

exit;