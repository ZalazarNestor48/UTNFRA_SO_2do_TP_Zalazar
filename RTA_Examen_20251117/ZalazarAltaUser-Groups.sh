#!/bin/bash
# /usr/local/bin/ZalazarAltaUser-Groups.sh
# Uso: sudo /usr/local/bin/ZalazarAltaUser-Groups.sh ORIGEN LISTA_USUARIOS

# Verificar que se ejecuta con sudo
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script debe ejecutarse con sudo"
    exit 1
fi

# Verificar parámetros recibidos
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 ORIGEN LISTA_USUARIOS"
    exit 1
fi

ORIGEN="$1"
LISTA="$2"

# Obtener hash de contraseña del usuario origen
PASS_HASH=$(getent shadow "$ORIGEN" | cut -d: -f2)

if [ -z "$PASS_HASH" ]; then
    echo "No se pudo obtener la contraseña del usuario origen: $ORIGEN"
    exit 1
fi

# Procesar archivo CSV separado por comas
while IFS=',' read -r USER GROUP HOME; do

    # Saltar líneas vacías o comentarios
    [[ "$USER" =~ ^# ]] && continue
    [ -z "$USER" ] && continue

    echo "------------------------------------------"
    echo "Creando grupo: $GROUP"

    # Crear grupo si no existe
    if ! getent group "$GROUP" >/dev/null 2>&1; then
        groupadd "$GROUP"
    fi

    echo "Creando usuario: $USER"

    # Crear usuario con su home y grupo
    useradd -m -d "$HOME" -s /bin/bash -g "$GROUP" "$USER"

    # Copiar contraseña
    usermod -p "$PASS_HASH" "$USER"

    echo "Usuario $USER creado con home $HOME y contraseña copiada desde $ORIGEN"

done < "$LISTA"
