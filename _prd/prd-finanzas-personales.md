---
title: "PRD: Cuéntame"
nav_order: 1
description: Requisitos de la demo de Cuéntame, control personal de gastos e ingresos con agente RubyLLM.
---

# Requisitos y arquitectura: finanzas personales

Las observaciones a este documento se registran en el [issue #12](https://github.com/kodigo-grupo-12/documentacion/issues/12). La decisión de arquitectura está en el [ADR 0001](/documentacion/adr/0001-arquitectura-base/).

| | |
| :--- | :--- |
| **Proyecto** | Control personal de gastos e ingresos, con agente conversacional |
| **Nombre** | Cuéntame. En esta etapa el nombre puede cambiar. |
| **Organización** | [kodigo-grupo-12](https://github.com/kodigo-grupo-12) |
| **Programa** | AI For Devs Jr. 5 — Kodigo |
| **Entrega** | Domingo 29 de noviembre de 2026, 23:59 |
| **Versión** | 1.0 |
| **Fecha** | 22 de noviembre de 2026 |
| **Estado** | Acordado para construir la demo |

Este documento fija qué se construye, qué queda fuera y cómo se arma la demo. Las pantallas concretas se detallan aparte. El lector puede evaluar la entrega con la sección 10 sin leer el resto.

La demo se muestra y después se descarta. No es un producto que se publique ni se opere.

---

## 1. Objetivo

En esta etapa la aplicación se llama Cuéntame. El nombre puede cambiar.

Una persona registra sus ingresos y sus gastos, los clasifica y conversa con un agente sobre ese registro.

La entrega demuestra tres cosas a la vez:

1. Una app Android que el catedrático instala y ejecuta en su propia computadora, sin depender de la máquina del grupo.
2. La misma interfaz en la web.
3. Un agente en RubyLLM que lee el registro y responde sobre él.

## 2. Lenguaje

Estos términos se usan así en el resto del documento y en la interfaz.

| Término | Significado |
| :--- | :--- |
| **Persona** | Quien dueña el libro. En la demo hay una sola cuenta, compartida por el grupo y por quien evalúa. |
| **Libro** | El conjunto de movimientos de esa cuenta. |
| **Movimiento** | Un ingreso o un gasto, con un monto, una categoría y una fecha. |
| **Monto** | Cantidad en dólares de los Estados Unidos, siempre mayor que cero. El lado (ingreso o gasto) no va en el número. |
| **Ingreso** | Dinero que entra al libro. |
| **Gasto** | Dinero que sale del libro. |
| **Saldo** | Ingresos menos gastos. Se calcula al mostrarlo y al responder el agente. No se guarda. |
| **Categoría** | Nombre con el que se clasifica un movimiento. Es de ingreso o de gasto, no de los dos. |
| **Agente** | Quien conversa sobre el libro. Lee, suma y compara. No crea ni modifica movimientos ni categorías. |

No se usan, para este producto, las palabras operario, supervisor, ingesta, formulario de campo ni KPI.

## 3. Qué incluye la entrega

La app tiene tres áreas:

- **Ingresos.** Lista los ingresos y permite crearlos, editarlos y borrarlos. Al crear o editar se elige una categoría de ingreso.
- **Gastos.** Igual, para los gastos y las categorías de gasto.
- **Agente.** Un chat. La persona pregunta por su libro y recibe una respuesta en lenguaje natural.

Reglas del libro:

- Cada movimiento tiene monto, categoría y fecha. La fecha propuesta es el día de hoy y se puede cambiar.
- Un monto de cero o negativo no se guarda.
- El saldo que se muestra coincide con la suma de los ingresos menos la suma de los gastos. Borrar o editar un movimiento cambia el saldo sin un paso extra.
- La persona administra sus categorías: crear, renombrar y borrar. El lado se elige al crear la categoría y no se cambia después.
- Renombrar una categoría conserva los movimientos que ya la usan.
- Una categoría que todavía tiene movimientos no se puede borrar. Hay que reclasificar o borrar esos movimientos primero.
- Al abrir la app, la cuenta demo ya tiene categorías comunes y movimientos de ejemplo, para que el agente tenga de qué hablar. Quien evalúa puede crear, editar y borrar encima de esos datos.
- Android y web muestran el mismo libro.

Reglas del agente:

- Responde con cifras del libro. Ejemplo: si hay tres gastos de café por $10, $15 y $15, puede decir que esa categoría suma $40 y que es el gasto más alto.
- Si le piden anotar, editar o borrar un movimiento, indica que eso se hace en Ingresos o en Gastos, y no lo hace.
- No da asesoría fiscal, legal ni de inversión, y no se conecta a un banco.

El conjunto inicial de categorías y el detalle visual de cada pantalla se cierran en un paso posterior. Este documento no los fija.

## 4. Qué queda fuera

- iOS y una segunda aplicación.
- Varias personas, hogares o contabilidad de una empresa.
- Registro de una persona nueva. La demo entra sola con la cuenta preparada.
- Integración con bancos, pasarelas de pago o asesoría certificada.
- Cola propia de sincronización, base local aparte y reintentos de lotes. La caché del SDK de Firestore alcanza para esta entrega.
- Guardar la conversación. Si el servicio del agente se apaga, el chat empieza de nuevo. El libro permanece.
- Publicación en tiendas, operación continua y cualquier costo de nube.

## 5. Arquitectura

```text
                         +----------------------+
                         |   Cloud Firestore    |
                         |   libro de la cuenta |
                         +----------+-----------+
                                    |
              +---------------------+---------------------+
              |                                           |
              | lee y escribe                             | solo lee
              |                                           |
   +----------+-----------+                    +----------+-----------+
   |  App Expo            |                    |  Agente Ruby         |
   |  Android y web       |  ---- pregunta --> |  RubyLLM en Render   |
   |  Firebase JS SDK     |  <-- respuesta --- |  key de Gemini aquí  |
   +----------+-----------+                    +----------------------+
              |
              | la misma cuenta
              v
   +--------------------------+
   |  Firebase Auth           |
   |  una cuenta demo         |
   +--------------------------+
```

| Pieza | Elección | Motivo |
| :--- | :--- | :--- |
| App | Un proyecto Expo, Android y web | Una sola interfaz para las dos superficies. |
| Repositorio | pnpm y Turborepo | El código compartido vive en paquetes, no se copia. |
| Paquete Android | APK de Expo Build, plan gratis | Quien evalúa descarga la APK y la ejecuta en su computadora. El plan gratis incluye hasta 15 builds de Android al mes. |
| Web | Export de esa misma app en Firebase Hosting | Mismo libro, misma cuenta, sin otra interfaz. |
| Datos y sesión | Firebase, plan Spark | Auth, Firestore y Hosting dentro de la cuota sin costo. Sin tarjeta. |
| Cliente de Firebase | Firebase JS SDK | El mismo código corre en la app Android y en la web. |
| Agente | RubyLLM en Render, plan free | Firebase no ejecuta Ruby. Render da una URL pública sin tarjeta. |
| Modelo | Gemini, key de Google AI Studio, tier gratis | La key vive solo en Render. No va dentro de la APK. |

La decisión y las alternativas que se descartaron están en [ADR 0001](/documentacion/adr/0001-arquitectura-base/).

### 5.1 App

Un solo proyecto Expo. Tres rutas: ingresos, gastos y agente. No hay app de captura y app de tablero por separado, ni envoltura Capacitor.

Expo Build genera la APK (`eas build`, perfil con `android.buildType: apk`). La web es el export de ese proyecto, publicado en Firebase Hosting.

La app inicia sesión sola con la cuenta demo. Quien la abre no se registra ni escribe una contraseña. Firestore solo acepta lecturas y escrituras de esa cuenta.

### 5.2 Libro en Firestore

Todo cuelga de la cuenta demo.

- Una categoría guarda su nombre y su lado (ingreso o gasto).
- Un movimiento guarda el lado, el monto, la referencia a su categoría y la fecha.
- No hay un documento de saldo.

La caché del SDK queda activada. En Android viene activada. En web se activa de forma explícita. No hay otra base local ni un endpoint de sincronización por lotes.

### 5.3 Agente

Render ejecuta un proceso Ruby con URL pública.

1. La app envía la pregunta junto con el token de Firebase de la sesión ya iniciada.
2. El proceso comprueba el token, lee el libro de esa cuenta en Firestore y arma el contexto.
3. RubyLLM llama a Gemini y devuelve el texto.
4. El proceso no escribe en Firestore.

La key de Gemini y la credencial de lectura de Firestore son variables del servicio. No están en el repositorio ni en la APK.

Render apaga el servicio free tras 15 minutos sin visitas. La primera pregunta después de eso puede tardar cerca de un minuto, mientras el servicio despierta. Conviene abrir la URL una vez antes de la evaluación. El libro no depende de ese proceso: sigue en Firestore.

La conversación se guarda solo en la memoria de ese proceso. Al apagarse, el chat queda vacío y la siguiente pregunta vuelve a leer el libro.

## 6. Repositorio

El código de la entrega vive en el monorepo del grupo.

```text
/
├── apps/
│   └── finanzas/           # App Expo. Rutas: ingresos, gastos, agente.
├── packages/
│   ├── firebase/           # Inicio de sesión, lectura y escritura del libro.
│   ├── domain/             # Tipos de movimiento, categoría y saldo.
│   └── ui/                 # Componentes que usan Android y web.
├── services/
│   └── agente/             # Proceso Ruby. RubyLLM. Solo lee Firestore.
├── turbo.json
├── pnpm-workspace.yaml
└── package.json
```

`services/agente` es Ruby y no entra en el pipeline de pnpm. Comparte el repositorio para que la entrega tenga una sola dirección.

## 7. Costo

| Servicio | Plan | Tarjeta |
| :--- | :--- | :--- |
| Firebase Auth, Firestore y Hosting | Spark | No |
| Gemini, vía Google AI Studio | Tier gratis | No |
| Render, un servicio web | Free | No |
| Expo Build | Free (hasta 15 APK al mes) | No |

No se usan Cloud Run ni Cloud Functions, porque piden una cuenta de cobro. No se usa la suscripción de Cursor ni la de Antigravity: esas cuentas no autorizan a un tercero a consumirlas desde esta app, y no son la API del agente.

## 8. Cómo se prueba la demo

Quien evalúa descarga la APK, la instala y la abre. No necesita el código, ni la laptop del grupo, ni una cuenta propia.

1. La app abre ya dentro de la cuenta demo y muestra movimientos de ejemplo.
2. Crear, editar y borrar un ingreso y un gasto cambia la lista y el saldo.
3. Un monto de `0` o negativo no se guarda.
4. En Gastos no aparecen las categorías de ingreso, y al revés.
5. Renombrar una categoría se refleja en sus movimientos. Borrarla, si todavía tiene movimientos, no está permitido. Cambiarla de lado no está permitido.
6. La web, con la misma cuenta, muestra el mismo libro.
7. En el agente, una pregunta sobre una categoría responde con la suma de sus movimientos. Una orden de anotar un gasto no crea el movimiento. Una pregunta fiscal o de inversión no se responde como asesoría.
8. Con el servicio de Render dormido, el libro sigue visible. La primera pregunta del agente puede tardar cerca de un minuto y después responde.

## 9. Límites conocidos de la demo

- La contraseña de la cuenta demo viaja dentro de la app, porque la sesión inicia sola. Es aceptable solo porque la app no se distribuye y se descarta después de la evaluación.
- Cualquiera con esa APK ve y puede modificar el mismo libro.
- El chat no se conserva entre aperturas ni después de que Render se duerme.
- La cuota gratis de Gemini y el plan free de Render pueden limitar la velocidad o apagar el servicio por inactividad. No hay un plan de pago de respaldo.
- Los nombres del conjunto inicial de categorías, los movimientos de ejemplo y el diseño de cada pantalla todavía no están en este documento.

## 10. Criterio de listo

La entrega está lista cuando los ocho puntos de la sección 8 se cumplen en la APK que recibe quien evalúa, y la web muestra el mismo libro. No hace falta tienda, dominio propio ni un servidor encendido del grupo.
