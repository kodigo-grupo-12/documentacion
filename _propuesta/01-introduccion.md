---
title: "1. Introducción"
nav_order: 1
description: Introducción general al proyecto de control de gastos e ingresos en Android con agente conversacional RubyLLM.
---

# 1. Introducción

> **Enfoque del proyecto:** aplicación con **Expo** para **Android** y **web** de control financiero personal (demo), integrada con un agente conversacional en **RubyLLM** de solo lectura: consulta, suma y compara movimientos; no crea ni modifica movimientos ni registra gastos por chat.

En esta etapa la aplicación se llama Cuéntame. El nombre puede cambiar.

## Qué es el proyecto

Una persona lleva sus ingresos y sus gastos en un libro de movimientos. Cada movimiento tiene un monto en dólares (USD), una categoría y una fecha; el saldo es la suma de los ingresos menos la suma de los gastos y se calcula al mostrarlo. La necesidad que cubre la demo es mantener ese control sin apuntar en notas sueltas: saber qué entra, qué sale y en qué categoría se concentra el dinero.

La entrega es una demo con una sola aplicación Expo, con tres áreas:

- **Ingresos.** La persona crea, edita y borra sus ingresos y administra las categorías de ingreso.
- **Gastos.** Igual, para los gastos y las categorías de gasto.
- **Agente.** Un chat donde la persona pregunta por su libro y recibe una respuesta en lenguaje natural.

Android y la web muestran el mismo libro, sobre la misma cuenta de demostración.

## Qué aporta el agente de solo lectura

El agente consulta el libro en lugar de escribirlo: lee movimientos, los suma y los compara, y responde con cifras del libro. Si le piden anotar, editar o borrar algo, indica que eso se hace en el área de ingresos o en la de gastos, y no lo hace. El límite es deliberado: la persona escribe el libro y el agente ayuda a leerlo.

Combinar la aplicación con el agente en RubyLLM aporta preguntas en lenguaje natural sobre datos reales del libro, sin que la persona tenga que buscar las cifras a mano.

## Qué encontrará en el resto del documento

- **[2. Descripción del problema](/documentacion/propuesta/02-descripcion-del-problema/):** el contexto de la gestión financiera personal, el problema por solucionar y la situación actual.
- **[3. Justificación e importancia](/documentacion/propuesta/03-justificacion/):** por qué conviene construir la aplicación y su agente.
- **[4. Objetivos](/documentacion/propuesta/04-objetivos/):** el objetivo general y los objetivos específicos de la entrega.
- **[5. Alcances y límites](/documentacion/propuesta/05-alcances-y-limites/):** qué incluye esta versión y qué queda fuera.

Los requisitos acordados de la demo están en el [PRD](/documentacion/prd/prd-finanzas-personales/) y la decisión de arquitectura en el [ADR-0001](/documentacion/adr/0001-arquitectura-base/).
