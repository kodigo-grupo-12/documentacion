---
title: "4. Objetivos"
nav_order: 4
description: Objetivo general y objetivos específicos del proyecto.
---

# 4. Objetivos

## Objetivo general

Desarrollar una aplicación de demostración para el control de finanzas personales cotidianas (llamada provisionalmente Cuéntame en esta etapa) en Expo para Android y web sobre una cuenta de demostración, que permita registrar y consultar movimientos en USD y categorías, calcular el saldo al vuelo a partir de ingresos y gastos e integrar un agente conversacional en RubyLLM de solo lectura y sin historial persistente entre sesiones.

## Objetivos específicos

1. Implementar la gestión de ingresos, gastos y categorías en una única aplicación Expo para Android y web sobre una cuenta de demostración, exigiendo montos en USD mayores que cero y fecha en cada movimiento.
2. Calcular el saldo al mostrarse como la suma de los ingresos menos la suma de los gastos sin persistirlo como dato guardado, manteniendo el alcance acotado sin integración bancaria ni soporte multiusuario.
3. Integrar un agente conversacional basado en RubyLLM para responder consultas sobre los movimientos y categorías del libro en lenguaje natural, restringido a operación de solo lectura y sin historial persistente entre sesiones.
4. Documentar la arquitectura, las decisiones técnicas clave (ADRs) y la validación funcional de la demo para mantener coherencia entre el alcance definido y el comportamiento implementado.