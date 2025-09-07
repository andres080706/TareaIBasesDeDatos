USE DBEmpresa;
GO

CREATE OR ALTER PROCEDURE dbo.sp_ListarEmpleados
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Id, Nombre, Salario
    FROM dbo.Empleado
    ORDER BY Nombre ASC;
END
GO
