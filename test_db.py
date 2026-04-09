from db import get_db

try:
    db = get_db()  # tente la connexion
    print("✅ Connexion réussie !")

    cursor = db.cursor()
    cursor.execute("SHOW TABLES")  # liste les tables
    tables = cursor.fetchall()
    print("Tables dans la base :")
    for table in tables:
        print("-", table[0])

except Exception as e:
    print(" Erreur de connexion :", e)