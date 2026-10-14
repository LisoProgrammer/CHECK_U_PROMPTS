# Tarea 05 — API de solicitudes y entrega inicial

**Fase:** Recepción | **Depende de:** {{T02}}, {{T03}}, {{T04}}

**Contexto obligatorio:** lee `docs/PROMPT_BASE.md` antes de empezar. Para más detalle de reglas consulta `docs/PROMPT_MAESTRO.md`.

**Archivos de referencia:** esquemas, modelo y servicio documental

## Prompt

```
TAREA: Endpoints para crear y consultar solicitudes y registrar la entrega
inicial. No implementes todavía reenvíos ni consulta completa de resultados.

Flujo de la entrega inicial: autenticar, verificar propiedad, resolver nivel
y documentos requeridos, exigir todos los archivos obligatorios (y rechazar
los que no correspondan al nivel, p. ej. saber_pro en posgrado), validar
archivos, crear solicitud y entrega, guardar originales, crear un trabajo por
documento, encolar SIN esperar al OCR, devolver request_id y estado de
recepción.

Reglas: la recepción exitosa no implica validez. La entrega inicial no
consume cupo de reenvío. Soporta clave de idempotencia para evitar
duplicados. Controladores delgados; la lógica va en servicios de aplicación.

Pruebas: pregrado completo, posgrado completo, falta un documento, documento
de más, sin autenticación, solicitud ajena, duplicado idempotente.
```

## Criterios de aceptación
- [ ] Responde sin esperar al OCR
- [ ] Pregrado y posgrado exigen sus documentos exactos
- [ ] Pruebas pasan
- [ ] Resumen final con lo realmente verificado frente a lo simulado o pendiente.
