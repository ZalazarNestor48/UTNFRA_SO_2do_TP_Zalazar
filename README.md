# UTNFRA – Sistemas Operativos  
## Segundo TP – Zalazar Néstor  
### RTA_Examen_20251117

Este repositorio contiene la resolución completa del Segundo Trabajo Práctico, desarrollado en la VM provista por la UTN-FRA y utilizando únicamente los comandos enseñados en clase.

La estructura final pedida por la cátedra se encuentra dentro de:
RTA_Examen_20251117/
├── Punto_A.sh
├── Punto_B.sh
├── Punto_C.sh
├── Punto_D.sh
└── ZalazarAltaUser-Groups.sh
---

## ��� Punto A – Administración de LVM / Particiones
Archivo: **Punto_A.sh**

Contiene todos los comandos ejecutados durante el punto A, con los comentarios solicitados en la consigna.

---

## ��� Punto B – Creación de Usuarios y Grupos desde archivo CSV
Archivos:
- **Punto_B.sh** → Script con el comando utilizado  
- **ZalazarAltaUser-Groups.sh** → Script final que automatiza la creación

El script permite:

- Crear grupos indicados en el archivo CSV  
- Crear usuarios asignando grupo primario  
- Crear HOME personalizado  
- Copiar la contraseña desde el usuario origen (`vagrant`)  
- Leer archivo separado por comas (CSV)  
- Omitir comentarios y líneas vacías

Ejemplo de ejecución utilizado:
sudo /usr/local/bin/ZalazarAltaUser-Groups.sh vagrant Lista_Usuarios.txt
---

## ��� Punto C – Construcción, Tag y Push de Imagen Docker
Archivo: **Punto_C.sh**

Incluye:

- Creación del Dockerfile  
- Construcción de la imagen  
- Tag correspondiente  
- Login a DockerHub  
- Publicación de la imagen

Mi repositorio de DockerHub:  
��� https://hub.docker.com/u/nzalazar10

---

## ��� Punto D – Ejecución del Contenedor Docker
Archivo: **Punto_D.sh**

Contiene el comando utilizado para ejecutar la imagen del Punto C.

Ejemplo de ejecución:
docker run -d -p 8080:80 --name apache_zalazar nzalazar10/zalazar_apache:1.0
---

## ��� Datos del Alumno
- **Nombre:** Néstor Zalazar  
- **Curso:** Sistemas Operativos – UTN FRA  

---

## ��� Notas Finales
- Todos los scripts fueron ejecutados y probados en la VM oficial.  
- Se incluyen comentarios explicativos como pide la cátedra.  
- La estructura final coincide exactamente con lo mostrado en el enunciado del TP.

---

