--Creación de la base de Datos
CREATE DATABASE MasterPokeData;

--Creación de la tabla de Pokemones
CREATE TABLE pokemones(
	id SERIAL PRIMARY KEY, 
	nombre VARCHAR(50) NOT NULL,
	tipo VARCHAR(50),
	habilidad VARCHAR(50),
	ataque INT,
	defensa INT,
	velocidad INT
);

--Creación de la tabla de Entrenadores
CREATE TABLE entrenadores (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    edad INT,
    ciudad VARCHAR(50)
);


-- Reiniciar tablas
TRUNCATE TABLE entrenadores RESTART IDENTITY CASCADE;
TRUNCATE TABLE pokemones RESTART IDENTITY CASCADE;

-- Insertar datos en la tabla de Entrenadores
INSERT INTO entrenadores (nombre, edad, ciudad) VALUES 
('Ash', 10, 'Pueblo Paleta'),
('Misty', 12, 'Ciudad Celeste'),
('Brock', 15, 'Ciudad Plateada'),
('Gary', 11, 'Pueblo Paleta'),
('Tracey', 13, 'Isla Valencia'),
('May', 10, 'Ciudad Petalia'),
('Dawn', 10, 'Pueblo Hojaverde'),
('Iris', 12, 'Pueblo Esmalte'),
('Cilan', 14, 'Ciudad Gres'),
('Serena', 10, 'Ciudad Vaniville');

-- Insertar datos en la tabla de Pokemones
INSERT INTO pokemones (nombre, tipo, habilidad, ataque, defensa, velocidad) VALUES
('Pikachu', 'Eléctrico', 'Electricidad Estática', 55, 40, 90),
('Charmander', 'Fuego', 'Mar Llamas', 52, 43, 65),
('Bulbasaur', 'Planta/Veneno', 'Espesura', 49, 49, 45),
('Squirtle', 'Agua', 'Torrente', 48, 65, 43),
('Jigglypuff', 'Normal/Hada', 'Gran Encanto', 45, 20, 20),
('Meowth', 'Normal', 'Recogida', 45, 35, 90),
('Psyduck', 'Agua', 'Despiste', 52, 48, 55),
('Machop', 'Lucha', 'Agallas', 80, 50, 35),
('Geodude', 'Roca/Tierra', 'Cabeza Roca', 80, 100, 20),
('Slowpoke', 'Agua/Psíquico', 'Despiste', 65, 65, 15),
('Magnemite', 'Eléctrico/Acero', 'Imán', 35, 70, 45),
('Farfetchd', 'Normal/Volador', 'Foco Interno', 65, 55, 60),
('Gastly', 'Fantasma/Veneno', 'Levita', 35, 30, 80),
('Onix', 'Roca/Tierra', 'Cabeza Roca', 45, 160, 70),
('Drowzee', 'Psíquico', 'Insomnio', 48, 45, 42),
('Krabby', 'Agua', 'Hiper Cutter', 105, 90, 50),
('Voltorb', 'Eléctrico', 'Levitación', 30, 50, 100),
('Exeggcute', 'Planta/Psíquico', 'Clorofila', 40, 80, 40),
('Cubone', 'Tierra', 'Pararrayos', 50, 95, 35),
('Hitmonlee', 'Lucha', 'Ojo Compuesto', 120, 53, 87);


--CRUD

--Añadir Entrenador y Pokemon
-- Añadir un nuevo entrenador
INSERT INTO entrenadores (nombre, edad, ciudad) VALUES ('Lana', 11, 'Pueblo Konikoni');

-- Añadir un nuevo Pokémon
INSERT INTO pokemones (nombre, tipo, habilidad, ataque, defensa, velocidad)
VALUES ('Charmander', 'Fuego', 'Mar de llamas', 52, 43, 65);


--Leer

-- Información de un entrenador específico
SELECT * FROM entrenadores WHERE nombre = 'Ash';

-- Información de un Pokémon específico
SELECT * FROM pokemones WHERE nombre = 'Pikachu';

-- Lista de todos los entrenadores
SELECT * FROM entrenadores;

-- Lista de todos los Pokémon
SELECT * FROM pokemones;


--Actualización
-- Modificar la ciudad de un entrenador
UPDATE entrenadores SET ciudad = 'Ciudad Verde' WHERE nombre = 'Ash';

-- Modificar la habilidad de un Pokémon
UPDATE pokemones SET habilidad = 'Pararrayos' WHERE nombre = 'Pikachu';

--Eliminar
-- Eliminar un entrenador
DELETE FROM entrenadores WHERE nombre = 'Gary';

-- Eliminar un Pokémon
DELETE FROM pokemones WHERE nombre = 'Pikachu';


--Creación de la tabla de relación Entrenadores y Pokemones
--Relación entre entrenadores y Pokémon
CREATE TABLE entrenador_pokemon (
    entrenador_id INT,
    pokemon_id INT,
    PRIMARY KEY (entrenador_id, pokemon_id),
    FOREIGN KEY (entrenador_id) REFERENCES entrenadores(id),
    FOREIGN KEY (pokemon_id) REFERENCES pokemones(id)
);

--Crear la tabla de Batallas
CREATE TABLE batallas (
    id SERIAL PRIMARY KEY,
    entrenador1_id INT,
    entrenador2_id INT,
    pokemon1_id INT,
    pokemon2_id INT,
    fecha DATE,
    resultado VARCHAR(50),
    FOREIGN KEY (entrenador1_id) REFERENCES entrenadores(id),
    FOREIGN KEY (entrenador2_id) REFERENCES entrenadores(id),
    FOREIGN KEY (pokemon1_id) REFERENCES pokemones(id),
    FOREIGN KEY (pokemon2_id) REFERENCES pokemones(id)
);

-- Asignar Pokémon a entrenadores

INSERT INTO entrenador_pokemon (entrenador_id, pokemon_id) VALUES
(1, 1), -- Ash tiene a Pikachu
(2, 2), -- Misty tiene a Charmander
(3, 3), -- Brock tiene a Bulbasaur
(4, 4), -- Gary tiene a Squirtle
(5, 5), -- Tracey tiene a Jigglypuff
(6, 6), -- May tiene a Meowth
(7, 7), -- Dawn tiene a Psyduck
(8, 8), -- Iris tiene a Machop
(9, 9), -- Cilan tiene a Geodude
(10, 10); -- Serena tiene a Slowpoke


-- Insertar batallas
INSERT INTO batallas (entrenador1_id, entrenador2_id, pokemon1_id, pokemon2_id, fecha, resultado) VALUES
(1, 2, 1, 2, '2024-07-01', 'Ash ganó'),
(3, 4, 3, 4, '2024-07-02', 'Gary ganó'),
(5, 6, 5, 6, '2024-07-03', 'May ganó'),
(7, 8, 7, 8, '2024-07-04', 'Dawn ganó'),
(9, 10, 9, 10, '2024-07-05', 'Cilan ganó');

-- Eliminar un entrenador y sus Pokémon relacionados
DELETE FROM pokemones
USING entrenador_pokemon
WHERE pokemones.id = entrenador_pokemon.pokemon_id
AND entrenador_pokemon.entrenador_id = (SELECT id FROM entrenadores WHERE nombre = 'Ash');

DELETE FROM entrenadores WHERE nombre = 'Ash';

-- Mostrar información detallada sobre Pokémon y sus entrenadores
SELECT e.nombre AS entrenador, p.nombre AS pokemones
FROM entrenadores e
JOIN entrenador_pokemon ep ON e.id = ep.entrenador_id
JOIN pokemones p ON p.id = ep.pokemon_id;

-- Mostrar información sobre las batallas incluyendo nombre de los entrenadores y Pokémon
SELECT b.fecha, e1.nombre AS entrenador1, p1.nombre AS pokemon1, e2.nombre AS entrenador2, p2.nombre AS pokemon2, b.resultado
FROM batallas b
JOIN entrenadores e1 ON b.entrenador1_id = e1.id
JOIN pokemones p1 ON b.pokemon1_id = p1.id
JOIN entrenadores e2 ON b.entrenador2_id = e2.id
JOIN pokemones p2 ON b.pokemon2_id = p2.id;
