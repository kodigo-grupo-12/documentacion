---
title: "2. Descripción del Problema"
nav_order: 2
description: Contexto, problema por solucionar y situación actual en el control de gastos e ingresos personales.
---

# 2. Descripción del Problema

## 2.1 Actividad principal / Contexto de aplicación

El dominio de esta entrega son las finanzas personales cotidianas. Una persona registra sus ingresos y sus gastos en un libro de movimientos: cada movimiento lleva un monto en dólares (USD) siempre mayor que cero, una categoría y una fecha. Las categorías separan los movimientos de ingreso de los de gasto y permiten ver en qué se concentra el dinero.

Con ese registro, la persona consulta su saldo, que se calcula al mostrarse como la suma de los ingresos menos la suma de los gastos y no se guarda en ninguna parte. Esa cifra al día es la base para tomar decisiones diarias: saber qué entra, qué sale y dónde ajustar antes de que el mes se le pase.

La entrega es una demo con una sola aplicación Expo para Android y web (llamada provisionalmente Cuéntame en esta etapa), sobre una cuenta de demostración, sin integración con bancos ni soporte para varias personas.

## 2.2 ¿Cuál es el problema por solucionar?

Mantener un control constante cuesta porque el hábito compite con la rutina: los movimientos ocurren a cualquier hora, se acumulan durante días y la persona solo los recuerda cuando revisa la cuenta. Sin un lugar único y rápido donde anotarlos, la intención de llevar el control se pierde entre otras tareas.

Las aplicaciones tradicionales de finanzas personales agregan fricción a ese esfuerzo. Registrar un movimiento suele obligar a navegar pantallas, elegir menús y llenar campos uno por uno; los resúmenes muestran listas y tablas que exigen que la persona arme por su cuenta la relación entre sus categorías y su saldo; y ninguna responde una pregunta concreta, como "¿cuánto llevaba en café este mes?". El registro se vuelve una tarea más, y la persona abandona el control a los pocos días.

El agente conversacional construido con RubyLLM aporta justo lo que falta: la persona escribe su pregunta en lenguaje natural y el agente responde con las cifras del libro, sumando y comparando movimientos reales. El límite es deliberado y mantiene la aplicación clara: el agente solo lee, no registra ni modifica movimientos por el chat, y no guarda historial persistente entre sesiones, así que cada conversación parte del libro, que sí permanece. Consultar no reemplaza registrar; son dos áreas complementarias de la misma aplicación.

El alcance de la demo es acotado: una sola cuenta en Expo para Android y web, sin integración bancaria y sin multiusuario.

## 2.3 Situación actual

Hoy el control de gastos e ingresos se lleva de forma manual e irregular. La persona confía en su memoria para recordar cuánto gastó, guarda recibos y boletas sueltos en el bolsillo o en el teléfono, anota cifras en notas rápidas y, cuando se organiza, arma hojas de cálculo donde debe escribir cada movimiento a mano y mantener las fórmulas al día. Ninguno de esos métodos ofrece una vista confiable del saldo en el momento en que se necesita.

Las aplicaciones sin asistente mejoran el registro, pero presentan limitaciones concretas. Exigen un proceso lento y repetitivo para anotar cada movimiento; los resúmenes se limitan a listas o gráficos que no explican de dónde sale cada cifra; y la persona queda sola para interpretar sus datos, sin poder preguntar en lenguaje natural. Cuando la duda aparece, vuelve a la memoria, a los recibos sueltos o a la hoja de cálculo, y el control se interrumpe otra vez.
