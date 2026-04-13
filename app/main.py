from fastapi import FastAPI, HTTPException
from app.database import get_db_connection
from app.utils import generate_sql_from_text, execute_query # Ajoute cette ligne

app = FastAPI(title="TranspoBot API")

@app.get("/")
def home():
    return {"message": "Bienvenue sur l'API TranspoBot (ESP/UCAD)"}

@app.get("/test-db")
def test_db():
    conn = get_db_connection()
    if conn and conn.is_connected():
        conn.close()
        return {"status": "Succès", "message": "Connexion à la base de données réussie !"}
    raise HTTPException(status_code=500, detail="Impossible de se connecter")

# --- NOUVELLE ROUTE ---
@app.get("/chat")
def chat_with_bot(question: str):
    sql_query = generate_sql_from_text(question)
    data = execute_query(sql_query)
    return {
        "question": question,
        "query_generated": sql_query,
        "results": data
    }
