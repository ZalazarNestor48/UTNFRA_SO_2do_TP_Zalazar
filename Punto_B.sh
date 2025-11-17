#!/bin/bash
# Punto B - Alta de usuarios y grupos
# Comando utilizado por el alumno:

sudo /usr/local/bin/ZalazarAltaUser-Groups.sh vagrant ~/UTN-FRA_SO_Examenes/202406/bash_script/Lista_Usuarios.txt


# ------------------ CONTENIDO DEL SCRIPT ------------------

#!/bin/bash
# /usr/local/bin/ZalazarAltaUser-Groups.sh
# Uso: sudo /usr/local/bin/ZalazarAltaUser-Groups.sh ORIGEN LISTA_USUARIOS

if [ "$(id -u)" -ne 0 ]; then
    echo "Este script debe ejecutarse con sudo"
    exit 1
fi

if [ "$#" -ne 2 ]; then
    echo "Uso: $0 ORIGEN LISTA_USUARIOS"
    exit 1
fi

ORIGEN="$1"
LISTA="$2"

PASS_HASH=$(getent shadow "$ORIGEN" | cut -d: -f2)

if [ -z "$PASS_HASH" ]; then
    echo "No se pudo obtener la contraseña del usuario origen: $ORIGEN"
    exit 1
fi

while IFS=',' read -r USER GROUP HOME; do
    [[ "$USER" =~ ^# ]] && continue
    [ -z "$USER" ] && continue

    echo "Creando grupo: $GROUP"
    if ! getent group "$GROUP" >/dev/null 2>&1; then
        groupadd "$GROUP"
    fi

    echo "Creando usuario: $USER"
    useradd -m -d "$HOME" -s /bin/bash -g "$GROUP" "$USER"

    usermod -p "$PASS_HASH" "$USER"

    echo "Usuario $USER creado con home $HOME y contraseña copiada desde $ORIGEN"

done < "$LISTA"
