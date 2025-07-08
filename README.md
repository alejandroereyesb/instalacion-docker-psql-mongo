![logotipo de The Bridge](https://user-images.githubusercontent.com/27650532/77754601-e8365180-702b-11ea-8bed-5bc14a43f869.png  "logotipo de The Bridge")

# Tutorial de instalación y uso de Docker, MongoDB y PostgreSQL

  
## Paso 1: Registro en Docker e instalación de Docker Desktop

1.- Entra en https://hub.docker.com/ y haz click en el botón "Register" en la esquina superior derecha, completa el registro.

---
  
### WINDOWS
2.- Descarga Docker Desktop para Windows desde este [enlace](https://www.docker.com/products/docker-desktop)
  
Una vez descargado, abre el instalador y sigue las instrucciones en pantalla (selecciona "use WSL2 instead of Hyper-V" cuando te lo pregunte)

Tras la instalación, reinicia tu sistema.

---
### macOS 

2.- Instalar [Docker](https://docs.docker.com/desktop/install/mac-install/).
Descargar dmg, arrastrar a carpeta aplicaciones
 
---

3.- Verifica que Docker se instaló correctamente abriendo una terminal y ejecutando el siguiente comando:
  

```docker --version```


Deberías ver algo similar a:

``Docker version XX.XX.X, build 55c4c88``

En la terminal, ejecuta 

`docker run hello-world`

Deberías ver algo como esto 

```bash
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
e6590344b1a5: Pull complete
Digest: sha256:c41088499908a59aae84b0a49c70e86f4731e588a737f1637e73c8c09d995654
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```


## Paso 2: Creación y uso de contenedores Docker de PostgreSQL

- [Introducción y uso de PostgreSQL + PGAdmin4](./intro_postgresql.md)

Debemos crear el contenedor de Docker para PostgreSQL. En dicho contenedor se ejecutará nuestro servidor de BBDD PostgreSQL en tu máquina local.

*En macOS, asegurate de que Docker Desktop está abierto de esta forma se inicia un proceso en segundo plano que permite ejecutar los comandos por terminal*


Ejecuta este comando para ello:


``docker run --name some-postgres -e POSTGRES_PASSWORD=123456 -d -p 5432:5432 postgres``


IMPORTANTE--> Tu password será '123456'

*En macOS puede solicitar ejecutar el comando como super usuario, añadir* sudo *al comienzo del comando*

## Paso 3: Acceso a los contenedores con pgAdmin4
  
### PgAdmin4

 - Descarga e instala pgAdmin4:
   - [Download PGAdmin4](https://www.pgadmin.org/download/)

 - Inicia pgAdmin4

 - Haz clic en "Add New Server".

 - En la pestaña "General", asigna un nombre a la conexión, da igual
   cual sea.


En la pestaña "Connection", introduce:

 - En "hostname" : localhost
 - En "Port": 5432
 - En Maintenance Database : postgres
 - En Username: postgres
 - Utiliza el password que utilizaste al crear el contenedor &rarr; 123456
 - Marca "Save Password"

Haz clic en "Save" para guardar la conexión.\
<img alt="connection" src="./assets/Conexion.png" width="50%">


¡Ahora deberías poder interactuar con tu base de datos PostgreSQL a través de pgAdmin4!

Deberías poder ver la conexión a la izquierda en PG Admin 4:

<img src="./assets/server_ok.png" alt="successful connection pgadmin" width="50%"/>



## Paso 4: Pasos para crear y usar contenedor de MongoDB


Ejecuta este comando para ello:

``docker run --name some-mongo -d -p 27017:27017 mongo``


### MongoDB Compass

Compass es el visor de las bases de datos de MongoDB, para utilizarlo sigue los siguientes pasos:


 - Descarga e instala MongoDB Compass: 
    - [Windows](https://www.mongodb.com/try/download/compass)
    - [macOS](https://www.mongodb.com/try/download/compass) v.1.37 (stable), usar dmg 
    <p></p>


 - Inicia MongoDB Compass.
   
     
 - En el campo "URI", introduce 'mongodb://localhost:27017' y haz clic  
   en "Connect".
   
 Deberías poder ver las bases de datos del contenedor:
 
 <img src="./assets/mongo_success.png" alt="successful connection to mongo" width="50%"/>


Fuentes 

[docker macOS](https://docs.docker.com/desktop/install/mac-install/)\
[docker Windows](https://docs.docker.com/desktop/install/windows-install/)\
[pgAdmin](https://www.pgadmin.org/download/)\
[compass](https://www.mongodb.com/products/compass)\
[docker postgresql](https://hub.docker.com/_/postgres)\
[docker mongo](https://hub.docker.com/_/mongo)
