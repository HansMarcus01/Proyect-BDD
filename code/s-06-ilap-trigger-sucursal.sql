--@Autor: Hansel Yael Tepal Briseño
--@Fecha creación: 24/05/2026
--@Descripción: Definición del trigger instead of para la vista sucursal

create or replace trigger t_dml_sucursal
instead of insert or update or delete on sucursal
begin
    case
        when inserting then
            if (:new.es_venta and :new.es_taller) or substr(:new.clave,3,2) = 'NO' then
                    insert into sucursal_f1 (sucursal_id, es_taller,
                        es_venta, latitud, longitud, url, nombre, clave)
                    values (sucursal_F1_HTB_S1_seq.nextval, :new.es_taller, :new.es_venta,
                        :new.latitud, :new.longitud, :new.url, :new.nombre, :new.clave);
                elsif (:new.es_venta or :new.es_taller) then
                    if substr(:new.clave,3,2) = 'EA' then
                        insert into sucursal_f2 (sucursal_id, es_taller,
                            es_venta, latitud, longitud, url, nombre, clave)
                        values (sucursal_F2_HTB_S2_seq.nextval, :new.es_taller, :new.es_venta,
                            :new.latitud, :new.longitud, :new.url, :new.nombre, :new.clave);
                    elsif substr(:new.clave,3,2) = 'WS' then
                        insert into sucursal_f3 (sucursal_id, es_taller,
                            es_venta, latitud, longitud, url, nombre, clave)
                        values (sucursal_F3_HTB_S3_seq.nextval, :new.es_taller, :new.es_venta,
                            :new.latitud, :new.longitud, :new.url, :new.nombre, :new.clave);
                    elsif substr(:new.clave,3,2) = 'SO' then
                        insert into sucursal_f4 (sucursal_id, es_taller,
                            es_venta, latitud, longitud, url, nombre, clave)
                        values (sucursal_F4_HTB_S4_seq.nextval, :new.es_taller, :new.es_venta,
                            :new.latitud, :new.longitud, :new.url, :new.nombre, :new.clave);
                    else
                        raise_application_error(-20010,
                            'El registro con clave '
                            || :new.clave
                            || ' no cumple con las regiones permitidas (NO, EA, WS, SO).');
                    end if;
                else
                    raise_application_error(-20010,
                        'El registro con clave '
                        || :new.clave
                        || ' no cumple con los valores permitidos'
                        || ' para los campos es_taller y es_venta.');
                end if;
        when updating then
            raise_application_error(-20030,
                'la operación update aun no esta suportada');
        when deleting then
            if substr(:old.clave,3,2) = 'NO' or  (:old.es_venta and :old.es_taller)
                delete from sucursal_f1 where sucursal_id = :old.sucursal_id;
            elsif substr(:old.clave,3,2) = 'EA' then
                delete from sucursal_f2 where sucursal_id = :old.sucursal_id;
            elsif substr(:old.clave,3,2) = 'WS' then
                delete from sucursal_f3 where sucursal_id = :old.sucursal_id;
            elsif substr(:old.clave,3,2) = 'SO' then
                delete from sucursal_f4 where sucursal_id = :old.sucursal_id;
            else
                raise_application_error(-20010,
                    'El registro con clave '
                    || :old.clave
                    || ' no cumple con las regiones permitidas (NO, EA, WS, SO).');
            end if;
    end case;
end;
/