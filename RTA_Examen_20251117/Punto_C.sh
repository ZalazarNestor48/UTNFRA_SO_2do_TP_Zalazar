#!/bin/bash
# Punto C - Construcción y publicación de imagen Docker

# Construcción de la imagen
docker build -t nzalazar10/zalazar_apache:1.0 .

# Tag de la imagen
docker tag nzalazar10/zalazar_apache:1.0 nzalazar10/zalazar_apache:1.0

# Login a DockerHub
docker login -u nzalazar10

# Push de la imagen
docker push nzalazar10/zalazar_apache:1.0
