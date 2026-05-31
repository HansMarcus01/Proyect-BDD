--@Autor: Hansel Yael Tepal Briseño
--@Fecha creación: 24/05/2026
--@Descripción: Definición del trigger instead of para la vista sucursal_taller desde la pdb LSI_S1 (WS)

create or replace trigger t_dml_sucursal_taller
instead of insert or update or delete on sucursal_taller
declare
    v_count number;
begin
    case
        when inserting then
            select count(*) into v_count
            from sucursal_f3
            where sucursal_id = :new.sucursal_id;
            if v_count > 0 then
                insert into sucursal_taller_f3 (sucursal_id, dia_descanso, telefono_atencion)
                values (:new.sucursal_id, :new.dia_descanso, :new.telefono_atencion);
            else
                select count(*) into v_count
                from sucursal_f2
                where sucursal_id = :new.sucursal_id;
                if v_count > 0 then
                    insert into sucursal_taller_f2 (sucursal_id, dia_descanso, telefono_atencion)
                    values (:new.sucursal_id, :new.dia_descanso, :new.telefono_atencion);
                else
                    select count(*) into v_count
                    from sucursal_f1
                    where sucursal_id = :new.sucursal_id;
                    if v_count > 0 then
                        insert into sucursal_taller_f1 (sucursal_id, dia_descanso, telefono_atencion)
                        values (:new.sucursal_id, :new.dia_descanso, :new.telefono_atencion);
                    else
                        select count(*) into v_count
                        from sucursal_f4
                        where sucursal_id = :new.sucursal_id;
                        if v_count > 0 then
                            insert into sucursal_taller_f4 (sucursal_id, dia_descanso, telefono_atencion)
                            values (:new.sucursal_id, :new.dia_descanso, :new.telefono_atencion);
                        else
                            raise_application_error(-20020, 'La sucursal con ID '
                            || :new.sucursal_id || ' no existe en ningún sitio');
                        end if;
                    end if;
                end if;
            end if;
        when updating then
            raise_application_error(-20030,
                'la operación update aun no esta soportada');
        when deleting then
            select count(*) into v_count
            from sucursal_f3
            where sucursal_id = :old.sucursal_id;
            if v_count > 0 then
                delete from sucursal_taller_f3 where sucursal_id = :old.sucursal_id;
            else
                select count(*) into v_count
                from sucursal_f2
                where sucursal_id = :old.sucursal_id;
                if v_count > 0 then
                    delete from sucursal_taller_f2 where sucursal_id = :old.sucursal_id;
                else
                    select count(*) into v_count
                    from sucursal_f1
                    where sucursal_id = :old.sucursal_id;
                    if v_count > 0 then
                        delete from sucursal_taller_f1 where sucursal_id = :old.sucursal_id;
                    else
                        select count(*) into v_count
                        from sucursal_f4
                        where sucursal_id = :old.sucursal_id;
                        if v_count > 0 then
                            delete from sucursal_taller_f4 where sucursal_id = :old.sucursal_id;
                        else
                            raise_application_error(-20020, 'La sucursal con ID '
                            || :old.sucursal_id || ' no existe en ningún sitio');
                        end if;
                    end if;
                end if;
            end if;
    end case;
end;
/
show errors