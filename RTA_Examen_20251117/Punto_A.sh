#!/bin/bash
# Punto_A.sh
# Persistencia y montaje de volúmenes LVM para TP
# Ajustado a la VM provista (vg_datos, vg_temp)
#
# Uso: sudo bash Punto_A.sh
# (Se asume que los LV ya existen: /dev/vg_datos/lv_docker, /dev/vg_datos/lv_workareas, /dev/vg_temp/lv_swap)

set -euo pipefail

LV_DOCKER="/dev/vg_datos/lv_docker"
LV_WORK="/dev/vg_datos/lv_workareas"
LV_SWAP="/dev/vg_temp/lv_swap"

MOUNT_DOCKER="/var/lib/docker"
MOUNT_WORK="/work"

FSTAB="/etc/fstab"

# --- 0) comprobaciones iniciales ---
echo "Comprobando existencia de LVs..."
if [ ! -b "$LV_DOCKER" ]; then
  echo "ERROR: $LV_DOCKER no existe. Abortando." >&2
  exit 1
fi
if [ ! -b "$LV_WORK" ]; then
  echo "ERROR: $LV_WORK no existe. Abortando." >&2
  exit 1
fi
if [ ! -b "$LV_SWAP" ]; then
  echo "ERROR: $LV_SWAP no existe. Abortando." >&2
  exit 1
fi

# --- 1) Crear puntos de montaje si no existen ---
echo "Creando puntos de montaje si es necesario..."
sudo mkdir -p "$MOUNT_DOCKER"
sudo mkdir -p "$MOUNT_WORK"

# --- 2) Formatear si hace falta ---
fs_type=$(sudo blkid -s TYPE -o value "$LV_WORK" || true)
if [ -z "$fs_type" ]; then
  echo "Formateando $LV_WORK a ext4..."
  sudo mkfs.ext4 -F "$LV_WORK"
else
  echo "$LV_WORK ya tiene FS: $fs_type"
fi

fs_type=$(sudo blkid -s TYPE -o value "$LV_DOCKER" || true)
if [ -z "$fs_type" ]; then
  echo "Formateando $LV_DOCKER a ext4..."
  sudo mkfs.ext4 -F "$LV_DOCKER"
else
  echo "$LV_DOCKER ya tiene FS: $fs_type"
fi

# --- 3) Montar ---
echo "Montando volúmenes..."
if ! mountpoint -q "$MOUNT_WORK"; then
  sudo mount "$LV_WORK" "$MOUNT_WORK"
  echo "Montado $LV_WORK -> $MOUNT_WORK"
else
  echo "$MOUNT_WORK ya está montado"
fi

if ! mountpoint -q "$MOUNT_DOCKER"; then
  sudo mount "$LV_DOCKER" "$MOUNT_DOCKER"
  echo "Montado $LV_DOCKER -> $MOUNT_DOCKER"
else
  echo "$MOUNT_DOCKER ya está montado"
fi

# --- 4) Swap ---
echo "Chequeando swap..."
if ! sudo swapon --show=NAME | grep -q "$(basename $LV_SWAP)" ; then
  echo "Habilitando swap..."
  sudo mkswap "$LV_SWAP" >/dev/null 2>&1 || true
  sudo swapon "$LV_SWAP"
else
  echo "Swap ya activo"
fi

# --- 5) Persistencia (fstab) ---
echo "Actualizando /etc/fstab..."

add_if_missing() {
  local dev=$1
  local mp=$2
  local fs=$3
  local opts=$4

  if ! grep -q "^$dev $mp" "$FSTAB"; then
    sudo sed -i "\| $mp |d" "$FSTAB"
    echo "$dev $mp $fs $opts 0 0" | sudo tee -a "$FSTAB" >/dev/null
    echo "Añadido: $dev → $mp"
  else
    echo "Entrada ya existe: $mp"
  fi
}

add_if_missing "$LV_DOCKER" "$MOUNT_DOCKER" ext4 defaults
add_if_missing "$LV_WORK" "$MOUNT_WORK" ext4 defaults

if ! grep -q "^$LV_SWAP none swap" "$FSTAB"; then
  sudo sed -i "\| swap |d" "$FSTAB"
  echo "$LV_SWAP none swap sw 0 0" | sudo tee -a "$FSTAB" >/dev/null
fi

# --- 6) Reiniciar Docker ---
echo "Reiniciando docker..."
sudo systemctl daemon-reload
sudo systemctl restart docker

echo "Punto A finalizado correctamente."
