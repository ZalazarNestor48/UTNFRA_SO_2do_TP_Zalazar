#!/bin/bash
# Punto D - Ejecución del contenedor Docker

# Ejecutar el contenedor construido en el Punto C
docker run -d -p 8080:80 --name apache_zalazar nzalazar10/zalazar_apache:1.0
