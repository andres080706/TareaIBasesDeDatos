

DROP TABLE dbo.Empleado

CREATE TABLE dbo.Empleado(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Nombre varchar(128),
	Salario MONEY
	);


Insert INTO dbo.Empleado (Nombre, Salario)
Values ('Luc�a Morales',2112),
('Luc�a Ramos',2238),
('Valentina Mart�nez',2730),
('Luc�a Rodr�guez',2089),
('Fernando Ramos',2305),
('Luc�a Silva',2577),
('Daniela Ram�rez',2317),
('Luc�a Castillo',2644),
('Isabella Morales',2062),
('Ricardo Ram�rez',2531),
('Sof�a P�rez',2899),
('Diego P�rez',2658),
('Jorge Silva',2763),
('Jorge Ramos',2596),
('Sof�a Castillo',2724),
('Carlos Vargas',2246),
('Jorge Hern�ndez',2916),
('Camila Ram�rez',2083),
('Daniela Jim�nez',2981),
('Fernando Ortiz',2520),
('Gabriela Ram�rez',2444),
('Carlos Rodr�guez',2491),
('Daniela Ram�rez',2608),
('Valentina Ramos',2338),
('Daniela P�rez',2685),
('Jorge S�nchez',2877),
('Paula Mendoza',2497),
('Pablo Gonz�lez',2721),
('Paula Silva',2880),
('Alejandro Torres',2373),
('Valentina G�mez',2619),
('Ricardo Jim�nez',2656),
('Mar�a Ortiz',2950),
('Camila Castillo',2701),
('Valentina G�mez',2364),
('Luc�a Rodr�guez',2023),
('Mar�a Gonz�lez',2163),
('Andr�s Hern�ndez',2480),
('Valentina Gonz�lez',2281),
('Andr�s Vargas',2861),
('Joshua Barrantes', 2500),
('Emilio Masis', 3200),
('Sebastian Azofeifa', 2800),
('Marina Gomez', 3500),
('Luis Hernandez', 5000)
SELECT * FROM Empleado