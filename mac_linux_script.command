#!/bin/bash
cd "$(dirname "$0")"

echo "Iniciando entorno de bases de datos UNAD..."

docker compose up -d

if [ $? -ne 0 ]; then
    echo ""
    echo "ERROR: No se pudo iniciar el entorno."
    echo "Asegurate de que Docker Desktop este abierto e intentalo de nuevo."
    exit 1
fi

echo ""
echo "Esperando a que el entorno este listo..."

TIMEOUT=90
ELAPSED=0

until curl -s http://localhost:8978 > /dev/null; do
    sleep 3
    ELAPSED=$((ELAPSED + 3))
    if [ $ELAPSED -ge $TIMEOUT ]; then
        echo ""
        echo "El entorno esta tardando mas de lo esperado en iniciar."
        echo "Si el navegador no carga, esperá un momento y accedé manualmente a:"
        echo "http://localhost:8978"
        open http://localhost:8978
        exit 0
    fi
done

echo "Listo! Abriendo navegador..."
echo "Usuario: el que configuraste al abrir por primera vez"
open http://localhost:8978