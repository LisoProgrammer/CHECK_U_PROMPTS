
**Fase:** Procesamiento | **Depende de:** (Tarea 03), (Tarea 05)

**Contexto obligatorio:** lee `docs/PROMPT_BASE.md` antes de empezar. Para más detalle de reglas consulta `docs/PROMPT_MAESTRO.md`.

**Archivos de referencia:** modelo (03) y API (05)

## Prompt

```
TAREA: Implementa la cola asíncrona sobre lo que el proyecto ya tenga; si no
hay nada, propón la opción más simple y justifícala (sin añadir
infraestructura innecesaria).

Debe cubrir: estados queued/processing/completed/failed/retry_pending;
reintentos técnicos con límite y espera creciente; registro de errores y
marcas de tiempo; no ejecutar dos veces el mismo trabajo lógico; idempotencia
en persistencia; recuperación de trabajos processing huérfanos; control de
concurrencia; aislamiento de trabajos que fallan repetidamente; un fallo no
bloquea los demás documentos de la solicitud.

Los reintentos técnicos NO consumen reenvíos del estudiante. Completar un
trabajo NO implica solicitud aprobada.

Pruebas: concurrencia, error transitorio y reintento, agotamiento de
intentos, trabajo duplicado, recuperación tras caída simulada.
```

## Criterios de aceptación
- [ ] Reintentos y agotamiento probados
- [ ] Recuperación de trabajos huérfanos
- [ ] Sin ejecución duplicada
- [ ] Resumen final con lo realmente verificado frente a lo simulado o pendiente.