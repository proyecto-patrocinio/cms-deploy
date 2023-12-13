# Despliegue - Case Managment System
Este proyecto utiliza Docker Swarm para orquestar los contenedores necesarios para la plataforma.

A continuación, se detallan los pasos para desplegar la plataforma. Desde el host del nodo manager, siga estos pasos en una terminal "bash"...

## 1) Crear Nodo Manager
Ejecute el siguiente comando para crear el nodo manager:
```bash
docker swarm init
```

## 2) Configurar Variables de Entorno
Configure el archivo `.env` y ejecute el siguiente comando para establecer las variables de entorno:
```bash
. dotenv.sh
```

## 3) Configurar Secrets
Configure el archivo `.secrets` y ejecute el siguiente comando para establecer los secretos:
```bash
. dotsecrets.sh
```

## 4) Levantar Docker Swarm
Ejecute el siguiente comando para iniciar el proyecto:
```bash
docker stack deploy -c docker-compose.yml case-management-system
```

**Nota**: Si desea agregar nodos worker, se recomienda revisar la siguiente documentación:
[Documentacion de Swarm - Network](https://docs.docker.com/engine/swarm/networking/)
