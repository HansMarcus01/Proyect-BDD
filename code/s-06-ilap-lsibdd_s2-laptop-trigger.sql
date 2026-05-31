--@Autor: Hansel Yael Tepal Briseño
--@Fecha creación: 24/05/2026
--@Descripción: Definición del trigger instead of para laptop

create or replace trigger t_dml_laptop
instead of insert or update or delete on laptop
for each row
begin
    case
        when inserting then
            -- insertar directamente la foto al ser local
            insert into laptop_f1(laptop_id, foto)
            values(:new.laptop_id, :new.foto);
            -- Insertar en el fragmento por rango de num_serie
            if substr(:new.num_serie, 1, 1) between '0' and '1' then
                insert into laptop_f2(
                    laptop_id, num_serie, cantidad_ram, caracteristicas_extras,
                    tipo_procesador_id, tipo_tarjeta_video_id, tipo_almacenamiento_id,
                    tipo_monitor_id, laptop_reemplazo_id
                ) values (
                    :new.laptop_id, :new.num_serie, :new.cantidad_ram, :new.caracteristicas_extras,
                    :new.tipo_procesador_id, :new.tipo_tarjeta_video_id, :new.tipo_almacenamiento_id,
                    :new.tipo_monitor_id, :new.laptop_reemplazo_id
                );
            elsif substr(:new.num_serie, 1, 1) between '2' and '3' then
                insert into laptop_f3(
                    laptop_id, num_serie, cantidad_ram, caracteristicas_extras,
                    tipo_procesador_id, tipo_tarjeta_video_id, tipo_almacenamiento_id,
                    tipo_monitor_id, laptop_reemplazo_id
                ) values (
                    :new.laptop_id, :new.num_serie, :new.cantidad_ram, :new.caracteristicas_extras,
                    :new.tipo_procesador_id, :new.tipo_tarjeta_video_id, :new.tipo_almacenamiento_id,
                    :new.tipo_monitor_id, :new.laptop_reemplazo_id
                );
            elsif substr(:new.num_serie, 1, 1) between '4' and '5' then
                insert into laptop_f4(
                    laptop_id, num_serie, cantidad_ram, caracteristicas_extras,
                    tipo_procesador_id, tipo_tarjeta_video_id, tipo_almacenamiento_id,
                    tipo_monitor_id, laptop_reemplazo_id
                ) values (
                    :new.laptop_id, :new.num_serie, :new.cantidad_ram, :new.caracteristicas_extras,
                    :new.tipo_procesador_id, :new.tipo_tarjeta_video_id, :new.tipo_almacenamiento_id,
                    :new.tipo_monitor_id, :new.laptop_reemplazo_id
                );
            elsif substr(:new.num_serie, 1, 1) between '6' and '9' then
                insert into laptop_f5(
                    laptop_id, num_serie, cantidad_ram, caracteristicas_extras,
                    tipo_procesador_id, tipo_tarjeta_video_id, tipo_almacenamiento_id,
                    tipo_monitor_id, laptop_reemplazo_id
                ) values (
                    :new.laptop_id, :new.num_serie, :new.cantidad_ram, :new.caracteristicas_extras,
                    :new.tipo_procesador_id, :new.tipo_tarjeta_video_id, :new.tipo_almacenamiento_id,
                    :new.tipo_monitor_id, :new.laptop_reemplazo_id
                );
            else
                raise_application_error(
                    -20020,
                    'El num_serie no cumple con el esquema de fragmentacion'
                );
            end if;
        when updating then
            raise_application_error(-20003, 'La operacion UPDATE no esta soportada');
        when deleting then
            delete from laptop_f1
            where laptop_id = :old.laptop_id;

            if substr(:old.num_serie, 1, 1) between '0' and '1' then
                delete from laptop_f2
                where laptop_id = :old.laptop_id;
            elsif substr(:old.num_serie, 1, 1) between '2' and '3' then
                delete from laptop_f3
                where laptop_id = :old.laptop_id;
            elsif substr(:old.num_serie, 1, 1) between '4' and '5' then
                delete from laptop_f4
                where laptop_id = :old.laptop_id;
            elsif substr(:old.num_serie, 1, 1) between '6' and '9' then
                delete from laptop_f5
                where laptop_id = :old.laptop_id;
            else
                raise_application_error(
                    -20010,
                    'El id: ' || :old.laptop_id || ' no cumple con el esquema de fragmentacion'
                );
            end if;
    end case;
end;
/
show errors
