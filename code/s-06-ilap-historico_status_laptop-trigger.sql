--@Autor: Hansel Yael Tepal Briseño
--@Fecha creación: 24/05/2026
--@Descripción: Definición del trigger instead of para la vista historico_status_laptop

create or replace trigger t_dml_historico_status_laptop
instead of insert or update or delete on historico_status_laptop
begin
    case
        when inserting then
            if :new.fecha_status < to_date('01-01-2010','dd-mm-yyyy') then
                insert into historico_status_laptop_f1 (historico_status_laptop_id,
                    fecha_status, laptop_id, status_laptop_id)
                values (:new.historico_status_laptop_id, :new.fecha_status,
                    :new.laptop_id, :new.status_laptop_id);
            elsif :new.fecha_status >= to_date('01-01-2010','dd-mm-yyyy') then
                insert into historico_status_laptop_f2 (historico_status_laptop_id,
                    fecha_status, laptop_id, status_laptop_id)
                values (:new.historico_status_laptop_id, :new.fecha_status,
                    :new.laptop_id, :new.status_laptop_id);
            else
                raise_application_error(-20010,
                    'El registro con fecha_status '
                    || to_char(:new.fecha_status,'dd-mm-yyyy')
                    || ' no cumple con las fechas permitidas para los fragmentos.');
            end if;
        when updating then
            raise_application_error(-20030,
                'la operación update aun no esta soportada');
        when deleting then
            if :old.fecha_status < to_date('01-01-2010','dd-mm-yyyy') then
                delete from historico_status_laptop_f1
                where historico_status_laptop_id = :old.historico_status_laptop_id;
            elsif :old.fecha_status >= to_date('01-01-2010','dd-mm-yyyy') then
                delete from historico_status_laptop_f2
                where historico_status_laptop_id = :old.historico_status_laptop_id;
            else
                raise_application_error(-20010,
                    'El registro con fecha_status '
                    || to_char(:old.fecha_status,'dd-mm-yyyy')
                    || 'que se desea eliminar no cumple con las fechas permitidas
                        para los fragmentos.');
            end if;
    end case;
end;
/
show errors