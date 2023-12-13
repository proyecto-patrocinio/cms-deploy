# Despliegue - Case Managment System
Este proyecto utiliza Docker Swarm para orquestar los contenedores necesarios para la plataforma.


## Prerequisios
- Tener instalado Docker y Docker compose. (Docker engine > 1.13.0+)
- Tener pulleadas las imagenes referenciadas en el archivo `./env`


A continuación, se detallan los pasos para desplegar la plataforma. Desde el host del nodo manager, siga estos pasos en una terminal "bash"...

## 1) Crear Nodo Manager
Ejecute el siguiente comando para crear el nodo manager:
```bash
docker swarm init
```

## 2) Configurar Variables de Entorno
Configure el archivo `.env` y los archivos en el directorio `resources`. Luego ejecute el siguiente comando para establecer las variables de entorno:
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
docker stack deploy -c docker-compose.yml case-management-system
```
Para eliminar el stack de dokcer ejecute:
```bash
docker stack rm  case-management-system
```

**Nota**: Si desea agregar nodos worker, se recomienda revisar la siguiente documentación:
[Documentacion de Swarm - Network](https://docs.docker.com/engine/swarm/networking/)
