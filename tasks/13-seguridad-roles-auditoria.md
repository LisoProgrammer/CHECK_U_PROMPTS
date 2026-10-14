# Tarea 13 — Seguridad, roles y auditoría

**Fase:** Cierre | **Depende de:** {{T11}}, {{T12}}

**Contexto obligatorio:** lee `docs/PROMPT_BASE.md` antes de empezar. Para más detalle de reglas consulta `docs/PROMPT_MAESTRO.md`.

**Archivos de referencia:** todo lo implementado

## Prompt

```
TAREA: Revisa y completa los controles. No agregues funcionalidades nuevas.

- Roles: estudiante (solo lo suyo), personal de grados, personal de
  Biblioteca, administración. Matriz endpoint x rol, con pruebas.
- Autorización en cada endpoint y en el acceso a archivos originales.
- Secretos por variables de entorno; entornos separados.
- Logs sin datos personales innecesarios; manejo seguro de errores.
- Eventos de auditoría completos: qué archivo, qué versión de reglas, qué
  resultado y por qué cambió cada estado.
- Políticas de retención/eliminación: déjalas parametrizables y marcadas como
  pendientes de definición institucional.

ENTREGABLE: informe de hallazgos con severidad, correcciones aplicadas y
riesgos que quedan abiertos.
```

## Criterios de aceptación
- [ ] Matriz endpoint x rol con pruebas
- [ ] Logs sin datos personales innecesarios
- [ ] Informe de hallazgos entregado
- [ ] Resumen final con lo realmente verificado frente a lo simulado o pendiente.
