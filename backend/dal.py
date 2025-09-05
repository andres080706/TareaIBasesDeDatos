from typing import Any, Dict, List

_MEM_EMPLEADOS: List[Dict[str, Any]] = [
    {"id": 1, "nombre": "Ana López",      "salario": 500000.00},
    {"id": 2, "nombre": "Juan Pérez",     "salario": 450000.00},
    {"id": 3, "nombre": "María Gómez",    "salario": 520000.00},
    {"id": 4, "nombre": "Carlos Ramírez", "salario": 470000.00},
]
_MEM_NEXT_ID = 5

def _colapsar_espacios(texto: str) -> str:
    return " ".join(texto.strip().split())

def _norm(nombre: str) -> str:
    return _colapsar_espacios(nombre).casefold()

class MemoryDAL:
    def listar_empleados(self) -> List[Dict[str, Any]]:
        data = sorted(_MEM_EMPLEADOS, key=lambda e: e["nombre"].casefold())
        return [{"id": e["id"], "nombre": e["nombre"], "salario": e["salario"]} for e in data]

    def insertar_empleado(self, nombre: str, salario: float) -> Dict[str, Any]:
        global _MEM_NEXT_ID
        for e in _MEM_EMPLEADOS:
            if _norm(e["nombre"]) == _norm(nombre):
                return {"code": 1, "message": "Nombre de Empleado ya existe."}

        nuevo = {"id": _MEM_NEXT_ID, "nombre": _colapsar_espacios(nombre), "salario": float(salario)}
        _MEM_EMPLEADOS.append(nuevo)
        _MEM_NEXT_ID += 1
        return {"code": 0, "message": "OK"}


""" 
class SqlServerDAL:
    def __init__(self, conn_str: str):
        self.conn_str = conn_str

    def listar_empleados(self) -> List[Dict[str, Any]]:
        import pyodbc  # import local para evitar dependencia hoy
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
"""

dal = MemoryDAL()