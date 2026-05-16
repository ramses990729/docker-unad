# docker-unad

Entorno de bases de datos listo para usar, pensado para estudiantes y profesores de los programas de ingeniería de la UNAD. Inicialmente, la idea es que un solo doble clic poseas acceso a PostgreSQL y CloudBeaver corriendo en tu máquina, sin instalar nada adicional ni depender de versiones específicas de software.

## ¿Para qué sirve?

Los cursos de ingeniería en la UNAD (en este caso específico, cubrimos herramientas de los de bases de datos, pero aplica para muchos otros) requieren herramientas que históricamente han sido difíciles de instalar y configurar correctamente. Este proyecto empaqueta todo lo necesario en contenedores Docker, garantizando que el entorno sea idéntico para todos los estudiantes independientemente de su sistema operativo.

Con este entorno podremos:
- Crear bases de datos, esquemas y tablas
- Ejecutar scripts SQL
- Practicar INSERT, UPDATE, DELETE y SELECT
- Crear procedimientos almacenados, triggers y funciones

## Prerrequisitos

Solo necesitarías instalar **Docker Desktop** una vez:
- [Descargar Docker Desktop](https://www.docker.com/products/docker-desktop/)

Asegurate de que Docker Desktop esté **abierto y corriendo** antes de ejecutar el script.

## Cómo usarlo

1. Descarga o clona este repositorio
2. Ejecuta el script según tu sistema operativo:
   - **Windows:** doble clic en `windows_script.bat`
   - **Mac/Linux:** doble clic en `mac_linux_script.command`
3. Espera a que el navegador se abra automáticamente en `http://localhost:8978` (se usó el puerto 8978 para no ocupar el comúnmente usado 8080 y así no tener conflictos con potenciales aplicaciones que tengan corriendo allí)

## Credenciales

| Campo | Valor |
|-------|-------|
| URL | http://localhost:8978 |
| Usuario del servidor de CloudBeaver (primer arranque) | lo configuras al abrir la app por primera vez|

### Conectarse a la base de datos desde CloudBeaver

| Campo | Valor |
|-------|-------|
| Host | `postgres` |
| Puerto | `5432` |
| Base de datos | `basesdatos` |
| Usuario | `unad` |
| Contraseña | `unad2026` |

> **Importante:** el host es `postgres` y no `localhost`. Ambos servicios corren dentro de la red de Docker y se comunican por nombre de servicio.

## Estructura del proyecto

```
docker-unad/
├── docker-compose.yml        # Define los servicios PostgreSQL y CloudBeaver
├── mac_linux_script.command  # Script de inicio para Mac/Linux
├── windows_script.bat        # Script de inicio para Windows
└── README.md
```

## Modelado de bases de datos

Para diagramas entidad-relación no necesitás instalar nada adicional. Puedes usar [draw.io](https://app.diagrams.net/) directamente desde el navegador, que tiene soporte nativo para diagramas de bases de datos.

## Iniciativa

Este proyecto es parte de una acción solidaria desarrollada en el marco de la Prestación del Servicio Social Unadista, en colaboración con el semillero de investigación de la Escuela de Ciencias Básicas, Tecnología e Ingeniería (ECBTI) del CCAV Neiva. La idea es que los profesores puedan crear sus propios entornos personalizados según las herramientas que requiera cada curso.

## Licencia

GPL-3.0 — libre para usar, modificar y distribuir.
