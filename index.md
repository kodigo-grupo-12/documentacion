---
layout: home
title: Inicio
description: Documentación técnica del Grupo 12 (AI For Devs Jr. 5, Kodigo) para la aplicación Android de control de gastos e ingresos con agente conversacional en RubyLLM.

hero:
  name: Kodigo — Grupo 12
  text: AI For Devs Jr. 5
  tagline: Aplicación móvil Android para llevar el control personal de gastos e ingresos, integrada con un agente conversacional construido con RubyLLM.
  image:
    src: /assets/images/kodigo_k_mark.png
    alt: Ícono de Kodigo
  actions:
    - theme: brand
      text: Leer la propuesta
      link: /propuesta/01-introduccion/
    - theme: alt
      text: Leer el PRD
      link: /prd/prd-finanzas-personales/

features:
  - icon:
      light: /assets/icons/file-text-light.svg
      dark: /assets/icons/file-text-dark.svg
      alt: ""
      wrap: true
    title: Propuesta del proyecto
    details: La idea. Introducción, problema, justificación, objetivos y alcances.
    link: /propuesta/01-introduccion/
    link_text: Ir a la propuesta
  - icon:
      light: /assets/icons/file-text-light.svg
      dark: /assets/icons/file-text-dark.svg
      alt: ""
      wrap: true
    title: PRD de Cuéntame
    details: Acuerdo del producto. Libro, movimientos, saldo y agente. En esta etapa el nombre puede cambiar.
    link: /prd/prd-finanzas-personales/
    link_text: Leer el PRD
  - icon:
      light: /assets/icons/compass-light.svg
      dark: /assets/icons/compass-dark.svg
      alt: ""
      wrap: true
    title: ADR-0001
    details: Decisión de arquitectura. La demo es una app Expo sobre Firebase y el agente corre en Render.
    link: /adr/0001-arquitectura-base/
    link_text: Leer la decisión
  - icon:
      light: /assets/icons/git-pr-light.svg
      dark: /assets/icons/git-pr-dark.svg
      alt: ""
      wrap: true
    title: Flujo de trabajo del equipo
    details: Entorno unificado con mise (Ruby 3.4), edición mediante ramas y Pull Requests hacia main, con despliegue automático en GitHub Pages.
    link: /como-contribuir/
    link_text: Guía de contribución
---

## La demo

En esta etapa la aplicación se llama Cuéntame. El nombre puede cambiar.

Una persona lleva su libro de ingresos y gastos. La aplicación tiene tres áreas: Ingresos, Gastos y el Agente. Android y web son la misma interfaz, construida con Expo. La web se publica en Firebase Hosting, plan Spark. La sesión entra sola con una cuenta de demostración, y esa cuenta es el libro que ve quien evalúa.

Un movimiento tiene monto, categoría y fecha. El monto va en dólares y es siempre mayor que cero. El área dice si el dinero entra o sale. La fecha arranca en el día de hoy y se puede cambiar. La persona crea, edita y borra movimientos. El saldo es la suma de los ingresos menos la suma de los gastos, y se calcula al mostrarlo.

Cada categoría es de ingreso o de gasto, y ese lado no cambia. El libro arranca con categorías comunes y la persona puede crearlas, renombrarlas y borrarlas. Si una categoría tiene movimientos, no se borra. Al renombrarla, los movimientos la siguen. Los nombres concretos y las pantallas se detallan después. El libro de la demo incluye movimientos de ejemplo.

El agente lee el libro, suma y comenta. No anota, no edita y no da asesoría fiscal ni de inversión. RubyLLM corre en Render, plan free. La clave de Google AI Studio permanece en ese servidor. La APK llama esa dirección, de modo que funciona en la computadora de quien evalúa. Si el servicio se apaga por inactividad, el chat empieza de nuevo y el libro sigue en Firestore.

<div class="home-divider" aria-hidden="true">
  <img src="{{ '/assets/images/macchiato.png' | relative_url }}" width="420" alt=""/>
</div>

<dl class="home-meta" aria-label="Datos del curso y entrega">
  <div class="home-meta-item">
    <dt>Programa</dt>
    <dd>AI For Devs Jr. 5 · Kodigo</dd>
  </div>
  <div class="home-meta-item">
    <dt>Equipo</dt>
    <dd>Grupo 12 (<code>kodigo-grupo-12</code>)</dd>
  </div>
  <div class="home-meta-item">
    <dt>Instructor</dt>
    <dd>Ing. Ronald Mejía</dd>
  </div>
  <div class="home-meta-item">
    <dt>Fecha de entrega</dt>
    <dd>Domingo, 29 de noviembre de 2026 — 23:59</dd>
  </div>
</dl>
