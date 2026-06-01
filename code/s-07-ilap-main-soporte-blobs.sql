--@Autor: Hansel Yael Tepal Briseño y Luis Daniel Salazar Islas
--@Fecha creación: 31/05/2026
--@Descripción: Archivo main para la configuración de blobs en el sitio



Prompt configurando directorios y otorgando registros.
--htbbdd_s1
Prompt configurando soporte BLOB para htbbdd_s1
connect ilap_bdd/ilap_bdd@htbbdd_s1
@s-07-ilap-configuracion-soporte-blobs.sql
--htbdd_s2
Prompt configurando soporte BLOB para htbdd_s2
connect ilap_bdd/ilap_bdd@htbdd_s2
@s-07-ilap-configuracion-soporte-blobs.sql
--lsibdd_s1
Prompt configurando soporte BLOB para lsibdd_s1
connect ilap_bdd/ilap_bdd@lsibdd_s1
@s-07-ilap-configuracion-soporte-blobs.sql
--lsibdd_s2
Prompt configurando soporte BLOB para lsibdd_s2
connect ilap_bdd/ilap_bdd@lsibdd_s2
@s-07-ilap-configuracion-soporte-blobs.sql
Prompt Listo !