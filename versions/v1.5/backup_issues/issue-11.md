
**Fase:** Procesamiento | **Depende de:** (Tarea 02), (Tarea 06)

**Contexto obligatorio:** lee `docs/PROMPT_BASE.md` antes de empezar. Para más detalle de reglas consulta `docs/PROMPT_MAESTRO.md`.

**Archivos de referencia:** contratos, cola y modules/ existente

## Prompt

```
TAREA: Implementa el orquestador y un pipeline_registry indexado por
type_document.

- Recibe: request_id, submission_id, document_id, type_document, referencia
  al archivo, nivel académico, datos de referencia autorizados y resultados
  previos relevantes.
- Interfaz común de pipeline: extract(document, context) y
  validate(extraction, context).
- Tipo no registrado => UnsupportedDocumentTypeError, sin romper la cola.
- Persiste extracción y validación, dispara las validaciones cruzadas
  afectadas y pide la consolidación (con stubs si faltan las tareas de
  validación cruzada y consolidador).
- NO contiene reglas de ningún documento. Agregar un tipo nuevo = registrar
  un pipeline, sin tocar el orquestador.
- Crea adaptadores que envuelvan el código existente de modules/ en lugar de
  reescribirlo.

Pruebas: tipo no soportado, pipeline que falla, registro de un pipeline falso
sin modificar el orquestador.
```

## Criterios de aceptación
- [ ] Selecciona pipeline por type_document
- [ ] Sin reglas de negocio dentro
- [ ] Pruebas pasan
- [ ] Resumen final con lo realmente verificado frente a lo simulado o pendiente.