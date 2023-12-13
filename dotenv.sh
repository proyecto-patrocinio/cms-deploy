#!/bin/bash

env_file=".env"

# Verificar si el archivo .env existe
if [ ! -f $env_file ]; then
    echo "El archivo .env no existe."
    exit 1
fi

select_option() {
    case $1 in
        1)
            set_env_variables
            ;;
        2)
            unset_env_variables
            ;;
        *)
            echo "Invalid option selected."
            ;;
    esac
}

# Leer el archivo .env y crear variable de entorno
set_env_variables() {
    echo "Creando variables de entorno..."
    while IFS= read -r line; do
        # Ignorar líneas comentadas o vacías
        if [[ "$line" =~ ^\s*# || -z "$line" ]]; then
            continue
        fi
        # Crear variable de entorno
        export $line
        echo "$line"
    done < $env_file

    echo "..................."
    echo "Proceso completado."
}

unset_env_variables() {
    echo "Eliminando variables de entorno..."
    while IFS= read -r line; do
        # Ignorar líneas comentadas o vacías
        if [[ "$line" =~ ^\s*# || -z "$line" ]]; then
            continue
        fi
        # Eliminar variable de entorno
        unset "$line"
        echo "$line"
    done < $env_file

    echo "..................."
    echo "Proceso completado."
}

main() {
    echo "Select an option:"
    echo "[1] - Crear variables de entorno desde el archivo .env"
    echo "[2] - Eliminar variables de entorno desde el archivo .env"
    
    read -p "--> " opt
    select_option "$opt"
}

main