
**Fase:** Cierre | **Depende de:** (Tarea 13)

**Contexto obligatorio:** lee `docs/PROMPT_BASE.md` antes de empezar. Para más detalle de reglas consulta `docs/PROMPT_MAESTRO.md`.

**Archivos de referencia:** todo lo implementado y docs/PROMPT_MAESTRO.md (sección 20)

## Prompt

```
TAREA: Crea pruebas end-to-end con datos ficticios y una matriz de
trazabilidad contra los 20 criterios de aceptación de docs/PROMPT_MAESTRO.md.

Escenarios mínimos:
1. Pregrado feliz: 5 documentos válidos hasta ready_for_formal_submission.
2. Posgrado feliz con 3 documentos.
3. Cédula ilegible: reenvío autorizado, solo ese documento, resto conservado.
4. Paz y Salvo en revisión manual: sin reenvío, la solicitud queda en
   awaiting_review.
5. Discrepancia de nombre entre cédula y Banner.
6. Fuente externa pendiente que luego responde.
7. Tres reenvíos aceptados y el cuarto rechazado el mismo día.
8. Falla técnica con reintentos sin consumir cupo.

ENTREGABLE: pruebas ejecutables, tabla criterio -> prueba -> estado
(cubierto / parcial / no cubierto) y lista honesta de lo que sigue siendo
simulado o pendiente.
```

## Criterios de aceptación
- [ ] 8 escenarios ejecutables
- [ ] Tabla de trazabilidad de los 20 criterios
- [ ] Lista honesta de pendientes
- [ ] Resumen final con lo realmente verificado frente a lo simulado o pendiente.