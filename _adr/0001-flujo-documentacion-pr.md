---
title: "ADR-0001: Flujo de contribución y Pull Requests en documentación"
---

- **Fecha:** 2026-11-19
- **Estado:** Propuesta *(Propuesta | Aceptada | Rechazada | Reemplazada)*

## Contexto

El Grupo 12 necesita mantener centralizada y ordenada la documentación técnica, guías y decisiones de arquitectura (ADR) en el repositorio `documentacion`, permitiendo aportes ágiles sin comprometer la rama principal `main`.

## Decisión

Trabajar los aportes de documentación mediante ramas dedicadas creadas desde `main`, enviar los cambios mediante Pull Request y realizar el *merge* correspondiente una vez verificado el contenido.

## Alternativas consideradas

- **Opción A (Editar directamente en `main`):** Es más rápido para cambios puntuales, pero aumenta el riesgo de subir errores de formato o contenido incompleto directamente a la rama principal.
- **Opción B (Rama por aporte + Pull Request):** Requiere un paso adicional de rama y PR, pero mantiene el historial ordenado y facilita la revisión y el seguimiento de cambios.

## Consecuencias

- **Positivas:** Historial de cambios claro, menor riesgo en `main` y facilidad para revertir o revisar aportes específicos.
- **Negativas / Trade-offs:** Añade un pequeño paso extra de creación de rama y PR frente a una edición directa en `main`.