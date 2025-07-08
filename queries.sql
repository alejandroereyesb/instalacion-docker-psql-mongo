-- Fichero seeder para reproducir la BBDD en PostgreSQL

-- Eliminar tablas si existen
DROP TABLE IF EXISTS entries CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS authors CASCADE;

-- Crear tabla authors
CREATE TABLE authors (
  id_author serial NOT NULL PRIMARY KEY, 
  name varchar(45) NOT NULL, 
  surname varchar(45) NOT NULL, 
  email varchar(100) NOT NULL UNIQUE,
  image varchar(255)
);

-- Crear tabla categories
CREATE TABLE categories (
  id_category serial NOT NULL PRIMARY KEY,
  name varchar(50) NOT NULL UNIQUE
);

-- Crear tabla entries
CREATE TABLE entries (
  id_entry serial NOT NULL PRIMARY KEY, 
  title varchar(100) NOT NULL, 
  content text NOT NULL, 
  date date DEFAULT CURRENT_DATE,
  id_author int,
  id_category int,
  FOREIGN KEY (id_author) REFERENCES authors(id_author),
  FOREIGN KEY (id_category) REFERENCES categories(id_category)
);

-- Insertar datos en tabla authors
INSERT INTO authors(name, surname, email, image)
VALUES
('Alejandru', 'Regex', 'alejandru@thebridgeschool.es', 'https://randomuser.me/api/portraits/thumb/men/75.jpg'),
('Birja', 'Rivera', 'birja@thebridgeschool.es', 'https://randomuser.me/api/portraits/thumb/men/60.jpg'),
('Alvaru', 'Riveru', 'alvaru@thebridgeschool.es', 'https://randomuser.me/api/portraits/thumb/men/45.jpg');

-- Insertar datos en tabla categories
INSERT INTO categories(name)
VALUES
('Tiempo'),
('Sucesos'),
('Deportes'),
('Ciencia');

-- Insertar datos en tabla entries
INSERT INTO entries(title, content, id_author, id_category)
VALUES 
('Noticia: SOL en Madrid', 'Contenido noticia 1', (SELECT id_author FROM authors WHERE email='alejandru@thebridgeschool.es'), (SELECT id_category FROM categories WHERE name='Tiempo')),
('Un panda suelto por la ciudad', 'El panda se comió todas las frutas de una tienda', (SELECT id_author FROM authors WHERE email='birja@thebridgeschool.es'), (SELECT id_category FROM categories WHERE name='Sucesos')),
('El rayo gana la champions', 'Victoria por goleada en la final de la champions', (SELECT id_author FROM authors WHERE email='alvaru@thebridgeschool.es'), (SELECT id_category FROM categories WHERE name='Deportes'));

-- Consultar todas las entradas con sus autores y categorías
SELECT e.title, e.content, e.date, c.name AS category, a.name AS author_name, a.surname AS author_surname
FROM entries AS e
INNER JOIN authors AS a ON e.id_author = a.id_author
INNER JOIN categories AS c ON e.id_category = c.id_category;

-- Consultar entradas de un autor específico con su categoría
SELECT e.title, e.content, e.date, c.name AS category
FROM entries AS e
INNER JOIN categories AS c ON e.id_category = c.id_category
WHERE e.id_author = (SELECT id_author FROM authors WHERE email='alejandru@thebridgeschool.es');

-- Consultar todas las categorías con el número de entradas asociadas
SELECT c.name AS category, COUNT(e.id_entry) AS total_entries
FROM categories AS c
LEFT JOIN entries AS e ON c.id_category = e.id_category
GROUP BY c.name
ORDER BY total_entries DESC;

-- Consultar autores con sus entradas y categorías
SELECT a.name AS author_name, a.surname AS author_surname, e.title AS entry_title, c.name AS category
FROM authors AS a
INNER JOIN entries AS e ON a.id_author = e.id_author
INNER JOIN categories AS c ON e.id_category = c.id_category
ORDER BY a.name, e.title;

-- Buscar autores cuyo email contiene 'thebridge'
SELECT * 
FROM authors
WHERE email ~ 'thebridge';

-- Buscar entradas cuyo título comienza con la palabra 'Noticia'
SELECT * 
FROM entries
WHERE title ~* '^Noticia';

-- Buscar entradas cuyo contenido contiene números
SELECT * 
FROM entries
WHERE content ~ '[0-9]';

-- Buscar autores cuyo nombre termina en 'u'
SELECT * 
FROM authors
WHERE name ~ 'u$';