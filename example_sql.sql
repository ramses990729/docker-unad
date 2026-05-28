CREATE TABLE estudiante (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    programa VARCHAR(150) NOT NULL,
    fecha_ingreso DATE DEFAULT CURRENT_DATE
);

INSERT INTO estudiante (nombre, programa) VALUES
    ('Carlos Gómez', 'Ingeniería de Sistemas'),
    ('María López', 'Ingeniería Industrial'),
    ('Andrés Torres', 'Ingeniería de Telecomunicaciones');

SELECT * FROM estudiante;