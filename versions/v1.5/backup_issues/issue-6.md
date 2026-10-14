
**Fase:** Fundamentos | **Depende de:** #5

**Contexto obligatorio:** lee `docs/PROMPT_BASE.md` antes de empezar. Para más detalle de reglas consulta `docs/PROMPT_MAESTRO.md`.

**Archivos de referencia:** docs/gap_analysis.md

## Prompt

```
TAREA: Define los contratos de datos explícitos con el mecanismo de esquemas
que el proyecto ya use (p. ej. Pydantic). Sin lógica de negocio.

Crear enumeraciones y esquemas para:
- type_document, nivel académico y documentos requeridos por nivel
  (función pura: required_documents(level)).
- Estado de trabajo: queued, processing, completed, failed, retry_pending.
- Estado de solicitud: queued, processing, awaiting_review,
  correction_required, ready_for_formal_submission, closed. Documenta la
  tabla de transiciones permitidas.
- Resultado de regla, document_classification, validation_status y
  required_action (none, upload_new_version, wait_for_review,
  wait_for_external_validation, wait_for_processing, correct_data,
  contact_administration).
- Resultado de validación de documento (extracted_data con confianza, rules,
  errors, resubmission_allowed/reason, required_action, validation_version).
- Resultado de validación cruzada (fuentes, campos, resultado, evidencia,
  fecha, regla, motivo).
- Entrega (submission) y respuesta de resubmission_policy.
- Contrato de respuesta para el frontend.

Regla: si resubmission_allowed es true, required_action debe ser
upload_new_version (validación en el esquema).
Incluye pruebas unitarias de esquemas, required_documents y transiciones.
```

## Criterios de aceptación
- [ ] Esquemas y enums creados
- [ ] required_documents(pregrado)=5 y (posgrado)=3
- [ ] Tabla de transiciones documentada
- [ ] Pruebas unitarias pasan
- [ ] Resumen final con lo realmente verificado frente a lo simulado o pendiente.

---
<!-- ajuste-t01 -->
## Ajuste tras el análisis del repositorio (Tarea 01)

Estas instrucciones se suman al prompt de arriba y prevalecen donde lo contradigan. Lee antes `docs/gap_analysis.md`. Decisión tomada: D1 = A (NestJS es la aplicación; el motor de Python corre como proceso trabajador del mismo despliegue, no como servicio aparte).

- Los contratos van en TypeScript con **Zod** como fuente de verdad (`backend/`). Exporta además **JSON Schema** para que el motor de Python valide sus entradas y salidas (Pydantic solo si se genera o valida contra ese JSON Schema). Reemplaza la mención a Pydantic del prompt.
- Usa los nombres de `docs/PROMPT_BASE.md`: `valid`, `invalid`, `inconsistent`, `to_check`; `cumple`, `no_cumple`, `no_evaluable`.
- Incluye una **tabla de mapeo** a lo que existe hoy: frontend `valida/no-valida/inconsistente/por-revisar` y `webapp/` `valida/inconsistente/por_revisar` -> clasificación nueva -> etiqueta en español ("Válido", "No válido", "Inconsistente", "Por revisar").
- Tipos documentales: `cedula`->`identification`, `banner`->`academic_evaluation`, `estampilla`->`estampilla_pro_cultura`, `biblioteca`->`paz_y_salvo_bib`, `saber-pro`->`saber_pro`. `acta_grado` e `icfes` (de `structure.py`) son experimentales: no los incluyas.
- `webapp/` usa `por_revisar` tanto para "no se pudo leer" como para "el RUI no respondió". Modela `no_evaluable` con un campo de **motivo** enumerado (por ejemplo `low_confidence`, `source_unavailable`, `source_pending`, `missing_dependency`) para no volver a mezclarlos.
   - Antes de adoptar Zod, comprueba que la versión elegida funciona con el TypeScript y el modo ESM del backend y cómo exporta JSON Schema (algunas versiones lo traen incluido y otras necesitan un paquete aparte). Si no encaja, propón la alternativa y justifícala.