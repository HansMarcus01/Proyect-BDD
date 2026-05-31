--@Autor: Hansel Yael Tepal Briseño
--@Fecha creación: 24/05/2026
--@Descripción: Definición del trigger instead of para la vista servicio_laptop desde el
-- sitio htb_s1 (NO)

create or replace trigger t_dml_servicio_laptop
instead of insert or update or delete on servicio_laptop
declare
    v_count number;
begin
    case
        when inserting then
            select count(*) into v_count
            from sucursal_taller_f1
            where sucursal_id = :new.sucursal_id;
            if v_count > 0 then
                insert into servicio_laptop_f1 (laptop_id, num_servicio,
                    importe, diagnostico, factura, sucursal_id)
                values (:new.laptop_id, :new.num_servicio, :new.importe,
                    :new.diagnostico, :new.factura, :new.sucursal_id);
            else
                select count(*) into v_count
                from sucursal_taller_f2
                where sucursal_id = :new.sucursal_id;
                if v_count > 0 then
                    -- insertando en la tabla temporal
                    insert into ti_servicio_laptop_f2 (laptop_id, num_servicio, importe,
                        diagnostico, factura, sucursal_id)
                    values (:new.laptop_id, :new.num_servicio, :new.importe,
                        :new.diagnostico, :new.factura, :new.sucursal_id);
                    -- insertando en el sitio remoto a traves de la temporal
                    insert into servicio_laptop_f2
                        select *
                        from ti_servicio_laptop_f2
                        where laptop_id = :new.laptop_id
                        and num_servicio = :new.num_servicio;
                    -- eliminando de la tabla temporal
                    delete from ti_servicio_laptop_f2
                    where laptop_id = :new.laptop_id
                    and num_servicio = :new.num_servicio;
                else
                    select count(*) into v_count
                    from sucursal_taller_f3
                    where sucursal_id = :new.sucursal_id;
                    if v_count > 0 then
                        -- insertando en la tabla temporal
                        insert into ti_servicio_laptop_f3 (laptop_id, num_servicio, importe,
                            diagnostico, factura, sucursal_id)
                        values (:new.laptop_id, :new.num_servicio, :new.importe,
                            :new.diagnostico, :new.factura, :new.sucursal_id);
                        -- insertando en el sitio remoto a traves de la temporal
                        insert into servicio_laptop_f3
                            select *
                            from ti_servicio_laptop_f3
                            where laptop_id = :new.laptop_id
                            and num_servicio = :new.num_servicio;
                        -- eliminando de la tabla temporal
                        delete from ti_servicio_laptop_f3
                        where laptop_id = :new.laptop_id
                        and num_servicio = :new.num_servicio;
                    else
                        select count(*) into v_count
                        from sucursal_taller_f4
                        where sucursal_id = :new.sucursal_id;
                        if v_count > 0 then
                            -- insertando en la tabla temporal
                            insert into ti_servicio_laptop_f4 (laptop_id, num_servicio, importe,
                                diagnostico, factura, sucursal_id)
                            values (:new.laptop_id, :new.num_servicio, :new.importe,
                                :new.diagnostico, :new.factura, :new.sucursal_id);
                            -- insertando en el sitio remoto a traves de la temporal
                            insert into servicio_laptop_f4
                                select *
                                from ti_servicio_laptop_f4
                                where laptop_id = :new.laptop_id
                                and num_servicio = :new.num_servicio;
                            -- eliminando de la tabla temporal
                            delete from ti_servicio_laptop_f4
                            where laptop_id = :new.laptop_id
                            and num_servicio = :new.num_servicio;
                        else
                            raise_application_error(-20020, 'La sucursal taller con ID '
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
            from sucursal_taller_f1
            where sucursal_id = :old.sucursal_id;
            if v_count > 0 then
                delete from servicio_laptop_f1
                where laptop_id = :old.laptop_id
                and num_servicio = :old.num_servicio;
            else
                select count(*) into v_count
                from sucursal_taller_f2
                where sucursal_id = :old.sucursal_id;
                if v_count > 0 then
                    delete from servicio_laptop_f2
                    where laptop_id = :old.laptop_id
                    and num_servicio = :old.num_servicio;
                else
                    select count(*) into v_count
                    from sucursal_taller_f3
                    where sucursal_id = :old.sucursal_id;
                    if v_count > 0 then
                        delete from servicio_laptop_f3
                        where laptop_id = :old.laptop_id
                        and num_servicio = :old.num_servicio;
                    else
                        select count(*) into v_count
                        from sucursal_taller_f4
                        where sucursal_id = :old.sucursal_id;
                        if v_count > 0 then
                            delete from servicio_laptop_f4
                            where laptop_id = :old.laptop_id
                            and num_servicio = :old.num_servicio;
                        else
                            raise_application_error(-20020, 'La sucursal taller con ID '
                                || :old.sucursal_id || ' no existe en ningún sitio');
                        end if;
                    end if;
                end if;
            end if;
    end case;
end;
/
show errors