---
title: "5. Alcances y Límites"
nav_order: 5
description: Alcances incluidos y límites fuera del alcance del proyecto.
---

# 5. Alcances y Límites

## 5.1 Alcances del proyecto

¿Qué **sí** incluirá esta versión del proyecto?

- **Aplicación demo (Expo para Android y web):** registro y consulta de ingresos, gastos y categorías sobre una cuenta de demostración, con montos en USD mayores que cero y fecha obligatoria por movimiento, calculando el saldo al mostrarlo (`ingresos - gastos`) sin guardarlo persistido.
- **Agente conversacional (RubyLLM):** chat en lenguaje natural para consultar movimientos y categorías del libro en modo de **solo lectura** y **sin historial persistente entre sesiones**.
- **Documentación y arquitectura:** decisiones técnicas registradas en ADRs, guías de uso e instalación y documentación de validación funcional alineada con el alcance definido.

## 5.2 Límites del proyecto

¿Qué queda **fuera de alcance** explícitamente en esta entrega?

- Integración directa con APIs bancarias reales, cuentas bancarias en producción o pasarelas de pago.
- Soporte multiusuario, roles/permisos o gestión de múltiples cuentas de usuario.
- Almacenamiento persistido del saldo calculado o persistencia del historial de conversación del agente entre sesiones, así como creación, edición o eliminación de movimientos desde el chat.
- Asesoría financiera, legal o fiscal certificada, o contabilidad formal.