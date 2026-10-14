# Tarea 01 — Auditoría del repositorio y análisis de brechas

**Fase:** Base | **Depende de:** ninguna

**Contexto obligatorio:** lee `docs/PROMPT_BASE.md` antes de empezar. Para más detalle de reglas consulta `docs/PROMPT_MAESTRO.md`.

**Archivos de referencia:** todo el repo (backend/, frontend/, webapp/, modules/, firma_electronica/, ocr_tuner.py, iniciar.ps1, Obsidian/)

## Prompt

```
TAREA: Solo análisis. NO modifiques código.

1. Recorre el repo: backend/, frontend/, webapp/, modules/, firma_electronica/,
   ocr_tuner.py, iniciar.ps1, Obsidian/. Determina cuáles carpetas están
   activas y cuáles son legado o experimentos (especialmente frontend vs webapp).
2. Documenta: stack (framework, ORM, BD, librerías OCR, cola si existe),
   endpoints actuales, modelos, flujo actual de procesamiento y qué validadores
   ya existen en modules/.
3. Para cada componente indica estado (existe / parcial / falta): API de
   solicitudes, gestión documental, versiones, cola, orquestador, OCR,
   validadores por tipo, validación cruzada, consolidador, persistencia e
   historial, reenvíos y límite diario, notificaciones/estados.
4. Lista discrepancias entre el código y las reglas del proyecto: estados de
   solicitud y documento usados hoy, soporte de cédula de extranjería, regla de
   Saber Pro (>=100), firma criptográfica de Paz y Salvo, roles existentes.
5. Propón un plan por etapas con riesgos y decisiones que debo tomar.

ENTREGABLE: docs/gap_analysis.md y un resumen corto en la respuesta.
```

## Criterios de aceptación
- [ ] Existe docs/gap_analysis.md
- [ ] Identifica carpetas activas vs legado
- [ ] No se modificó código
- [ ] Resumen final con lo realmente verificado frente a lo simulado o pendiente.
