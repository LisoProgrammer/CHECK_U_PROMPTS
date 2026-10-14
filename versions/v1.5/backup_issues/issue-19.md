
**Fase:** Lógica avanzada | **Depende de:** (Tarea 05), (Tarea 10)

**Contexto obligatorio:** lee `docs/PROMPT_BASE.md` antes de empezar. Para más detalle de reglas consulta `docs/PROMPT_MAESTRO.md`.

**Archivos de referencia:** modelo, API y consolidador

## Prompt

```
TAREA: Implementa el endpoint de entrega de corrección y el gestor de
límites.

Política: 1 entrega inicial + máximo 3 reenvíos de corrección por ESTUDIANTE
por día calendario en America/Bogota (hasta 4 entregas al día). El contador
se reinicia a medianoche local y no se acumula. Crear otra solicitud no evade
el límite.

- Una entrega de corrección cuenta como UN reenvío sin importar cuántos
  documentos incluya.
- No cuentan: entrega inicial, reintentos técnicos, consultas, validaciones
  cruzadas, revisión manual, resultados externos, entregas rechazadas o
  técnicamente inválidas (estas se registran para auditoría).
- Verificaciones antes de aceptar: autenticación, propiedad, que la solicitud
  admita correcciones, que cada documento tenga resubmission_allowed=true,
  límite diario, restricciones técnicas, duplicado (idempotencia).
- Atomicidad: transacción/bloqueo para que solicitudes concurrentes no
  superen 3. Nada de lógica solo en el frontend.
- Rechazo por límite: mensaje claro y fecha desde la que puede volver a
  enviar.
- Al aceptar: nueva versión solo de los documentos reemplazados, conserva los
  demás, encola solo lo necesario, recalcula validaciones cruzadas afectadas.
- Expón resubmission_policy (daily_limit, used_today, remaining_today,
  timezone, local_date).

Pruebas obligatorias:
1 entrega inicial sin consumo; 2 primer, segundo y tercer reenvío aceptados;
3 cuarto reenvío rechazado el mismo día; 4 reinicio al cambiar la fecha
local; 5 varios documentos = un solo reenvío; 6 documento válido sin permiso
no se reemplaza; 7 to_check de revisión manual no admite reenvío; 8 to_check
que pide nueva versión sí lo admite; 9 rechazo por límite no consume cupo;
10 dos solicitudes concurrentes por el último cupo; 11 intento de evadir con
una solicitud nueva; 12 reintento técnico no consume cupo.
```

## Criterios de aceptación
- [ ] Atomicidad verificada con concurrencia
- [ ] Contador por estudiante y fecha local America/Bogota
- [ ] Las 12 pruebas obligatorias pasan
- [ ] Resumen final con lo realmente verificado frente a lo simulado o pendiente.