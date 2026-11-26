<h3 align="center">
	<img src="https://raw.githubusercontent.com/kodigo-grupo-12/.github/main/Assets/kodigo_logo.png" width="100" alt="Kodigo Grupo 12"/><br/>
	Documentación
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
</h3>

<p align="center">
	Documentación técnica y registros de decisiones de arquitectura (ADRs) del Grupo 12 — Kodigo, AI For Devs Jr. 5.
</p>

<p align="center">
	<img src="https://img.shields.io/static/v1?style=for-the-badge&message=Jekyll&colorA=363a4f&colorB=f38ba8&logoColor=d9e0ee"/>
	<img src="https://img.shields.io/static/v1?style=for-the-badge&message=Ruby+3.4&colorA=363a4f&colorB=ee99a0&logoColor=d9e0ee"/>
	<a href="https://kodigo-grupo-12.github.io/documentacion/"><img src="https://img.shields.io/static/v1?style=for-the-badge&message=GitHub+Pages&colorA=363a4f&colorB=8aadf3&logoColor=d9e0ee"/></a>
</p>

<p align="center">
	<a href="https://kodigo-grupo-12.github.io/documentacion/">Sitio publicado</a> ·
	<a href="https://github.com/kodigo-grupo-12/monorepo">Monorepo de la app</a>
</p>

## Empezar

El sitio se construye con Jekyll y `jekyll-vitepress-theme`. Hace falta `make`; el Ruby 3.4 lo fija el `mise.toml` del repositorio y [mise](https://mise.jdx.dev/) lo instala solo (si no está, el comando lo dice y sigue con el Ruby del sistema).

```bash
git clone https://github.com/kodigo-grupo-12/documentacion.git
cd documentacion
make setup   # Ruby 3.4 y las gemas
make serve   # abre el sitio en local
```

`make serve` no termina y abre `http://localhost:4000/documentacion/`. El puerto de partida es 4000 y se cambia con `PORT`; si está ocupado, el comando usa el siguiente libre y muestra la URL real.

```bash
make build   # genera el sitio
make clean   # borra la salida y la caché
```

`make` sin argumentos muestra la ayuda y no compila.

## Estructura

```
_adr/               decisiones de arquitectura (0000 es la plantilla, indice.md lista todo)
_propuesta/         propuesta del proyecto
_guides/            guías
_prd/               documentos de producto
_data/sidebar.yml   navegación del sitio
```
