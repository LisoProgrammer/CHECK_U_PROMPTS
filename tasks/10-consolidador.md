# Tarea 10 — Consolidador y máquina de estados

**Fase:** Lógica avanzada | **Depende de:** {{T09}}

**Contexto obligatorio:** lee `docs/PROMPT_BASE.md` antes de empezar. Para más detalle de reglas consulta `docs/PROMPT_MAESTRO.md`.

**Archivos de referencia:** contratos, validadores y validación cruzada

## Prompt

```
TAREA: Implementa el consolidador de resultados.

Determina: clasificación de cada documento (integrando individual + cruzada
sin reemplazar a los validadores), estado general de la solicitud, documentos
que requieren corrección, que requieren revisión manual, validaciones
externas pendientes, acciones disponibles para el estudiante y si está lista
para envío formal.

Reglas: valid exige reglas obligatorias evaluables cumplidas y sin
inconsistencias pendientes; no hay ready_for_formal_submission con documentos
faltantes, validaciones obligatorias pendientes o revisión humana sin
resolver; ready_for_formal_submission NO es aprobación oficial del grado.
Implementa y documenta la tabla de transiciones; cada cambio de estado deja
registro en historial con su motivo.

Pruebas: cada estado y transición, orden de llegada variable, documento
pendiente que impide el "listo", reconsolidación tras una nueva versión.
```

## Criterios de aceptación
- [ ] Todas las transiciones probadas
- [ ] Cada cambio de estado queda en historial con motivo
- [ ] ready_for_formal_submission no se confunde con aprobación oficial
- [ ] Resumen final con lo realmente verificado frente a lo simulado o pendiente.
