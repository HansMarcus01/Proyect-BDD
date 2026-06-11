--@Autor: Hansel Yael Tepal Briseno y Luis Daniel Salazar Islas
--@Fecha creacion: 27/05/2026
--@Descripcion: Script de validacion para verificar la correcta creacion de las particiones por rango e intervalo en el sitio 1


connect ilap_bdd/ilap_bdd@htbbdd_s1

set serveroutput on
prompt ======================================
prompt Validando la correcta creacion de las particiones por rango e intervalo de la tabla historial_status_laptop en el sitio 1
prompt ======================================
declare
    v_min_date date;
    v_max_date date;
    v_query varchar2(500);
    v_count number;
    v_estado   varchar2(20);
    v_total number := 0;
begin
    dbms_output.put_line(RPAD('-', 75, '-'));
    dbms_output.put_line(
        RPAD('PARTICIÓN', 15) || ' | ' ||
        RPAD('FECHA MIN', 12) || ' | ' ||
        RPAD('FECHA MAX', 12) || ' | ' ||
        LPAD('REGISTROS', 10) || ' | ' ||
        'ESTADO'
    );
    dbms_output.put_line(RPAD('-', 75, '-'));

    for i in (
        select partition_name
        from user_tab_partitions
        where table_name = 'HISTORICO_STATUS_LAPTOP_F2_HTB_S1'
        order by partition_position
    ) loop
        v_query := 'select min(fecha_status), max(fecha_status), count(*) from  HISTORICO_STATUS_LAPTOP_F2_HTB_S1'
            || ' partition ('
            || i.partition_name
            || ')';

        execute immediate v_query into v_min_date, v_max_date, v_count;

        if v_count > 0 then
            if to_char(v_min_date, 'YYYY') = to_char(v_max_date, 'YYYY') then
                v_estado := '[OK] CORRECTA';
            else
                v_estado := '[X] ERROR';
            end if;

            dbms_output.put_line(
                RPAD(i.partition_name, 15) || ' | ' ||
                RPAD(to_char(v_min_date, 'YYYY-MM-DD'), 12) || ' | ' ||
                RPAD(to_char(v_max_date, 'YYYY-MM-DD'), 12) || ' | ' ||
                LPAD(to_char(v_count), 10) || ' | ' ||
                v_estado
            );
        else
            dbms_output.put_line(
                RPAD(i.partition_name, 15) || ' | ' ||
                RPAD('N/A', 12) || ' | ' ||
                RPAD('N/A', 12) || ' | ' ||
                LPAD('0', 10) || ' | ' ||
                '[-] VACÍA'
            );
        end if;
            v_total := v_total + v_count;
    end loop;
    dbms_output.put_line(RPAD('-', 75, '-'));
    dbms_output.put_line('Total de registros en la tabla particionada: ' || to_char(v_total));
end;
/

exit;