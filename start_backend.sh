#!/bin/bash
cd /root/workspace/front-end-digital-humans

# Charger les variables d'environnement
set -a
source backend/.env
set +a

# Démarrer le backend sur le port 8002
python3 -m uvicorn app.main:app --host 0.0.0.0 --port 8002 --app-dir backend
