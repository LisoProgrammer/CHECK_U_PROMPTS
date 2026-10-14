
**Fase:** Cierre | **Depende de:** (Tarea 10), (Tarea 11)

**Contexto obligatorio:** lee `docs/PROMPT_BASE.md` antes de empezar. Para más detalle de reglas consulta `docs/PROMPT_MAESTRO.md`.

**Archivos de referencia:** contrato de respuesta para el frontend; indicar si la carpeta activa es frontend/ o webapp/

## Prompt

```
TAREA A (backend): endpoint de consulta que devuelva, según el rol: estado
general, estado y clasificación por documento, reglas ejecutadas, errores,
comentarios, acciones requeridas, historial de versiones, estado del
procesamiento y resubmission_policy.

TAREA B (frontend, Next.js): consume ese contrato sin reglas de negocio.
- Muestra estado y motivo por documento; distingue "corrección requerida" de
  "revisión manual pendiente".
- Deshabilita la carga de documentos sin permiso de reenvío y muestra
  reenvíos restantes y el mensaje al agotar el límite.
- Actualiza estados al terminar el procesamiento (polling o el mecanismo
  existente).
- Nunca muestra como aprobado un documento sin resolver.
- Todo se confirma en el backend; el frontend no decide permisos.
- Vista del personal de grados (filtro por estado, comentarios, estadísticas)
  solo si ya existe en el repo; si no, lístala como pendiente.

Pruebas de componentes y de contrato.
```

## Criterios de aceptación
- [ ] Frontend sin reglas de negocio
- [ ] Distingue corrección requerida de revisión pendiente
- [ ] Pruebas pasan
- [ ] Resumen final con lo realmente verificado frente a lo simulado o pendiente.