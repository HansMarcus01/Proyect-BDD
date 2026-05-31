--@Autor: Hansel Yael Tepal Briseño
--@Fecha creación: 24/05/2026
--@Descripción: Definición del trigger instead of para la vista laptop_inventario

create or replace trigger t_dml_laptop_inventario
instead of insert or update or delete on laptop_inventario
begin
    case
        when inserting then
            -- insertando en el primer fragmento vertical
            insert into laptop_inventario_f1 (laptop_id, rfc_cliente, num_tarjeta)
            values (:new.laptop_id, :new.rfc_cliente, :new.num_tarjeta);
            -- insertando en el segundo fragmento vertical
            insert into laptop_inventario_f2 (laptop_id, fecha_status,sucursal_id , status_laptop_id)
            values (:new.laptop_id, :new.fecha_status, :new.sucursal_id, :new.status_laptop_id);
        when updating then
            raise_application_error(-20030,
                'la operación update aun no esta soportada');
        when deleting then
            delete from laptop_inventario_f1 where laptop_id = :old.laptop_id;
            delete from laptop_inventario_f2 where laptop_id = :old.laptop_id;
    end case;
end;
/