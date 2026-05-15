@echo off
cd /d "%~dp0"

echo Iniciando entorno de bases de datos UNAD...

docker compose up -d

if %errorlevel% neq 0 (
    echo.
    echo ERROR: No se pudo iniciar el entorno.
    echo Asegurate de que Docker Desktop este abierto e intentalo de nuevo.
    pause
    exit /b 1
)

echo.
echo Esperando a que el entorno este listo...

:wait
curl -s http://localhost:8978 >nul 2>&1
echo.
if %errorlevel% neq 0 (
    timeout /t 2 /nobreak >nul
    goto wait
)

echo Listo! Abriendo navegador...
echo Usuario: estudiante@unad.edu.co
echo Contrasena: unad2026
start http://localhost:8978
pause