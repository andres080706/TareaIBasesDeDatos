

DROP TABLE dbo.Empleado

CREATE TABLE dbo.Empleado(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Nombre varchar(128),
	Salario MONEY
	);


Insert INTO dbo.Empleado (Nombre, Salario)
Values ('Lucía Morales',2112),
('Lucía Ramos',2238),
('Valentina Martínez',2730),
('Lucía Rodríguez',2089),
('Fernando Ramos',2305),
('Lucía Silva',2577),
('Daniela Ramírez',2317),
('Lucía Castillo',2644),
('Isabella Morales',2062),
('Ricardo Ramírez',2531),
('Sofía Pérez',2899),
('Diego Pérez',2658),
('Jorge Silva',2763),
('Jorge Ramos',2596),
('Sofía Castillo',2724),
('Carlos Vargas',2246),
('Jorge Hernández',2916),
('Camila Ramírez',2083),
('Daniela Jiménez',2981),
('Fernando Ortiz',2520),
('Gabriela Ramírez',2444),
('Carlos Rodríguez',2491),
('Daniela Ramírez',2608),
('Valentina Ramos',2338),
('Daniela Pérez',2685),
('Jorge Sánchez',2877),
('Paula Mendoza',2497),
('Pablo González',2721),
('Paula Silva',2880),
('Alejandro Torres',2373),
('Valentina Gómez',2619),
('Ricardo Jiménez',2656),
('María Ortiz',2950),
('Camila Castillo',2701),
('Valentina Gómez',2364),
('Lucía Rodríguez',2023),
('María González',2163),
('Andrés Hernández',2480),
('Valentina González',2281),
('Andrés Vargas',2861),
('Joshua Barrantes', 2500),
('Emilio Masis', 3200),
('Sebastian Azofeifa', 2800),
('Marina Gomez', 3500),
('Luis Hernandez', 5000)
SELECT * FROM Empleado