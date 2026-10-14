# Tarea 03 — Modelo de datos, migraciones y repositorios

**Fase:** Fundamentos | **Depende de:** {{T01}}, {{T02}}

**Contexto obligatorio:** lee `docs/PROMPT_BASE.md` antes de empezar. Para más detalle de reglas consulta `docs/PROMPT_MAESTRO.md`.

**Archivos de referencia:** docs/gap_analysis.md, esquemas de la tarea 02

## Prompt

```
TAREA: Diseña e implementa el modelo de persistencia y sus migraciones,
reutilizando lo que ya exista.

Entidades mínimas: estudiante, solicitud, documento, versión de documento,
entrega (initial/resubmission con submission_number, resubmission_number,
local_submission_date), trabajo de procesamiento (intentos, errores, marcas
de tiempo), resultado de extracción, resultado de validación individual,
resultado de validación cruzada, regla y versión de regla, comentario de
revisión, historial de estados, registro de entregas rechazadas, evento de
auditoría.

Requisitos:
- Los resultados se insertan, no se sobrescriben; cada uno referencia versión
  de documento y versión de reglas.
- Restricciones de integridad, índices y claves únicas (una versión por
  documento y número; clave de idempotencia por entrega).
- El conteo de reenvíos debe poder calcularse por estudiante y fecha local,
  no por solicitud.
- Capa de repositorios separada de los servicios.

ENTREGABLE: modelos, migraciones, repositorios, diagrama ER en Mermaid y
pruebas de integridad (versiones, historial, restricciones).
```

## Criterios de aceptación
- [ ] Migraciones aplican y revierten
- [ ] Diagrama ER incluido
- [ ] Pruebas de integridad pasan
- [ ] Resumen final con lo realmente verificado frente a lo simulado o pendiente.
