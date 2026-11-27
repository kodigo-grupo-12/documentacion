---
title: "3. Justificación e Importancia"
nav_order: 3
description: Por qué es relevante desarrollar la aplicación Android de finanzas personales con agente RubyLLM.
---

# 3. Justificación e Importancia

## Relevancia práctica

Llevar un control cotidiano del dinero falla cuando el registro es lento o las cifras quedan dispersas entre notas, boletas sueltas y hojas de cálculo. Una aplicación de control financiero personal (llamada provisionalmente Cuéntame en esta etapa) centraliza los ingresos y gastos en un libro de movimientos en dólares (USD) con montos mayores que cero, categoría y fecha, calculando el saldo al mostrarlo como ingresos menos gastos.

Al reunir la gestión directa de ingresos, gastos y categorías con un chat en lenguaje natural, la persona puede revisar sus movimientos, sumar cifras y comparar categorías sin armar resúmenes a mano. El chat se mantiene de solo lectura y sin historial persistente entre sesiones para no alterar el libro desde la conversación ni mezclar consultas pasadas con el estado actual.

## Relevancia técnica

Desde el punto de vista técnico, la entrega integra una única aplicación con **Expo** para **Android** y **web** sobre una cuenta de demostración, conectada con un agente conversacional en **RubyLLM** con límites claros de responsabilidad. Separar la escritura del libro (en las áreas de ingresos y gastos) de la consulta conversacional evita acciones no deseadas desde el chat y facilita validar el comportamiento de la demo.

Construir esta solución dentro de un flujo documentado con propuesta, PRD y decisiones de arquitectura (ADRs) permite mantener coherencia entre el alcance acordado y la implementación, sin añadir complejidad innecesaria como conexión bancaria directa o soporte multiusuario en esta versión.

## Impacto esperado

El resultado esperado es reducir la fricción del control financiero diario y dar mayor visibilidad sobre en qué entra y en qué sale el dinero. Al poder consultar el libro con preguntas directas y ver el saldo actualizado al instante, la persona gana claridad para detectar concentraciones de gasto y ajustar decisiones cotidianas a tiempo.