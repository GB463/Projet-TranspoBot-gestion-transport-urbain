import mysql.connector
import os
from app.database import get_db_connection

def execute_query(query):
    conn = get_db_connection()
    if conn:
        cursor = conn.cursor(dictionary=True)
        try:
            cursor.execute(query)
            result = cursor.fetchall()
            return result
        except Exception as e:
            return {"error": str(e)}
        finally:
            cursor.close()
            conn.close()
    return {"error": "Problème de connexion BDD"}

def generate_sql_from_text(question):
    """Transforme la question en SQL simple"""
    question = question.lower()
    if "chauffeur" in question:
        return "SELECT * FROM chauffeurs"
    elif "trajet" in question:
        return "SELECT * FROM trajets"
    else:
        return "SELECT 'Désolé, je ne comprends pas encore cette question' as message"
