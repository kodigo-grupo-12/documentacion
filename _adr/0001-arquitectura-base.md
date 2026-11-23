---
title: "ADR-0001: Arquitectura base de la demo"
nav_order: 3
description: App Expo para Android y web, libro en Firebase y agente RubyLLM en Render.
---

# ADR-0001: Arquitectura base de la demo

Las observaciones a esta decisión se registran en el [issue #12](https://github.com/kodigo-grupo-12/documentacion/issues/12). El acuerdo del producto está en el [PRD](/documentacion/prd/prd-finanzas-personales/).

- **Fecha:** 2026-11-22
- **Estado:** Aceptada

## Contexto

En esta etapa la aplicación se llama Cuéntame. El nombre puede cambiar. La entrega del 29 de noviembre de 2026 es una demo, no un producto que se publique. Una persona lleva el libro de sus ingresos y sus gastos. Quien evalúa descarga una APK y la ejecuta en su propia computadora, sin usar la máquina del grupo y sin pagar una cuenta de nube.

El agente tiene que estar construido con RubyLLM. Firebase no ejecuta Ruby. La clave del modelo no puede quedar dentro de la APK.

## Decisión

- Una sola aplicación Expo sirve Android y web. El repositorio es un monorepo con pnpm y Turborepo. La APK sale de Expo Build, en el plan gratis.
- El libro y la sesión viven en Firebase, plan Spark: Authentication y Cloud Firestore. El saldo no se guarda. Se calcula al mostrarlo y al responder el agente.
- La aplicación inicia sesión sola con una cuenta de demostración. Firestore solo acepta a esa cuenta.
- El agente es un proceso Ruby con RubyLLM, publicado en Render en el plan free. Lee el libro en Firestore y llama a Gemini con una clave que existe solo en ese servicio. No escribe movimientos ni categorías.
- La conversación del agente vive en la memoria de ese proceso. El libro vive en Firestore.

## Alternativas consideradas

- **Capacitor, una web empaquetada como APK.** Cubre Android con una sola interfaz web. Se descartó porque el diseño del grupo ya era un monorepo Expo, y una app Expo también publica la web.
- **Llamar a Gemini desde la aplicación, con Firebase AI Logic.** No pide servidor y la APK funciona sola. Se descartó porque no ejecuta RubyLLM.
- **Poner la clave de Gemini dentro de la APK.** Funciona en la computadora de quien evalúa, y cualquiera que abra el paquete puede leer la clave.
- **Cloud Run o Cloud Functions.** Ejecutan un proceso en Google y piden tarjeta. Esta demo no usa cuenta de cobro.
- **Usar la suscripción de un editor o de un asistente de programación como API del agente.** Esas cuentas no autorizan a un tercero a consumirlas desde la aplicación, y no son la API de este chat.

## Consecuencias

- **Positivas:** una sola interfaz para Android y web. Quien evalúa instala la APK y ve el libro sin depender del grupo. La clave del modelo no viaja en el paquete. El costo de la demo cabe en planes gratis.
- **Negativas / Trade-offs:** si nadie visita el servicio de Render durante 15 minutos, la primera pregunta puede tardar cerca de un minuto. El chat no se conserva cuando ese servicio se apaga. Cualquier persona con la APK ve y puede modificar el mismo libro de demostración.
