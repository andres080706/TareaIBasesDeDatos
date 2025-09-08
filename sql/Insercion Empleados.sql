USE DBEmpresa;
GO

CREATE OR ALTER PROCEDURE dbo.sp_InsertarEmpleado
    @Nombre VARCHAR(128),
    @Salario MONEY
AS
BEGIN
    SET NOCOUNT ON;

    SET @Nombre = LTRIM(RTRIM(@Nombre));


    IF (@Nombre IS NULL OR @Nombre = '')
    BEGIN
        SELECT CAST(1001 AS INT) AS code, N'El nombre es obligatorio.' AS message;
        RETURN;
    END

    IF (@Salario IS NULL OR @Salario <= 0)
    BEGIN
        SELECT CAST(1002 AS INT) AS code, N'El salario debe ser positivo.' AS message;
        RETURN;
    END

    IF EXISTS (
        SELECT 1
        FROM dbo.Empleado
        WHERE UPPER(LTRIM(RTRIM(Nombre))) = UPPER(@Nombre)
    )
    BEGIN
        SELECT CAST(1 AS INT) AS code, N'Nombre de Empleado ya existe.' AS message;
        RETURN;
    END

    INSERT INTO dbo.Empleado ( Nombre, Salario)
    VALUES (@Nombre, @Salario);

    SELECT CAST(0 AS INT) AS code, N'Ok' AS message;
END
GO
