--@Autor: Hansel Yael Tepal Briseño
--@Fecha creación: 26/05/2026
--@Descripción: Eliminación y creación del usuario.

prompt Creando al usuario ilap_bdd
drop user if exists ilap_bdd cascade;
create user ilap_bdd identified by ilap_bdd quota unlimited on users;

prompt Otorgando privilegios al usuario ilap_bdd
grant create session, create table, create sequence, create procedure, create view,
    create synonym, create database link to ilap_bdd;