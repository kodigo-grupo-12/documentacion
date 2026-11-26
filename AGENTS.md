# AGENTS.md — documentacion

Guía rápida para agentes y personas que trabajan en este repo.

## Validación rápida

Todo va por make, desde la raíz:

```bash
make setup   # instala el Ruby 3.4 del mise.toml y las gemas
make serve   # abre el sitio en http://localhost:4000/documentacion/
make build   # genera el sitio
make clean   # borra la salida y la caché
```

`make serve` no termina. El puerto de partida es 4000 y se cambia con `PORT`; si está ocupado, usa el siguiente libre y muestra la URL real. Si mise no está, el comando lo dice y sigue con el Ruby del sistema. `make` sin argumentos muestra la ayuda y no compila.

## Estructura

```
_adr/               decisiones de arquitectura (0000 es la plantilla, indice.md lista todo)
_propuesta/         propuesta del proyecto
_guides/            guías
_prd/               documentos de producto
_data/sidebar.yml   navegación del sitio
```
