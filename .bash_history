ls -d UTN-FRA_SO_Examenes
docker --version
ansible --version
apt update
apt install wget gpg
sudo apt install wget gpg -y
ansible --version
apt install ansible 
sudo apt install wget gpg -y
UBUNTU_CODENAME=jammy
wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB78015893C4A3FD7BB9C367" | sudo gpg --dearmour -o /usr/share/keyrings/ansible-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/ansible-archive-keyring.gpg] http://ppa.launchpad.net/ansible/ansible/ubuntu $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/ansible.list
sudo apt update && sudo apt install ansible -y
ansible --version
sudo rm /etc/apt/sources.list.d/ansible.list
sudo apt update
sudo apt install wget gpg -y
UBUNTU_CODENAME=jammy
wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB78015893C4A3FD7BB9C367" | sudo gpg --dearmour -o /usr/share/keyrings/ansible-archive-keyring.gpg
apt update
su -
apt update
su
apt update
sudo apt install wget gpg -y
sudo rm -f /etc/apt/sources.list.d/ansible.list
UBUNTU_CODENAME=jammy
sudo apt update
sudo apt install wget gpg
UBUNTU_CODENAME=jammy
wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" | sudo gpg --dearmour -o /usr/share/keyrings/ansible-archive-keyring.gpg
ansible --version
su
sudo apt update
sudo apt install wget gpg
UBUNTU_CODENAME=jammy
wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" | sudo gpg --dearmour -o /usr/share/keyrings/ansible-archive-keyring.gpg
usermod -aG sudo vagrant
sudo su
sudo shutdown now
sudo apt update
sudo apt install wget gpg
UBUNTU_CODENAME=jammy
wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" | sudo gpg --dearmour -o /usr/share/keyrings/ansible-archive-keyring.gpg
sudo apt update
sudo apt install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y
ansible --version
git clone https://github.com/upszot/UTN-FRA_SO_Examenes.git
./UTN-FRA_SO_Examenes/202406/script_Precondicion.sh
source ~/.bashrc
sudo fdisk -l
sudo fdisk /dev/sdd
sudo fdisk -l
sudo fdisk /dev/sdc
sudo fdisk -l
#!/bin/bash
# Script para configurar LVM según el Punto A del TP.
# Variables de ruta de los Logical Volumes (LVs)
LV_DOCKER="/dev/mapper/vg_datos-lv_docker"
LV_WORKAREAS="/dev/mapper/vg_datos-lv_workareas"
LV_SWAP="/dev/mapper/vg_temp-lv_swap"
echo "--- 1. Limpieza de firmas de archivos y creación de Physical Volumes (PV) ---"
# Limpiar firmas antiguas (esencial para evitar que el sistema las detecte mal)
# Nota: Usamos las particiones que creaste: sdd1, sdd2, sdc1, sdc2
sudo wipefs -a /dev/sdd1
sudo wipefs -a /dev/sdc1
# Creación de PVs (usando sdd y sdc según tu particionamiento)
sudo pvcreate /dev/sdd1 /dev/sdc2  # Para vg_datos (~1.5G + ~511M)
sudo lvcreate -L 5M vg_datos -n lv_docker
# LV Docker (Montaje persistente)
echo "$LV_DOCKER /var/lib/docker ext4 defaults 0 0" | sudo tee -a /etc/fstab
# LV Workareas (Montaje persistente)
echo "$LV_WORKAREAS /work ext4 defaults 0 0" | sudo tee -a /etc/fstab
# LV Swap (Habilitación persistente)
echo "$LV_SWAP none swap sw 0 0" | sudo tee -a /etc/fstab
# Recargar daemon y reiniciar Docker para que use el nuevo volumen
sudo systemctl daemon-reload
chmod +x Punto_A.sh
cd ~
vim Punto_A.sh
chmod +x Punto_A.sh
./Punto_A.sh
df -h
sudo swapon --show
FECHA=$(date +%Y%m%d)
RTA_DIR="$HOME/RTA_Examen_$FECHA"
mkdir -p "$RTA_DIR"
mv Punto_A.sh "$RTA_DIR/Punto_A.sh"
echo "El script Punto_A.sh ha sido guardado en: $RTA_DIR/"
df -h
sudo swapon --show
cat /etc/fstab
FECHA=$(date +%Y%m%d)
RTA_DIR="$HOME/RTA_Examen_$FECHA"
mkdir -p "$RTA_DIR"
echo "Carpeta de respuestas lista en: $RTA_DIR"
sudo vim /usr/local/bin/ZalazarAltaUser-Groups.sh
sudo chmod +x /usr/local/bin/ZalazarAltaUser-Groups.sh
/usr/local/bin/ZalazarAltaUser-Groups.sh vagrant $HOME/UTN-FRA_SO_Examenes/202406/bash_script/Lista_Usuarios.txt
FECHA=$(date +%Y%m%d)
RTA_DIR="$HOME/RTA_Examen_$FECHA"
sudo cp /usr/local/bin/ZalazarAltaUser-Groups.sh "$RTA_DIR/ZalazarAltaUser-Groups.sh"
echo "/usr/local/bin/ZalazarAltaUser-Groups.sh vagrant $HOME/UTN-FRA_SO_Examenes/202406/bash_script/Lista_Usuarios.txt" > "$RTA_DIR/Punto_B.sh"
id programador3
ls -l $HOME/UTN-FRA_SO_Examenes/202406/bash_script/Lista_Usuarios.txt
sudo vim /usr/local/bin/ZalazarAltaUser-Groups.sh
id programador3
sudo chmod +x /usr/local/bin/ZalazarAltaUser-Groups.sh
id programador3
RUTA_LISTA=$(echo $HOME/UTN-FRA_SO_Examenes/202406/bash_script/Lista_Usuarios.txt)
/usr/local/bin/ZalazarAltaUser-Groups.sh vagrant $RUTA_LISTA
id programador3
SCRIPT_NAME="ZalazarAltaUser-Groups.sh"
# Sobrescribir el archivo de script con la sintaxis limpia (usamos tee)
sudo tee /usr/local/bin/$SCRIPT_NAME > /dev/null << 'EOF_SCRIPT'
#!/bin/bash
# Script: ZalazarAltaUser-Groups.sh
# Uso: $0 <Usuario_Clave> <Path_Lista_Usuarios>

# --- 1. Definición y Validación de Parámetros ---
USER_CLAVE=$1
LISTA_USUARIOS=$2

if [ -z "$USER_CLAVE" ] || [ -z "$LISTA_USUARIOS" ]; then
    echo "Error: Faltan parámetros."
    echo "Uso: $0 <Usuario_Clave> <Path_Lista_Usuarios>"
    exit 1
fi

echo "Iniciando alta de usuarios/grupos. Usuario de referencia para clave: $USER_CLAVE"

# Obtener el hash de la clave del usuario de referencia (Método SysAdmin)
CLAVE_HASH=$(sudo grep "^$USER_CLAVE:" /etc/shadow 2>/dev/null | cut -d: -f2)

if [ -z "$CLAVE_HASH" ]; then
    echo "Advertencia: No se pudo obtener el hash de la clave. Los usuarios se crearán sin clave."
fi

# --- 2. Procesamiento del Archivo de Usuarios ---
ANT_IFS=$IFS
IFS=$'\n' 

# Bucle for: itera sobre las líneas de usuario:grupo, excluyendo comentarios (#)
for LINEA in $(grep -vE '^\s*#' "$LISTA_USUARIOS" | awk -F ':' '{print $1":"$2}')
do
    USUARIO=$(echo "$LINEA" | cut -d: -f1)
    GRUPO=$(echo "$LINEA" | cut -d: -f2)

    if [ -z "$USUARIO" ] || [ -z "$GRUPO" ]; then
        continue 
    fi

    echo "Procesando: Usuario=$USUARIO, Grupo=$GRUPO"

    # 3. Creación del Grupo (si no existe)
    if ! getent group "$GRUPO" > /dev/null; then
        sudo groupadd "$GRUPO"
        echo "-> Grupo '$GRUPO' creado."
    fi

    # 4. Creación del Usuario: -m (HOME), -s /bin/bash (Shell), -g (Grupo principal)
    if ! id "$USUARIO" &>/dev/null; then
        sudo useradd -m -s /bin/bash -g "$GRUPO" "$USUARIO"
        echo "-> Usuario '$USUARIO' creado."

        # 5. Asignación de la clave (Uso de chpasswd -e con el hash obtenido)
        if [ -n "$CLAVE_HASH" ]; then
            echo "$USUARIO:$CLAVE_HASH" | sudo chpasswd -e
            echo "-> Clave asignada (misma que '$USER_CLAVE')."
        fi
    else
        echo "-> Usuario '$USUARIO' ya existe. Omitiendo."
    fi

done
IFS=$ANT_IFS 
echo "Proceso de alta de usuarios finalizado."
EOF_SCRIPT

sudo chmod +x /usr/local/bin/$SCRIPT_NAME
RUTA_LISTA=$(echo $HOME/UTN-FRA_SO_Examenes/202406/bash_script/Lista_Usuarios.txt)
/usr/local/bin/$SCRIPT_NAME vagrant $RUTA_LISTA
id programador3
# Definimos el nombre del script (Zalazar)
SCRIPT_NAME="ZalazarAltaUser-Groups.sh"
# Sobrescribir el script con la sintaxis limpia de WHILE READ. 
sudo tee /usr/local/bin/$SCRIPT_NAME > /dev/null << 'EOF_SCRIPT_FINAL'
#!/bin/bash
# Script: ZalazarAltaUser-Groups.sh
# Uso: $0 <Usuario_Clave> <Path_Lista_Usuarios>

# --- 1. Definición y Validación de Parámetros ---
USER_CLAVE=$1
LISTA_USUARIOS=$2

if [ -z "$USER_CLAVE" ] || [ -z "$LISTA_USUARIOS" ]; then
    echo "Error: Faltan parámetros."
    echo "Uso: $0 <Usuario_Clave> <Path_Lista_Usuarios>"
    exit 1
fi

echo "Iniciando alta de usuarios/grupos. Usuario de referencia para clave: $USER_CLAVE"

# Obtener el hash de la clave del usuario de referencia
CLAVE_HASH=$(sudo grep "^$USER_CLAVE:" /etc/shadow 2>/dev/null | cut -d: -f2)

if [ -z "$CLAVE_HASH" ]; then
    echo "Advertencia: No se pudo obtener el hash de la clave. Los usuarios se crearán sin clave."
fi

# --- 2. Procesamiento del Archivo de Usuarios con WHILE READ (Metodología de Clase 5) ---
# El bucle while lee cada línea del archivo, utilizando IFS=: para separar USUARIO y GRUPO
while IFS=: read -r USUARIO GRUPO RESTO; do
    # 1. Ignorar líneas vacías o comentarios (#)
    if [ -z "$USUARIO" ] || [[ "$USUARIO" =~ ^# ]]; then
        continue
    fi
    
    echo "Procesando: Usuario=$USUARIO, Grupo=$GRUPO"

    # 2. Creación del Grupo (si no existe)
    if ! getent group "$GRUPO" > /dev/null; then
        sudo groupadd "$GRUPO"
        echo "-> Grupo '$GRUPO' creado."
    fi

    # 3. Creación del Usuario: -m (HOME), -s /bin/bash (Shell), -g (Grupo principal)
    if ! id "$USUARIO" &>/dev/null; then
        sudo useradd -m -s /bin/bash -g "$GRUPO" "$USUARIO"
        echo "-> Usuario '$USUARIO' creado."
        
        # 4. Asignación de la clave
        if [ -n "$CLAVE_HASH" ]; then
            echo "$USUARIO:$CLAVE_HASH" | sudo chpasswd -e
            echo "-> Clave asignada (misma que '$USER_CLAVE')."
        fi
    else
        echo "-> Usuario '$USUARIO' ya existe. Omitiendo."
    fi

done < <(grep -vE '^\s*#' "$LISTA_USUARIOS")

echo "Proceso de alta de usuarios finalizado."
EOF_SCRIPT_FINALsudo chmod +x /usr/local/bin/ZalazarAltaUser-Groups.sh


sudo chmod +x /usr/local/bin/ZalazarAltaUser-Groups.sh
RUTA_LISTA=$(echo $HOME/UTN-FRA_SO_Examenes/202406/bash_script/Lista_Usuarios.txt)
/usr/local/bin/ZalazarAltaUser-Groups.sh vagrant $RUTA_LISTA
id programador3
# Definimos el nombre del script (Zalazar)
SCRIPT_NAME="ZalazarAltaUser-Groups.sh"
sudo chmod +x /usr/local/bin/ZalazarAltaUser-Groups.shRUTA_LISTA=$(echo $HOME/UTN-FRA_SO_Examenes/202406/bash_script/Lista_Usuarios.txt)#!/bin/bash
# Sobrescribir el script con la sintaxis limpia de WHILE READ
# Uso: $0 <Usuario_Clave> <Path_Lista_Usuarios>
LISTA_USUARIOS=$2
/usr/local/bin/ZalazarAltaUser-Groups.sh vagrant $RUTA_LISTA
# Uso: sudo /usr/local/bin/ZalazarAltaUser-Groups.sh ORIGEN lista_usuarios.txt
if [ "$(id -u)" -ne 0 ]; then     echo "Este script debe ejecutarse con sudo" if [ "$#" -ne 2 ]; then     echo "Uso: $0 ORIGEN LISTA_USUARIOS"; fi
PASS_HASH=$(getent shadow "$ORIGEN" | cut -d: -f2)     [[ "$USER" =~ ^# ]] && continue         echo "Creando grupo: $GROUP";         groupadd "$GROUP";     fi
ls -l /usr/local/bin | grep AltaUser
sudo rm /usr/local/bin/ZalazarAltaUser-Groups.sh
ls -l /usr/local/bin | grep AltaUser
#!/bin/bash
# /usr/local/bin/ZalazarAltaUser-Groups.sh
# Uso: sudo /usr/local/bin/ZalazarAltaUser-Groups.sh ORIGEN lista_usuarios.txt
# Verifica que se ejecuta con sudo
if [ "$(id -u)" -ne 0 ]; then     echo "Este script debe ejecutarse con sudo";     exit 1; fi
ls -l /usr/local/bin | grep Zalazar
ls -l /usr/local/bin | grep AltaUser
sudo chmod 755 /usr/local/bin/ZalazarAltaUser-Groups.shsudo chmod 755 /usr/local/bin/ZalazarAltaUser-Groups.shudo chmod 755 /usr/local/bin/ZalazarAltaUser-Groups.shno
sudo nano /usr/local/bin/ZalazarAltaUser-Groups.sh
ls -l /usr/local/bin | grep Zalazar
grt
sudo chmod 755 /usr/local/bin/ZalazarAltaUser-Groups.sh
ls -l /usr/local/bin
ls -l /usr/local/bin | grep Zalazar
sudo nano /usr/local/bin/ZalazarAltaUser-Groups.sh
ls -l /usr/local/bin | grep Zalazar
sudo nano /usr/local/bin/ZalazarAltaUser-Groups.sh
ls -l /usr/local/bin | grep Zalazar
grtls -l /usr/local/bin | grep Zalazar
ls -l /usr/local/bin | grep Zalazar
sudo chmod 755 /usr/local/bin/ZalazarAltaUser-Groups.sh
ls -l /usr/local/bin | grep Zalazar
sudo bash -n /usr/local/bin/ZalazarAltaUser-Groups.sh
ls -l /usr/local/bin | grep Zalazar
whoami
id vagrant
/usr/local/bin/ZalazarAltaUser-Groups.sh vagrant "$RUTA_LISTA"
sudo/usr/local/bin/ZalazarAltaUser-Groups.sh vagrant "$RUTA_LISTA"
/usr/local/bin/ZalazarAltaUser-Groups.sh vagrant "$RUTA_LISTA"
id programador3
ls -l /usr/local/bin | grep Zalazar
sudo bash -n /usr/local/bin/ZalazarAltaUser-Groups.sh
echo "juan:ventas:Usuario de ventas" > ~/Lista_Usuarios.txt
echo "maria:soporte:Usuario de soporte" >> ~/Lista_Usuarios.txt
sudo /usr/local/bin/ZalazarAltaUser-Groups.sh vagrant ~/Lista_Usuarios.txt
id juan
docker --version
mkdir -p TP2/202406/docker/static-html-directory
ls TP2/202406/docker
cd TP2/202406/docker/static-html-directory
nano index.html
cat index.html
ls -l index.html
cd ..
TP2/202406/docker
pwd
nano Dockerfile
ls -l Dockerfile
cat Dockerfile
docker login
cat ~/.docker/config.json
docker push algoquenoexiste/web1-test
docker info | grep Username
ls
docker build -t nzalazar10/web1-zalazar:latest .
dodddoeeelsdocker img
docker login
hhhhhoceeeeere
vagrant@NestorSegundoParcial:~$
wwhich docker
docker push algoquenoexiste/webocker images
docker images
aatttttssssst
docker push nzalazar10/web1-zalazar:lates
docker push nzalazar10/web1-zalazar:latesdocker push nzalazar10/web1-zalazar:latest
cddd
                                                      cd TP2/202406/docker
docker push nzalazar10/web1-zalazar:latest
vim run.sh
chmod +x run.sh
./run.sh
docker ps
curl localhost:8080
cd ~/TP2/202406/ansible
find ~ -type d -name "202406"
ls -l /home/vagrant/TP2/202406
ls -l /home/vagrant/UTN-FRA_SO_Examenes/202406
cd /home/vagrant/UTN-FRA_SO_Examenes/202406/ansible
pwd
ls -l roles
cd roles/2do_parcial
ls -R
mkdir templates
ls -l
find ~ -type d -name "202406"find ~ -type d -name "202406"find ~ -type d -name "202406"find ~ -type d -name "202406"find ~ -type d -name "202406"ls -l /home/vagrant/TP2/202406ls -l rolesls -RAlumno: {{ alumno_nombre }}
DNI: {{ alumno_dni }}
Fecha: {{ alumno_fecha }}iq
vim templates/datos_alumno.j2
pwd
cd ~/UTN-FRA_SO_Examenes/202406
pwd
cd ansible
pwd
cd roles
cd 2do_parcial
vagrant@NestorSegundoParcial:~/UTN-FRA_SO_Examenes/202406/ansible/roles/2do_parcial$ 
vagrant@NestorSegundoParcial:~/UTN-FRA_SO_Examenes/202406/ansible/roles/2do_parcial$ ls -l
pwd
ls -l
vim templates/datos_alumno.j2
cat templates/datos_alumno.j2
vim templates/datos_equipo.j2
cat templates/datos_equipo.j2
vim vars/main.yml
cat vars/main.yml
vim tasks/main.yml
cat tasks/main.yml
vim tasks/main.yml
cat tasks/main.yml
cd
cd ~/UTN-FRA_SO_Examenes/202406/ansible
vim puntoD.yml
vim inventory/hosts
ip a
vim inventory/hosts
ansible -i inventory/hosts UTN -m ping
vim inventory/hosts
ansible -i inventory/hosts UTN -m ping
ansible-playbook -i inventory/hosts puntoD.yml
cd ~/UTN-FRA_SO_Examenes/202406/ansible
ls -l
ls -l puntoD.yml
ansible-playbook -i inventory/hosts puntoD.yml
cd ~/RTA_Examen_20251119
vim Punto_D.sh
cd ~
git clone https://github.com/ZalazarNestor48/UTNFRA_SO_2do_TP_-Zalazar-.git
cd UTNFRA_SO_2do_TP_-Zalazar-cp -r ~/UTN-FRA_SO_Examenes/202406 .
cp -r ~/RTA_Examen_20251119 .
history -a
cp ~/.bash_history .
git add .
git status
git commit -m "Subo TP2 completo - Nestor Zalazar"
git push -u origin main
git status
git log -1
ls -l
cd UTNFRA_SO_2do_TP_-Zalazar-
cp -r ~/UTN-FRA_SO_Examenes/202406 .
ls -l ~
cp -r ~/RTA_Examen_20251117 .
history -a
cp ~/.bash_history .
ls -l
history -a
cp ~/.bash_history .
ls -l
pwd
cp ~/.bash_history .
vagrant@NestorSegundoParcial:~/UTNFRA_SO_2do_TP_-Zalazar-$
        cd ~/UTNFRA_SO_2do_TP_-Zalazar-
