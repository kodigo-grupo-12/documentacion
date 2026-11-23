# Sitio de documentación: setup, serve, build y clean.
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

define correr
if command -v mise >/dev/null 2>&1; then \
  mise exec -- $(1); \
else \
  if ! command -v bundle >/dev/null 2>&1; then \
    printf "$(rojo)  ✗ bundle no está en el Ruby del sistema$(cierre)\n"; \
    exit 1; \
  fi; \
  $(1); \
fi
endef

define con_bundle
cd "$(SITIO_ROOT)"; \
if ! $(call correr,$(1)); then \
  printf "$(rojo)  ✗ $(2)$(cierre)\n"; \
  exit 1; \
fi
endef

define fin
printf "\n$(verde)  ✓ done$(cierre)\n"; \
printf "\n$(amarillo)📋 Quick Actions:$(cierre)\n"; \
printf "$(tenue)────────────────────────────────────────────────────────────────────────────────$(cierre)\n"; \
$(1)
endef

.PHONY: help setup serve build clean

help:
	@printf "\n"
	@printf "$(cian)📚 Sitio de documentación$(cierre)\n"
	@printf "$(cian)────────────────────────────────────────────────────────────────────────────────$(cierre)\n"
	@printf "  make setup                Instala el Ruby 3.4 del repositorio y las gemas\n"
	@printf "  make serve                Abre el sitio en /documentacion/. El puerto de partida es 4000\n"
	@printf "  make serve PORT=4001      Cambia el puerto de partida. Si está ocupado, usa el siguiente libre\n"
	@printf "  make build                Genera el sitio\n"
	@printf "  make clean                Borra la salida y la caché\n"
	@$(call fin,printf "  • instalar el entorno: $(azul)make setup$(cierre)\n"; printf "  • abrir el sitio: $(azul)make serve$(cierre)\n"; printf "  • generar el sitio: $(azul)make build$(cierre)\n"; printf "  • borrar la salida: $(azul)make clean$(cierre)\n\n")

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
	$(call fin,printf "  • abrir el sitio: $(azul)make serve$(cierre)\n\n")

serve:
	@printf "\n$(cian)📚 serve · abriendo el sitio$(cierre)\n"
	@printf "$(cian)────────────────────────────────────────────────────────────────────────────────$(cierre)\n"
	@set -euo pipefail; \
	puerto_inicial="$${PORT:-4000}"; \
	if [[ ! "$$puerto_inicial" =~ ^[0-9]+$$ ]]; then \
	  printf "$(rojo)  ✗ PORT tiene que ser un número$(cierre)\n"; \
	  exit 1; \
	fi; \
	puerto=""; \
	for desplazamiento in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19; do \
	  candidato=$$((puerto_inicial + desplazamiento)); \
	  if ! (: >/dev/tcp/127.0.0.1/$$candidato) >/dev/null 2>&1; then \
	    puerto=$$candidato; \
	    break; \
	  fi; \
	done; \
	if [[ -z "$$puerto" ]]; then \
	  printf "$(rojo)  ✗ ninguno de los 20 puertos desde $$puerto_inicial está libre$(cierre)\n"; \
	  exit 1; \
	fi; \
	printf "  http://localhost:$$puerto/documentacion/\n"; \
	cd "$(SITIO_ROOT)"; \
	if ! $(call correr,bundle exec jekyll serve --livereload --host 127.0.0.1 --port "$$puerto"); then \
	  printf "$(rojo)  ✗ no se pudo servir el sitio$(cierre)\n"; \
	  exit 1; \
	fi; \
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
