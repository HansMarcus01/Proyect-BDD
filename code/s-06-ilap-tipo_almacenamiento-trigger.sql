--@Autor: Hansel Yael Tepal Briseño y Luis Daniel Salazar Islas
--@Fecha creación: 31/05/2026
--@Descripción: Definición del trigger instead of para la tabla replicada tipo_almacenamiento

create or replace trigger t_dml_tipo_almacenamiento
instead of insert or update or delete on tipo_almacenamiento
declare
    v_count number;
begin
    case
        when inserting then
            v_count := 0;
            -- replica local
            insert into tipo_almacenamiento_r1 (tipo_almacenamiento_id, clave, descripcion)
            values (:new.tipo_almacenamiento_id, :new.clave, :new.descripcion);
            v_count := v_count + sql%rowcount;
            -- replica 2
            insert into tipo_almacenamiento_r2 (tipo_almacenamiento_id, clave, descripcion)
            values (:new.tipo_almacenamiento_id, :new.clave, :new.descripcion);
            v_count := v_count + sql%rowcount;
            --replica 3
            insert into tipo_almacenamiento_r3 (tipo_almacenamiento_id, clave, descripcion)
            values (:new.tipo_almacenamiento_id, :new.clave, :new.descripcion);
            v_count := v_count + sql%rowcount;
            -- replica 4
            insert into tipo_almacenamiento_r4 (tipo_almacenamiento_id, clave, descripcion)
            values (:new.tipo_almacenamiento_id, :new.clave, :new.descripcion);
            v_count := v_count + sql%rowcount;

            if v_count <> 4 then
                raise_application_error(-20040,
                    'Fallo en la inserción del nuevo registro en las replicas: '
                    || v_count || ' se esperaban insertar 4 registros.');
            end if;
        when updating then
            v_count := 0;
            -- replica local
            update tipo_almacenamiento_r1
            set clave = :new.clave, descripcion = :new.descripcion
            where tipo_almacenamiento_id = :old.tipo_almacenamiento_id;
            v_count := v_count + sql%rowcount;
            -- replica 2
            update tipo_almacenamiento_r2
            set clave = :new.clave, descripcion = :new.descripcion
            where tipo_almacenamiento_id = :old.tipo_almacenamiento_id;
            v_count := v_count + sql%rowcount;
            --replica 3
            update tipo_almacenamiento_r3
            set clave = :new.clave, descripcion = :new.descripcion
            where tipo_almacenamiento_id = :old.tipo_almacenamiento_id;
            v_count := v_count + sql%rowcount;
            -- replica 4
            update tipo_almacenamiento_r4
            set clave = :new.clave, descripcion = :new.descripcion
            where tipo_almacenamiento_id = :old.tipo_almacenamiento_id;
            v_count := v_count + sql%rowcount;

            if v_count <> 4 then
                raise_application_error(-20040,
                    'Fallo en la actualización del registro en las replicas: '
                    || v_count || ' se esperaban actualizar 4 registros.');
            end if;
        when deleting then
            v_count := 0;
            -- replica local
            delete from tipo_almacenamiento_r1
            where tipo_almacenamiento_id = :old.tipo_almacenamiento_id;
            v_count := v_count + sql%rowcount;
            -- replica 2
            delete from tipo_almacenamiento_r2
            where tipo_almacenamiento_id = :old.tipo_almacenamiento_id;
            v_count := v_count + sql%rowcount;
            --replica 3
            delete from tipo_almacenamiento_r3
            where tipo_almacenamiento_id = :old.tipo_almacenamiento_id;
            v_count := v_count + sql%rowcount;
            -- replica 4
            delete from tipo_almacenamiento_r4
            where tipo_almacenamiento_id = :old.tipo_almacenamiento_id;
            v_count := v_count + sql%rowcount;

            if v_count <> 4 then
                raise_application_error(-20040,
                    'Fallo en la eliminación del registro en las replicas: '
                    || v_count || ' se esperaban eliminar 4 registros.');
            end if;
    end case;
end;
/
show errors