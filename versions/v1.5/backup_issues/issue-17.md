
**Fase:** Lógica avanzada | **Depende de:** (Tarea 07), (Tarea 08a), (Tarea 08b), (Tarea 08c), (Tarea 08d), (Tarea 08e)

**Contexto obligatorio:** lee `docs/PROMPT_BASE.md` antes de empezar. Para más detalle de reglas consulta `docs/PROMPT_MAESTRO.md`.

**Archivos de referencia:** contratos, orquestador y validadores

## Prompt

```
TAREA: Implementa el servicio de validación cruzada de identidad.

- Registro de dependencias entre documentos, campos, fuentes externas y
  reglas. Al llegar un resultado, ejecuta solo las reglas que dependan del
  dato nuevo; no repitas OCR de documentos sin cambios.
- Ejecución progresiva en cualquier orden de llegada: cédula contra Banner,
  Biblioteca, Pro-Cultura, Saber Pro (pregrado), datos de la solicitud y RUI
  si existiera integración real.
- Normalización de nombres (mayúsculas, tildes, espacios, formato) con
  umbrales de similitud explícitos y configurables. Una coincidencia
  aproximada no es prueba definitiva ni oculta discrepancias sustanciales.
- Estados por comparación: coincidencia confirmada, discrepancia confirmada,
  información insuficiente, fuente pendiente, fuente inaccesible, revisión
  manual requerida. Una fuente inaccesible no implica falsedad.
- Adaptadores de fuentes externas (Banner, RUI) que hoy devuelvan pendiente
  si no hay integración real. No simular.
- No sobrescribe resultados individuales; guarda fuentes, campos, evidencia,
  fecha, regla y motivo.
- Una nueva versión de documento recalcula solo las reglas dependientes.

Pruebas: coincidencia, diferencias de formato normalizables, números
discrepantes, orden de llegada distinto, fuente pendiente/inaccesible,
reproceso de una sola dependencia.
```

## Criterios de aceptación
- [ ] Orden de llegada no altera el resultado
- [ ] Fuentes no integradas quedan pendientes, no simuladas
- [ ] Solo se recalculan dependencias afectadas
- [ ] Resumen final con lo realmente verificado frente a lo simulado o pendiente.