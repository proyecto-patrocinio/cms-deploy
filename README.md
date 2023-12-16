# Despliegue - Case Managment System
Este proyecto utiliza Docker Swarm para orquestar los contenedores necesarios para la plataforma.


## Prerequisitos
- Tener instalado Docker y Docker compose. (Docker engine > 1.13.0+)
- Tener pulleadas las imágenes referenciadas en el archivo `./env`


A continuación, se detallan los pasos para desplegar la plataforma. Desde el host del nodo manager, siga estos pasos en una terminal "bash"...

## 1) Crear Nodo Manager
Ejecute el siguiente comando para crear el nodo manager:
```bash
docker swarm init
```

## 2) Archivos de Configuración y Templates
Actualice correctamente los archivos de configuración y entorno del sistema CMS ubicados en el directorio `./resources/`. Además, puede personalizar las plantillas utilizadas en el envío de correos electrónicos modificando los archivos en el directorio `./resources/templates/`.

## 3) Configurar Variables de Entorno
Verifique los valores de las variables en el archivo .env que serán utilizadas por el Compose. Luego, ejecute el siguiente comando para establecer las variables de entorno:
```bash
. dotenv.sh
# Seleccione la opción 1
```

## 3) Configurar Secrets
Configure el archivo `.secrets` y ejecute el siguiente comando para establecer los secretos:
```bash
. dotsecrets.sh
# Seleccione la opción 1
```

## 4) Levantar Docker Swarm
Ejecute el siguiente comando para iniciar el proyecto:
```bash
docker stack deploy -c docker-compose.yml cms
```
Para eliminar el stack de dokcer ejecute:
```bash
docker stack rm  cms
```

**Nota**: Si desea agregar nodos worker, se recomienda revisar la siguiente documentación:
[Documentacion de Swarm - Network](https://docs.docker.com/engine/swarm/networking/)

**ERROR "is a directory"**: Si le ocurre este error, recargue la consola ejecutando `source ~/.bashrc` y vuelva al paso 3.
