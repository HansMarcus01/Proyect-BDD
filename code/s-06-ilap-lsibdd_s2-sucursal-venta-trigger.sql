--@Autor: Hansel Yael Tepal Briseño
--@Fecha creación: 24/05/2026
--@Descripción: Definición del trigger instead of para la vista sucursal venta
create or replace trigger t_dml_sucursal_venta
instead of insert or update or delete on sucursal_venta
declare
    v_count_number number;
begin
case
    when inserting then
        select count(*) into v_count_number
        from sucursal_f4
        where sucursal_id=:new.sucursal_id;
        if v_count_number>0
        THEN
            insert into sucursal_venta_f4(sucursal_id,hora_apertura,hora_cierre)
            VALUES(:new.sucursal_id,:new.hora_apertura,:new.hora_cierre);
        ELSE
            select count(*) into v_count_number
            from sucursal_f2
            where sucursal_id=:new.sucursal_id;
            if v_count_number>0
            THEN
                insert into sucursal_venta_f2(sucursal_id,hora_apertura,hora_cierre)
                VALUES(:new.sucursal_id,:new.hora_apertura,:new.hora_cierre);
            ELSE
                select count(*) into v_count_number
                from sucursal_f1
                where sucursal_id=:new.sucursal_id;
                if v_count_number>0 
                THEN
                    insert into sucursal_venta_f1(sucursal_id,hora_apertura,hora_cierre)
                    VALUES(:new.sucursal_id,:new.hora_apertura,:new.hora_cierre);
                ELSE
                    select count(*) into v_count_number
                    from sucursal_f1
                    where sucursal_id=:new.sucursal_id;
                    if v_count_number>0 
                    THEN
                        insert into sucursal_venta_f1(sucursal_id,hora_apertura,hora_cierre)
                        VALUES(:new.sucursal_id,:new.hora_apertura,:new.hora_cierre);
                    ELSE
                            raise_application_error(-20020, 'La sucursal con ID '
                            || :new.sucursal_id || ' no existe en ningún sitio');
                    END IF;
                END IF;
            END IF;
        END IF;
    when updating then
        raise_application_error(-20003, 'No esta definida la operación de actualización');
    when deleting then
        select count(*) into v_count_number
        from sucursal_f4
        where sucursal_id=:old.sucursal_id;
        if v_count_number>0
        THEN
            delete from sucursal_venta_f4
            where old:sucursal_id=sucursal_id;

        ELSE
            select count(*) into v_count_number
            from sucursal_f2
            where sucursal_id=:old.sucursal_id;
            if v_count_number>0
            THEN
                delete from sucursal_venta_f2
                where old:sucursal_id=sucursal_id;
            ELSE
                select count(*) into v_count_number
                from sucursal_f1
                where sucursal_id=:old.sucursal_id;
                if v_count_number>0 
                THEN
                    delete from sucursal_venta_f1
                    where old:sucursal_id=sucursal_id;
                ELSE
                    select count(*) into v_count_number
                    from sucursal_f1
                    where sucursal_id=:old.sucursal_id;
                    if v_count_number>0 
                    THEN
                         delete from sucursal_venta_f1
                        where old:sucursal_id=sucursal_id;
                    ELSE
                        raise_application_error(-20020,
                        'La sucursal id no se encontro en ningún nodo');
                    END IF;
                END IF;
            END IF;
        END IF;

end case;
end;
/
show errors

