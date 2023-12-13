#!/bin/bash

secrets_file=".secrets"

# Verificar si el archivo .secrets existe
if [ ! -f $secrets_file ]; then
    echo "El archivo .secrets no existe."
    exit 1
fi


select_option() {
    case $1 in
        1)
            set_secrets_variables
            ;;
        2)
            unset_secrets_variables
            ;;
        *)
            echo "Invalid option selected."
            ;;
    esac
}


# Leer el archivo .secrets y crear secretos de Docker
set_secrets_variables() {
    while IFS= read -r line; do
        # Ignorar líneas comentadas o vacías
        if [[ "$line" =~ ^\s*# || -z "$line" ]]; then
            continue
        fi

        # Extraer la clave y el valor
        key=$(echo "$line" | cut -d '=' -f 1)
        value=$(echo "$line" | cut -d '=' -f 2-)

        # Crear el secreto de Docker
        echo "$value" | docker secret create "$key" -
        echo "Secreto creado para la clave: $key"
    done < $secrets_file

    echo "..................."
    echo "Proceso completado."
}

# Leer el archivo .secrets y eliminar secretos de Docker
unset_secrets_variables() {
    while IFS= read -r line; do
        # Ignorar líneas comentadas o vacías
        if [[ "$line" =~ ^\s*# || -z "$line" ]]; then
            continue
        fi

        # Extraer la clave y el valor
        key=$(echo "$line" | cut -d '=' -f 1)
        value=$(echo "$line" | cut -d '=' -f 2-)

        # Crear el secreto de Docker
        docker secret rm "$key"
        echo "Secreto eliminado..."
    done < $secrets_file

    echo "..................."
    echo "Proceso completado."
}


main() {
    echo "Select an option:"
    echo "[1] - Set .secrets file variables"
    echo "[2] - Unset .secrets file variables"
    
    read -p "--> " opt
    select_option "$opt"
}

main