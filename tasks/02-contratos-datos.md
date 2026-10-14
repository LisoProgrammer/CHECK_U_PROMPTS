# Tarea 02 — Contratos de datos y enumeraciones

**Fase:** Fundamentos | **Depende de:** {{T01}}

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
