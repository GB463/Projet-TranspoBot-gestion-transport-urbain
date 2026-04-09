from pydantic import BaseModel
from typing import Optional

class Vehicule(BaseModel):
    id: Optional[int]
    immatriculation: str
    statut: str
    kilometrage: int

class Chauffeur(BaseModel):
    id: Optional[int]
    nom: str
    prenom: str
    telephone: str

class Trajet(BaseModel):
    id: Optional[int]
    chauffeur_id: int
    vehicule_id: int
    date_heure_depart: str
    date_heure_arrivee: Optional[str]
    statut: str

class Incident(BaseModel):
    id: Optional[int]
    trajet_id: int
    type: str
    gravite: str
    date_incident: str