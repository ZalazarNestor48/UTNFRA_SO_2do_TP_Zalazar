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

# Obtener el hash de la clave del usuario de referencia (Clase 10)
CLAVE_HASH=$(sudo grep "^$USER_CLAVE:" /etc/shadow 2>/dev/null | cut -d: -f2)

if [ -z "$CLAVE_HASH" ]; then
	    echo "Advertencia: No se pudo obtener el hash de la clave. Los usuarios se crearán sin clave."
fi

# --- 2. Procesamiento del Archivo de Usuarios (Clase 5: Bucle for con manejo de IFS) ---
ANT_IFS=$IFS
IFS=$'\n' 

# El bucle procesa líneas, excluyendo comentarios (#) y asegurando el formato.
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
																							IFS=$ANT_IFS # Restaurar IFS
																							echo "Proceso de alta de usuarios finalizado."
