#!/bin/bash
echo "Iniciando entorno de bases de datos UNAD..."
cd "$(dirname "$0")"

docker compose up -d

if [ $? -ne 0 ]; then
    echo ""
    echo "ERROR: No se pudo iniciar el entorno."
    echo "Asegurate de que Docker Desktop este abierto e intentalo de nuevo."
    exit 1
fi

echo ""
echo "Esperando a que el entorno este listo..."

until curl -s http://localhost:8978 > /dev/null; do
    echo -n "."
    sleep 2
done

echo "Listo! Abriendo navegador..."
echo "Usuario: estudiante@unad.edu.co"
echo "Contrasena: unad2026"
open http://localhost:8978