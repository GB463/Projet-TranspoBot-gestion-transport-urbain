from fastapi import FastAPI
from crud import fetch_all, fetch_query

app = FastAPI(title="TranspoBot API 🚀")

# --- Routes classiques ---
@app.get("/")
def home():
    return {"message": "Backend TranspoBot OK ✅"}

@app.get("/vehicules")
def get_vehicules():
    return fetch_all("vehicules")

@app.get("/chauffeurs")
def get_chauffeurs():
    return fetch_all("chauffeurs")

@app.get("/trajets")
def get_trajets():
    return fetch_all("trajets")

@app.get("/incidents")
def get_incidents():
    return fetch_all("incidents")

# --- Route IA sécurisée (Text-to-SQL) ---
@app.post("/query")
def run_query(sql: str):
    sql_lower = sql.lower()

    if "select" not in sql_lower:
        return {"error": "Seules les requêtes SELECT sont autorisées"}
    for word in ["delete", "update", "insert", "drop"]:
        if word in sql_lower:
            return {"error": "Requête interdite"}

    try:
        return fetch_query(sql)
    except Exception as e:
        return {"error": str(e)}