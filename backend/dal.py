from typing import Any, Dict, List

CONN_STR = (
    "DRIVER={ODBC Driver 18 for SQL Server};"
    "SERVER=25.39.62.157;"
    "DATABASE=DBEmpresa;"
    "UID=sa;"
    "PWD=contrabases1234;"
    "Encrypt=Yes;"
    "TrustServerCertificate=Yes;"
)

class SqlServerDAL:
    def __init__(self, conn_str: str):
        self.conn_str = conn_str

    def listar_empleados(self) -> List[Dict[str, Any]]:
        import pyodbc
        with pyodbc.connect(self.conn_str) as cn:
            cur = cn.cursor()
            cur.execute("EXEC dbo.sp_ListarEmpleados")
            rows = cur.fetchall()
            return [{"id": int(r[0]), "nombre": str(r[1]), "salario": float(r[2])} for r in rows]

    def insertar_empleado(self, nombre: str, salario: float) -> Dict[str, Any]:
        import pyodbc
        with pyodbc.connect(self.conn_str) as cn:
            cur = cn.cursor()
    
            cur.execute("EXEC dbo.sp_InsertarEmpleado ?, ?", (nombre, salario))
            row = cur.fetchone()
            if not row:
                return {"code": -999, "message": "SP sin resultado"}
            return {"code": int(row[0]), "message": str(row[1])}

dal = SqlServerDAL(CONN_STR)
