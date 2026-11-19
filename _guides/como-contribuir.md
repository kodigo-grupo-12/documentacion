---
title: Cómo contribuir
nav_order: 2
description: Cómo ejecutar la documentación en local y proponer cambios mediante Pull Requests.
---

# Cómo contribuir

Esta documentación está construida con **Jekyll** y [`jekyll-vitepress-theme`](https://jekyll-vitepress.dev/).

## Ejecutar en local

1. Instala las dependencias:

```bash
bundle install
```

2. Levanta el servidor local con recarga automática:

```bash
bundle exec jekyll serve --livereload
```

3. Abre el sitio en tu navegador en `http://localhost:4000/documentacion/`.

## Flujo de cambios

1. Crea una rama a partir de `main`:

```bash
git checkout -b docs/descripcion-corta
```

2. Agrega o edita archivos Markdown en `_guides/` o `_adr/`.
3. Verifica que el sitio compile sin errores:

```bash
bundle exec jekyll build
```

4. Haz commit, sube tu rama y abre un **Pull Request** hacia `main`.
