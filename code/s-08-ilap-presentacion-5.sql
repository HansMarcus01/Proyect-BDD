--@Autor: Hansel Yael Tepal Briseño y Luis Daniel Salazar Islas
--@Fecha creación: 31/05/2026
--@Descripción: Distribución de eliminación
prompt conectando a la base de datos
connect ilap_bdd/ilap_bdd@&pdb
prompt creando procedimiento para eliminar datos
create or replace procedure limpia_base
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Eliminando datos de historico_status_laptop');
    delete from historico_status_laptop;

    DBMS_OUTPUT.PUT_LINE('Eliminando datos de servicio_laptop');
    delete from servicio_laptop;

    DBMS_OUTPUT.PUT_LINE('Eliminando datos de laptop_inventario');
    delete from laptop_inventario;

    DBMS_OUTPUT.PUT_LINE('Eliminando datos de laptop');
    delete from laptop;

    DBMS_OUTPUT.PUT_LINE('Eliminando datos de sucursal_venta');
    delete from sucursal_venta;

    DBMS_OUTPUT.PUT_LINE('Eliminando datos de sucursal_taller');
    delete from sucursal_taller;

    DBMS_OUTPUT.PUT_LINE('Eliminando datos de sucursal');
    delete from sucursal;

    DBMS_OUTPUT.PUT_LINE('Eliminando datos de status_laptop');
    delete from status_laptop;

    DBMS_OUTPUT.PUT_LINE('Eliminando datos de tipo_monitor');
    delete from tipo_monitor;

    DBMS_OUTPUT.PUT_LINE('Eliminando datos de tipo_almacenamiento');
    delete from tipo_almacenamiento;

    DBMS_OUTPUT.PUT_LINE('Eliminando datos de tipo_tarjeta_video');
    delete from tipo_tarjeta_video;

    DBMS_OUTPUT.PUT_LINE('Eliminando datos de tipo_procesador');
    delete from tipo_procesador;

EXCEPTION
    WHEN OTHERS THEN
        raise;
END;
/
show errors

Prompt Seleccionar la PDB para realizar la eliminación de datos
set serveroutput on
Prompt Eliminando datos ...
declare
v_formato varchar2(50) := 'yyy-mm-dd hh24:mi:ss';
begin
dbms_output.put_line(to_char(sysdate,v_formato)
|| ' Eliminando datos de playlist');

limpia_base();
commit;
exception
when others then
dbms_output.put_line('Errores detectados al realizar la eliminación');
dbms_output.put_line('Se hara rollback');
dbms_output.put_line(dbms_utility.format_error_backtrace);
rollback;
raise;
end;
/
Prompt Listo!
exit