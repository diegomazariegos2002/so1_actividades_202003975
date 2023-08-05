#!/bin/bash

# Solicita permisos para ejecutarse si no los tiene
if [[ ! -x "$0" ]]; then
    chmod +x "$0"
    echo "Permisos de ejecución otorgados al script."
fi
# Verifica si jq está instalado, si no lo está, lo instala
if ! command -v jq &>/dev/null; then
    read -p "jq no está instalado. ¿Deseas instalarlo ahora? (y/n): " choice
    if [ "$choice" = "y" ]; then
        sudo apt-get update
        sudo apt-get install -y jq
    else
        echo "El script requiere jq para ejecutarse correctamente."
        exit 1
    fi
fi

# Lee la variable GITHUB_USER
read -p "Ingresa el nombre de usuario de GitHub: " GITHUB_USER

# Consulta la URL y almacena la respuesta JSON en una variable
JSON_RESPONSE=$(curl -s "https://api.github.com/users/$GITHUB_USER")

# Extrae los datos necesarios del JSON
github_user=$(echo "$JSON_RESPONSE" | jq -r '.login')
user_id=$(echo "$JSON_RESPONSE" | jq -r '.id')
created_at=$(echo "$JSON_RESPONSE" | jq -r '.created_at')

# Crea el mensaje a imprimir
message="Hola $github_user. User ID: $user_id. Cuenta fue creada el: $created_at."

# Imprime el mensaje
echo "$message"

# Obtiene la fecha actual en el formato necesario para el directorio
current_date=$(date +'%Y-%m-%d')
log_directory="/tmp/$current_date"

# Crea el directorio si no existe
mkdir -p "$log_directory"

# Crea el archivo de registro
log_file="$log_directory/saludos.log"
echo "$message" > "$log_file"

echo "Registro guardado en: $log_file"


