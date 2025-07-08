# Introducción a PostgreSQL

## ¿Qué es PostgreSQL?


PostgreSQL es un sistema de gestión de bases de datos relacional y de código abierto. Es conocido por su robustez, extensibilidad y cumplimiento con el estándar SQL. PostgreSQL es ampliamente utilizado en aplicaciones web, análisis de datos y sistemas empresariales.

 <img src="./assets/postgresql.png" alt="successful connection to mongo" width="50%"/>


### Características principales:
- **Código abierto**: Es gratuito y tiene una comunidad activa de desarrolladores.
- **Extensibilidad**: Permite agregar funciones personalizadas.
- **Soporte para transacciones**: Cumple con ACID (Atomicidad, Consistencia, Aislamiento, Durabilidad).
- **Compatibilidad con JSON**: Ideal para trabajar con datos semi-estructurados.

---

## Instalación básica de BBDD en local

### Usando Docker:
1. Asegúrate de tener Docker instalado.
2. Ejecuta el siguiente comando para iniciar un contenedor con PostgreSQL:
   ```bash
   docker run --name postgres-demo -e POSTGRES_PASSWORD=123456 -d -p 5432:5432 postgres
   ```
3. Verifica que el contenedor esté corriendo:
   ```bash
   docker ps
   ```

---

## Trabajando con pgAdmin4

### Acceso a pgAdmin4:
1. Abre pgAdmin4 desde tu navegador o aplicación instalada.
2. Conéctate a tu BBDD PostgreSQL local:
   - Host: `localhost`
   - Puerto: `5432`
   - Usuario: `postgres`
   - Contraseña: `123456`

### Crear una base de datos:
1. En el panel izquierdo, haz clic derecho en "Databases" y selecciona "Create > Database".
2. Ingresa el nombre de la base de datos, por ejemplo, `bootcamp_db`, y haz clic en "Save".

### Conexión a una base de datos en Render:

- [Tutorial | connect-your-deployed-postgresql-database-to-pgadmin](https://medium.com/@epcm18/connect-your-deployed-postgresql-database-to-pgadmin-8880e838de0c)

Si tu base de datos está alojada en Render, utiliza los datos de conexión proporcionados por la plataforma. Por ejemplo:

- **Host**: `dpg-abc123xyz.render.com`
- **Puerto**: `5432`
- **Usuario**: `render_user`
- **Contraseña**: `render_password`
- **Base de datos**: `render_db`

Para conectarte desde pgAdmin4:
1. En el panel izquierdo, haz clic derecho en "Servers" y selecciona "Create > Server".
2. En la pestaña "General", ingresa un nombre para el servidor, por ejemplo, `RenderDB`.
3. En la pestaña "Connection", completa los campos:
   - Host: `dpg-abc123xyz.render.com`
   - Port: `5432`
   - Username: `render_user`
   - Password: `render_password`
   - Database: `render_db`
4. Haz clic en "Save" para guardar la configuración y conectarte al servidor.

---

## Cargar un script SQL

### Pasos para cargar un script:
1. Descarga o crea un archivo SQL con los queries necesarios. Por ejemplo, `script_bootcamp.sql`.
2. En pgAdmin4, selecciona la base de datos donde deseas ejecutar el script.
3. Haz clic en el botón de "Query Tool" en la barra superior.
4. Carga el archivo SQL:
   - Haz clic en el ícono de carpeta para abrir un archivo.
   - Cargar fichero [queries.sql](./queries.sql)
5. Ejecuta el script haciendo clic en el botón de "Play" (triángulo verde).

### Ejemplo de script SQL:
```sql
-- Crear tabla
CREATE TABLE estudiantes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    edad INT,
    email VARCHAR(100)
);

-- Insertar datos
INSERT INTO estudiantes (nombre, edad, email)
VALUES 
('Juan Pérez', 25, 'juan.perez@example.com'),
('Ana Gómez', 22, 'ana.gomez@example.com'),
('Carlos López', 30, 'carlos.lopez@example.com'); -- Ejemplo adicional

-- Consultar datos
SELECT * FROM estudiantes;
```

---

## Recursos adicionales

- [Documentación oficial de PostgreSQL](https://www.postgresql.org/docs/)
- [Tutorial interactivo de PostgreSQL](https://www.tutorialspoint.com/postgresql/index.htm)
- [Guía oficial de pgAdmin4](https://www.pgadmin.org/docs/)
- [W3schools | PostgreSQL tutorial](https://www.w3schools.com/postgresql/)
- [PostgreSQL cheatsheet 1](https://neon.com/postgresql/postgresql-cheat-sheet)
- [PostgreSQL cheatsheet 2](https://quickref.me/postgres.html)
