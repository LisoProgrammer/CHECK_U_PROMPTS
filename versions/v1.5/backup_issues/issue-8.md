
**Fase:** Recepción | **Depende de:** (Tarea 02), (Tarea 03)

**Contexto obligatorio:** lee `docs/PROMPT_BASE.md` antes de empezar. Para más detalle de reglas consulta `docs/PROMPT_MAESTRO.md`.

**Archivos de referencia:** esquemas (02) y modelo (03)

## Prompt

```
TAREA: Implementa el servicio de gestión documental y el de versiones.

- Almacenamiento privado, con nombres internos no controlados por el usuario,
  detrás de una interfaz (adaptador) para poder cambiar el backend de
  almacenamiento.
- Validación de formato, tamaño y contenido real del archivo (magic bytes, no
  solo extensión). Archivos corruptos o no compatibles se rechazan con motivo
  claro.
- Versionado: una nueva versión nunca borra la anterior ni sus resultados;
  guarda hash, tamaño, tipo y metadatos.
- Operaciones: guardar versión, obtener versión actual, listar historial,
  entregar archivo solo a quien tenga permiso.

Pruebas: archivo válido, extensión falsa, corrupto, demasiado grande, nueva
versión conserva la anterior.
```

## Criterios de aceptación
- [ ] Validación por contenido real
- [ ] Versiones anteriores conservadas
- [ ] Pruebas pasan
- [ ] Resumen final con lo realmente verificado frente a lo simulado o pendiente.