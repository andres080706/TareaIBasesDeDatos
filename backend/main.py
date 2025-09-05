from fastapi import FastAPI
from fastapi.responses import JSONResponse
from typing import Any, Dict
from backend.dal import dal 
from pathlib import Path
from fastapi.staticfiles import StaticFiles

app = FastAPI(title="API Empleados (simple)")

def _colapsar_espacios(texto: str) -> str:
    return " ".join(texto.strip().split())

def _es_nombre_valido(nombre: str) -> bool:
    if len(nombre) == 0:
        return False
    for ch in nombre:
        if ch.isalpha() or ch == " " or ch == "-":
            continue
        return False
    return True

def _a_numero_positivo(valor: Any) -> float:
    try:
        num = float(valor)
    except (TypeError, ValueError):
        raise ValueError("El salario debe ser numérico.")
    if num <= 0:
        raise ValueError("El salario debe ser positivo.")
    return num

@app.get("/api/ping")
def ping():
    return {"ok": True, "data": "pong"}

@app.get("/api/empleados")
def listar_empleados():
    data = dal.listar_empleados()
    return {"ok": True, "data": data}

@app.post("/api/empleados")
def insertar_empleado(payload: Dict[str, Any]):
    #Campos
    nombre_crudo = payload.get("nombre", "")
    salario_crudo = payload.get("salario", None)
    #Nombre
    if not isinstance(nombre_crudo, str):
        return JSONResponse(
            {"ok": False, "error": {"code": "VALIDATION_ERROR", "message": "El nombre es obligatorio (texto)."}},
            status_code=400
        )
    nombre = _colapsar_espacios(nombre_crudo)
    if not _es_nombre_valido(nombre):
        return JSONResponse(
            {"ok": False, "error": {"code": "VALIDATION_ERROR", "message": "El nombre solo permite letras, espacios y guiones."}},
            status_code=400
        )
    #Salario
    try:
        salario = _a_numero_positivo(salario_crudo)
    except ValueError as ex:
        return JSONResponse(
            {"ok": False, "error": {"code": "VALIDATION_ERROR", "message": str(ex)}},
            status_code=400
        )
    #DAL
    res = dal.insertar_empleado(nombre, float(salario))
    if res["code"] != 0:
        return JSONResponse(
            {"ok": False, "error": {"code": "DUPLICATE_NAME", "message": res.get("message", "Error")}},
            status_code=409
        )

    return JSONResponse({"ok": True}, status_code=201)

frontend_dir = Path(__file__).parent.parent / "frontend"
app.mount("/", StaticFiles(directory=str(frontend_dir), html=True), name="frontend")