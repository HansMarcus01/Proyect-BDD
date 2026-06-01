--@Autor: Hansel Yael Tepal Briseño y Luis Daniel Salazar Islas
--@Fecha creación: 31/05/2026
--@Descripción: Distribución de eliminación

CREATE [OR REPLACE ] PROCEDURE limpia_base ()     
IS
BEGIN
   Prompt Eliminando datos de historico_status_laptop
    delete from historico_status_laptop;
    Prompt Eliminando datos de servicio_laptop
    delete from servicio_laptop;
    Prompt Eliminando datos de laptop
    delete from laptop;
    Prompt Eliminando datos de laptop_inventario
    delete from laptop_inventario;
    Prompt Eliminando datos de sucursal_venta
    delete from sucursal_venta;
    Prompt Eliminando datos de sucursal_taller
    delete from sucursal_taller;
    Prompt Eliminando datos de sucursal
    delete from sucursal;
    Prompt Eliminando datos de status_laptop
    delete from status_laptop;
    Prompt Eliminando datos de tipo_monitor
    delete from tipo_monitor;
    Prompt Eliminando datos de tipo_almacenamiento
    delete from tipo_almacenamiento;
    Prompt Eliminando datos de tipo_tarjeta_video
    delete from tipo_tarjeta_video;
    Prompt Eliminando datos de tipo_procesador
    delete from tipo_procesador;

EXCEPTION
    
    raise;

END;
/

Prompt Seleccionar la PDB para realizar la eliminación de datos
connect netmax_bdd/ilap_bdd@&pdb
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