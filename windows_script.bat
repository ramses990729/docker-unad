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

set TIMEOUT=90
set ELAPSED=0

:wait
curl -s http://localhost:8978 >nul 2>&1
if %errorlevel% neq 0 (
    timeout /t 3 /nobreak >nul
    set /a ELAPSED+=3
    if %ELAPSED% geq %TIMEOUT% (
        echo.
        echo El entorno esta tardando mas de lo esperado en iniciar.
        echo Si el navegador no carga, espera un momento y accede manualmente a:
        echo http://localhost:8978
        start http://localhost:8978
        exit /b 0
    )
    goto wait
)

echo Listo! Abriendo navegador...
start http://localhost:8978
pause