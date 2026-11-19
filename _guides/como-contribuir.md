---
title: Cómo contribuir
nav_order: 2
description: Repositorios a clonar, ejecución en local y flujo de trabajo con Pull Requests en kodigo-grupo-12.
---

# Cómo contribuir

Esta documentación está construida con **Jekyll** y [`jekyll-vitepress-theme`](https://jekyll-vitepress.dev/).

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

## Requisitos previos (Ruby y Bundler)

Para previsualizar el sitio en tu computadora necesitas **Ruby 3.3+** y **Bundler**:

- **Windows:** descarga **Ruby+Devkit (x64)** desde [RubyInstaller for Windows](https://rubyinstaller.org/downloads/) y sigue el asistente (acepta instalar MSYS2 al final).
- **macOS:** sigue la [guía oficial de Jekyll para macOS](https://jekyllrb.com/docs/installation/macos/) (recomendado vía Homebrew + `chruby` o `mise`).
- **Linux:** sigue la [guía oficial de Jekyll para Ubuntu/Linux](https://jekyllrb.com/docs/installation/ubuntu/) o la [guía oficial de instalación de Ruby](https://www.ruby-lang.org/es/documentation/installation/).

Verifica que todo quedó listo ejecutando:

```bash
ruby -v
bundle -v
```

Si `bundle` no aparece instalado, instálalo con:

```bash
gem install bundler
```

> **Tip:** Si solo necesitas redactar o corregir texto en `_propuesta/` o `_adr/` y aún no tienes Ruby instalado, también puedes editar el archivo directamente desde la web de GitHub creando una rama y Pull Request.

## Ejecutar la documentación en local

1. Entra a la carpeta del repositorio clonado:

```bash
cd documentacion
```

2. Instala las dependencias:

```bash
bundle install
```

3. Levanta el servidor local con recarga automática:

```bash
bundle exec jekyll serve --livereload
```

4. Abre el sitio en tu navegador en `http://localhost:4000/documentacion/`.

## Flujo de cambios

1. Crea una rama nueva a partir de `main`:

```bash
git checkout -b docs/descripcion-corta
```

2. Agrega o edita archivos Markdown en `_propuesta/`, `_guides/` o `_adr/`.
3. Verifica que el sitio compile sin errores:

```bash
bundle exec jekyll build
```

4. Haz commit y sube tu rama:

```bash
git add .
git commit -m "docs: 📝 descripcion breve del cambio"
git push -u origin docs/descripcion-corta
```

5. Abre un **Pull Request** hacia `main`. En este repositorio de documentación no se requiere aprobación de un revisor: puedes hacer **merge** directo de tu PR y GitHub Pages actualizará el sitio automáticamente.
