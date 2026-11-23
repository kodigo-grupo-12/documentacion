# Sitio de documentación: setup, build y clean.
# make sin argumentos muestra esta ayuda y no compila.

SHELL := bash

rojo := \033[0;31m
verde := \033[0;32m
amarillo := \033[0;33m
azul := \033[0;34m
cian := \033[0;36m
tenue := \033[2m
cierre := \033[0m

SITIO_ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST)))/..)

define con_bundle
cd "$(SITIO_ROOT)"; \
if command -v mise >/dev/null 2>&1; then \
  if ! mise exec -- $(1); then \
    printf "$(rojo)  ✗ $(2)$(cierre)\n"; \
    exit 1; \
  fi; \
else \
  if ! command -v bundle >/dev/null 2>&1; then \
    printf "$(rojo)  ✗ bundle no está en el Ruby del sistema$(cierre)\n"; \
    exit 1; \
  fi; \
  if ! $(1); then \
    printf "$(rojo)  ✗ $(2)$(cierre)\n"; \
    exit 1; \
  fi; \
fi
endef

define fin
printf "\n$(verde)  ✓ done$(cierre)\n"; \
printf "\n$(amarillo)📋 Quick Actions:$(cierre)\n"; \
printf "$(tenue)────────────────────────────────────────────────────────────────────────────────$(cierre)\n"; \
$(1)
endef

.PHONY: help setup build clean

help:
	@printf "\n"
	@printf "$(cian)📚 Sitio de documentación$(cierre)\n"
	@printf "$(cian)────────────────────────────────────────────────────────────────────────────────$(cierre)\n"
	@printf "  make setup                Instala el Ruby 3.4 del repositorio y las gemas\n"
	@printf "  make build                Genera el sitio\n"
	@printf "  make clean                Borra la salida y la caché\n"
	@$(call fin,printf "  • instalar el entorno: $(azul)make setup$(cierre)\n"; printf "  • generar el sitio: $(azul)make build$(cierre)\n"; printf "  • borrar la salida: $(azul)make clean$(cierre)\n\n")

setup:
	@printf "\n$(cian)📚 setup · instalando Ruby y gemas$(cierre)\n"
	@printf "$(cian)────────────────────────────────────────────────────────────────────────────────$(cierre)\n"
	@set -euo pipefail; \
	cd "$(SITIO_ROOT)"; \
	if command -v mise >/dev/null 2>&1; then \
	  if ! mise install ruby; then \
	    printf "$(rojo)  ✗ no se pudo instalar el Ruby 3.4$(cierre)\n"; \
	    exit 1; \
	  fi; \
	else \
	  printf "$(amarillo)mise no está instalado. Se sigue con el Ruby del sistema.$(cierre)\n"; \
	fi; \
	$(call con_bundle,bundle install,no se pudieron instalar las gemas); \
	$(call fin,printf "  • generar el sitio: $(azul)make build$(cierre)\n\n")

build:
	@printf "\n$(cian)📚 build · generando el sitio$(cierre)\n"
	@printf "$(cian)────────────────────────────────────────────────────────────────────────────────$(cierre)\n"
	@set -euo pipefail; \
	$(call con_bundle,bundle exec jekyll build,no se pudo generar el sitio); \
	if [[ ! -d "$(SITIO_ROOT)/_site" ]]; then \
	  printf "$(rojo)  ✗ la salida _site no quedó generada$(cierre)\n"; \
	  exit 1; \
	fi; \
	$(call fin,printf "  • borrar la salida: $(azul)make clean$(cierre)\n\n")

clean:
	@printf "\n$(cian)📚 clean · borrando la salida y la caché$(cierre)\n"
	@printf "$(cian)────────────────────────────────────────────────────────────────────────────────$(cierre)\n"
	@set -euo pipefail; \
	cd "$(SITIO_ROOT)"; \
	rm -rf _site .jekyll-cache .sass-cache .jekyll-metadata; \
	$(call fin,printf "  • generar el sitio de nuevo: $(azul)make build$(cierre)\n\n")
