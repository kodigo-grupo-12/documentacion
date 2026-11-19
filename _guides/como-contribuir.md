---
title: Cómo contribuir
nav_order: 2
description: Repositorios a clonar, configuración con mise y flujo de trabajo con Pull Requests en kodigo-grupo-12.
---

# Cómo contribuir

Esta documentación está construida con [`jekyll-vitepress-theme`](https://jekyll-vitepress.dev/).

## Repositorios de la organización

| Repositorio | Propósito | URL para clonar (HTTPS) |
| :--- | :--- | :--- |
| **`documentacion`** | Este sitio de documentación, propuesta y ADRs | `https://github.com/kodigo-grupo-12/documentacion.git` |
| **`.github`** | Perfil de la organización (`profile/README.md`) | `https://github.com/kodigo-grupo-12/.github.git` |
| **`monorepo`** *(pendiente)* | Código fuente del proyecto (Android + RubyLLM) | `https://github.com/kodigo-grupo-12/monorepo.git` |

### Clonar rápidamente

```bash
# Repositorio de documentación
git clone https://github.com/kodigo-grupo-12/documentacion.git

# Repositorio de perfil de la organización (para agregar tu nombre)
git clone https://github.com/kodigo-grupo-12/.github.git
```

*(Si usas SSH, sustituye `https://github.com/` por `git@github.com:`.)*

## Requisitos previos (`mise`)

Usamos [**`mise`**](https://mise.jdx.dev/installing-mise.html) como único gestor multiplataforma para que todo el equipo use exactamente la misma versión de Ruby (`3.4`, definida en `mise.toml`).

1. **Instala `mise`** ([guía oficial de instalación](https://mise.jdx.dev/installing-mise.html)):

```powershell
# Windows (PowerShell)
winget install jdx.mise
```

```bash
# macOS / Linux
curl https://mise.run | sh
```

2. **Instala la versión de Ruby del proyecto** dentro de la carpeta `documentacion`:

```bash
cd documentacion
mise install
```

> **¿Por qué `mise.toml`?** Este repositorio ya incluye un archivo `mise.toml` en la raíz con `ruby = "3.4"`, por lo que cualquier integrante del equipo en **Windows, macOS o Linux** solo necesita ejecutar `mise install` para obtener exactamente la misma versión de Ruby.

> **Tip:** Si solo necesitas redactar o corregir texto en `_propuesta/` o `_adr/` sin levantar el sitio en local, también puedes editar el archivo directamente desde la web de GitHub creando una rama y Pull Request.

## Ejecutar la documentación en local

1. Instala las dependencias del proyecto:

```bash
mise exec -- bundle install
```

2. Levanta el servidor local con recarga automática:

```bash
mise exec -- bundle exec jekyll serve --livereload
```

3. Abre el sitio en tu navegador en `http://localhost:4000/documentacion/`.

## Flujo de cambios

1. Crea una rama nueva a partir de `main`:

```bash
git checkout -b docs/descripcion-corta
```

2. Agrega o edita archivos Markdown en `_propuesta/`, `_guides/` o `_adr/`.
3. Verifica que el sitio compile sin errores:

```bash
mise exec -- bundle exec jekyll build
```

4. Haz commit y sube tu rama:

```bash
git add .
git commit -m "docs: 📝 descripcion breve del cambio"
git push -u origin docs/descripcion-corta
```

5. Abre un **Pull Request** hacia `main`. En este repositorio de documentación no se requiere aprobación de un revisor: puedes hacer **merge** directo de tu PR y GitHub Pages actualizará el sitio automáticamente.
