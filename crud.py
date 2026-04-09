from db import get_db

def fetch_all(table_name: str):
    db = get_db()
    cursor = db.cursor(dictionary=True)
    cursor.execute(f"SELECT * FROM {table_name}")
    return cursor.fetchall()

def fetch_query(sql: str):
    db = get_db()
    cursor = db.cursor(dictionary=True)
    cursor.execute(sql)
    return cursor.fetchall()