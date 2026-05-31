--@Autor: Hansel Yael Tepal Briseno y Luis Daniel Salazar Islas
--@Fecha creacion: 30/05/2026
--@Descripcion: Creación de las funciones que recuperaran de cada fragmento los datos de
-- tipo blob

prompt creando la funcion para obtener la foto de la laptop de laptop_f1
create or replace function get_remote_foto_f1_by_id(
    p_laptop_id in laptop_f1.laptop_id%type
) return blob is
    pragma autonomous_transaction;
    v_temp_foto blob;
begin
    -- aseguramos que no existan registros en la tabla temporal
    delete from ts_laptop_f1;
    -- insertamos el registro solicitado en la tabla temporal
    insert into ts_laptop_f1
        select laptop_id, foto
        from laptop_f1
        where laptop_id = p_laptop_id;
    -- recuperamos el dato de tipo blob de la tabla temporal
    select foto into v_temp_foto
    from ts_laptop_f1
    where laptop_id = p_laptop_id;
    -- eliminamos el registro de la tabla temporal
    delete from ts_laptop_f1;
    -- terminamos la transacción autónoma
    commit;
    -- retornamos el dato de tipo blob
    return v_temp_foto;
exception
    when others then
        -- en caso de error, terminamos la transacción
        rollback;
        -- re-lanzamos la excepción para que sea manejada por el bloque llamante
        raise;
end;
/
show errors

prompt creando la funcion para obtener la factura de servicio_laptop_f1
create or replace function get_remote_factura_f1_by_id(
    p_laptop_id in servicio_laptop_f1.laptop_id%type,
    p_num_servicio in servicio_laptop_f1.num_servicio%type
) return blob is
    pragma autonomous_transaction;
    v_temp_factura blob;
begin
    -- aseguramos que no existan registros en la tabla temporal
    delete from ts_servicio_laptop_f1;
    -- insertamos el registro solicitado en la tabla temporal
    insert into ts_servicio_laptop_f1 (laptop_id, num_servicio, factura)
        select laptop_id, num_servicio, factura
        from servicio_laptop_f1
        where laptop_id = p_laptop_id
        and num_servicio = p_num_servicio;
    -- recuperamos el dato de tipo blob de la tabla temporal
    select factura into v_temp_factura
    from ts_servicio_laptop_f1
    where laptop_id = p_laptop_id
    and num_servicio = p_num_servicio;
    -- eliminamos el registro de la tabla temporal
    delete from ts_servicio_laptop_f1;
    -- terminamos la transacción autónoma
    commit;
    -- retornamos el dato de tipo blob
    return v_temp_factura;
exception
    when others then
        -- en caso de error, terminamos la transacción
        rollback;
        -- re-lanzamos la excepción para que sea manejada por el bloque llamante
        raise;
end;
/
show errors

prompt creando la función para obtener la factura de servicio_laptop_f2
create or replace function get_remote_factura_f2_by_id(
    p_laptop_id in servicio_laptop_f2.laptop_id%type,
    p_num_servicio in servicio_laptop_f2.num_servicio%type
) return blob is
    pragma autonomous_transaction;
    v_temp_factura blob;
begin
    -- aseguramos que no existan registros en la tabla temporal
    delete from ts_servicio_laptop_f2;
    -- insertamos el registro solicitado en la tabla temporal
    insert into ts_servicio_laptop_f2 (laptop_id, num_servicio, factura)
        select laptop_id, num_servicio, factura
        from servicio_laptop_f2
        where laptop_id = p_laptop_id
        and num_servicio = p_num_servicio;
    -- recuperamos el dato de tipo blob de la tabla temporal
    select factura into v_temp_factura
    from ts_servicio_laptop_f2
    where laptop_id = p_laptop_id
    and num_servicio = p_num_servicio;
    -- eliminamos el registro de la tabla temporal
    delete from ts_servicio_laptop_f2;
    -- terminamos la transacción autónoma
    commit;
    -- retornamos el dato de tipo blob
    return v_temp_factura;
exception
    when others then
        -- en caso de error, terminamos la transacción
        rollback;
        -- re-lanzamos la excepción para que sea manejada por el bloque llamante
        raise;
end;
/
show errors

prompt creando la función para obtener la factura de servicio_laptop_f3
create or replace function get_remote_factura_f3_by_id(
    p_laptop_id in servicio_laptop_f3.laptop_id%type,
    p_num_servicio in servicio_laptop_f3.num_servicio%type
) return blob is
    pragma autonomous_transaction;
    v_temp_factura blob;
begin
    -- aseguramos que no existan registros en la tabla temporal
    delete from ts_servicio_laptop_f3;
    -- insertamos el registro solicitado en la tabla temporal
    insert into ts_servicio_laptop_f3 (laptop_id, num_servicio, factura)
        select laptop_id, num_servicio, factura
        from servicio_laptop_f3
        where laptop_id = p_laptop_id
        and num_servicio = p_num_servicio;
    -- recuperamos el dato de tipo blob de la tabla temporal
    select factura into v_temp_factura
    from ts_servicio_laptop_f3
    where laptop_id = p_laptop_id
    and num_servicio = p_num_servicio;
    -- eliminamos el registro de la tabla temporal
    delete from ts_servicio_laptop_f3;
    -- terminamos la transacción autónoma
    commit;
    -- retornamos el dato de tipo blob
    return v_temp_factura;
exception
    when others then
        -- en caso de error, terminamos la transacción
        rollback;
        -- re-lanzamos la excepción para que sea manejada por el bloque llamante
        raise;
end;
/
show errors

prompt creando la función para obtener la factura de servicio_laptop_f4
create or replace function get_remote_factura_f4_by_id(
    p_laptop_id in servicio_laptop_f4.laptop_id%type,
    p_num_servicio in servicio_laptop_f4.num_servicio%type
) return blob is
    pragma autonomous_transaction;
    v_temp_factura blob;
begin
    -- aseguramos que no existan registros en la tabla temporal
    delete from ts_servicio_laptop_f4;
    -- insertamos el registro solicitado en la tabla temporal
    insert into ts_servicio_laptop_f4 (laptop_id, num_servicio, factura)
        select laptop_id, num_servicio, factura
        from servicio_laptop_f4
        where laptop_id = p_laptop_id
        and num_servicio = p_num_servicio;
    -- recuperamos el dato de tipo blob de la tabla temporal
    select factura into v_temp_factura
    from ts_servicio_laptop_f4
    where laptop_id = p_laptop_id
    and num_servicio = p_num_servicio;
    -- eliminamos el registro de la tabla temporal
    delete from ts_servicio_laptop_f4;
    -- terminamos la transacción autónoma
    commit;
    -- retornamos el dato de tipo blob
    return v_temp_factura;
exception
    when others then
        -- en caso de error, terminamos la transacción
        rollback;
        -- re-lanzamos la excepción para que sea manejada por el bloque llamante
        raise;
end;
/
show errors