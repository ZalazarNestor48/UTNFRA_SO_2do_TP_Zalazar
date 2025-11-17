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
sudo wipefs -a /dev/sdd2
sudo wipefs -a /dev/sdc1
sudo wipefs -a /dev/sdc2

# Creación de PVs (usando sdd y sdc según tu particionamiento)
sudo pvcreate /dev/sdd1 /dev/sdc2  # Para vg_datos (~1.5G + ~511M)
sudo pvcreate /dev/sdd2 /dev/sdc1  # Para vg_temp (~511M + ~512M)
sudo pvs

echo "--- 2. Creación de Volume Groups (VG) y Logical Volumes (LV) ---"
# Creación de VGs
sudo vgcreate vg_datos /dev/sdd1 /dev/sdc2
sudo vgcreate vg_temp /dev/sdd2 /dev/sdc1

# Creación de LVs con el tamaño solicitado:
# LV para Docker (5MB en vg_datos)
sudo lvcreate -L 5M vg_datos -n lv_docker
# LV para Workareas (1.5GB en vg_datos)
sudo lvcreate -L 1.5G vg_datos -n lv_workareas
# LV para Swap (512MB en vg_temp)
sudo lvcreate -L 512M vg_temp -n lv_swap
sudo lvs

echo "--- 3. Formateo de LVs ---"
# Formateo de LVs para datos (ext4)
sudo mkfs.ext4 $LV_DOCKER
sudo mkfs.ext4 $LV_WORKAREAS

# Configuración de Swap
sudo mkswap $LV_SWAP

echo "--- 4. Creación de Puntos de Montaje y Montaje Inicial ---"
# Creación de directorios (puntos de montaje)
sudo mkdir -p /var/lib/docker/
sudo mkdir -p /work/

# Montaje de los volúmenes
sudo mount $LV_DOCKER /var/lib/docker/
sudo mount $LV_WORKAREAS /work/

# Habilitar Swap
sudo swapon $LV_SWAP

echo "--- 5. Configuración de Persistencia en /etc/fstab y reinicio de Docker ---"
# Agregar entradas a /etc/fstab para que persistan los montajes y el swap
echo "# LVM Entries for TP 2025" | sudo tee -a /etc/fstab

# LV Docker (Montaje persistente)
echo "$LV_DOCKER /var/lib/docker ext4 defaults 0 0" | sudo tee -a /etc/fstab
# LV Workareas (Montaje persistente)
echo "$LV_WORKAREAS /work ext4 defaults 0 0" | sudo tee -a /etc/fstab
# LV Swap (Habilitación persistente)
echo "$LV_SWAP none swap sw 0 0" | sudo tee -a /etc/fstab

# Recargar daemon y reiniciar Docker para que use el nuevo volumen
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo systemctl status docker | grep Active

echo "LVM configurado, persistencia establecida y Docker reiniciado.
