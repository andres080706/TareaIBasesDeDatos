USE DBEmpresa;
GO


DROP TABLE dbo.Empleado

CREATE TABLE dbo.Empleado(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Nombre varchar(128),
	Salario MONEY
	);


Insert INTO dbo.Empleado (Nombre, Salario)
Values ('Lucia Morales',2112),
('Lucia Ramos',2238),
('Valentina Martinez',2730),
('Lucia Rodriguez',2089),
('Fernando Ramos',2305),
('Lucia Silva',2577),
('Daniela Osa',2317),
('Lucia Castillo',2644),
('Isabella Morales',2062),
('Ricardo Ramirez',2531),
('Sofia Perez',2899),
('Diego Perez',2658),
('Jorge Silva',2763),
('Jorge Ramos',2596),
('Sofia Castillo',2724),
('Carlos Vargas',2246),
('Jorge Hernandez',2916),
('Camila Ramirez',2083),
('Daniela Jimenez',2981),
('Fernando Ortiz',2520),
('Gabriela Ramirez',2444),
('Carlos Rodriguez',2491),
('Daniela Ramirez',2608),
('Valentina Ramos',2338),
('Daniela Perez',2685),
('Jorge Sanchez',2877),
('Paula Mendoza',2497),
('Pablo Gonzalez',2721),
('Paula Silva',2880),
('Alejandro Torres',2373),
('Valentina Gomez',2619),
('Ricardo Jimenez',2656),
('Maria Ortiz',2950),
('Camila Castillo',2701),
('Valentina Hernandez',2364),
('Lucia Benavidez',2023),
('Maria Gonzalez',2163),
('Andres Hernandez',2480),
('Valentina Gonzalez',2281),
('Andres Vargas',2861),
('Joshua Barrantes', 2500),
('Emilio Masis', 3200),
('Sebastian Azofeifa', 2800),
('Mariana Gomez', 3500),
('Luis Hernandez', 5000)
SELECT * FROM dbo.Empleado

