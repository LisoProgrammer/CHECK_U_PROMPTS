
**Fase:** Procesamiento | **Depende de:** (Tarea 02), (Tarea 07)

**Contexto obligatorio:** lee `docs/PROMPT_BASE.md` antes de empezar. Para más detalle de reglas consulta `docs/PROMPT_MAESTRO.md`.

**Archivos de referencia:** contratos, orquestador y el código existente de modules/ para este tipo

## Prompt

```
TIPO: identification

TAREA: Adapta o completa el módulo de extracción + validación de este tipo
para que cumpla el contrato de resultados, reutilizando el código existente
en modules/ cuando sea posible.

- Separa extracción (datos candidatos con confianza) de validación (reglas).
- Cada regla es independiente y devuelve cumple/no_cumple/no_evaluable con
  mensaje y evidencia. Sin información suficiente o con baja confianza =>
  no_evaluable, nunca no_cumple.
- Clasificación individual: valid / invalid / to_check. Aquí NO se declara
  inconsistent (eso es validación cruzada). La falta de otros documentos
  nunca vuelve inválido a este.
- Decide resubmission_allowed y required_action según los casos A-D:
  A nueva versión necesaria, B revisión humana, C fuente externa pendiente,
  D dependencia pendiente.
- Versiona el conjunto de reglas (validation_version).

ESPECÍFICO DE ESTE TIPO:
Extrae nombres, número, tipo de documento, PDF417 y MRZ si aplica. No
confundas PDF417 con MRZ: define qué versiones de cédula se aceptan y qué
elementos exige cada una. La ausencia de un código solo es incumplimiento si
es obligatorio para esa versión. Evalúa recorte, baja resolución, desenfoque y
páginas faltantes. Presencia de código/MRZ no demuestra autenticidad.
Pregunta abierta: ¿se acepta cédula de extranjería? (el README la menciona).

Pruebas con datos ficticios: válido, incumplimiento confirmado, ilegible,
corrupto, campos ausentes, baja confianza.
```

## Criterios de aceptación
- [ ] Extracción y reglas separadas
- [ ] Reglas devuelven cumple/no_cumple/no_evaluable
- [ ] Registrado en el pipeline_registry
- [ ] Pruebas con datos ficticios pasan
- [ ] Resumen final con lo realmente verificado frente a lo simulado o pendiente.