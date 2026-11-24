# Documentación — Kodigo Grupo 12

Sitio de documentación técnica y registros de decisiones de arquitectura (ADRs) de **Kodigo — AI For Devs Jr. 5 (Grupo 12)**, construido con [Jekyll](https://jekyllrb.com/) y [`jekyll-vitepress-theme`](https://jekyll-vitepress.dev/).

## Desarrollo local

```bash
make setup
make serve
make build
make clean
```

`make setup` instala el Ruby 3.4 que fija el repositorio y después las gemas. Si `mise` no está, el comando lo dice y sigue con el Ruby del sistema.

`make serve` abre el sitio en `http://localhost:4000/documentacion/`. El puerto de partida es 4000 y se cambia con `PORT`. Si ese puerto está ocupado, el comando usa el siguiente libre y muestra la URL real.

`make build` genera el sitio. `make clean` borra esa salida y la caché.

`make` sin argumentos muestra la ayuda y no compila.
