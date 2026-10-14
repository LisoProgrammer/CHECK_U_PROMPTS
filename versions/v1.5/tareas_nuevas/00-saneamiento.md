# Tarea 00 — Saneamiento del repositorio

**Fase:** Base | **Depende de:** Tarea 01 (análisis ya realizado)

**Contexto obligatorio:** lee `docs/PROMPT_BASE.md` y `docs/gap_analysis.md` antes de empezar.

## Prompt

```
TAREA 00: Saneamiento del repositorio. Solo correcciones de higiene; NO
agregues funcionalidades ni cambies comportamiento.

1. backend/: regenera package-lock.json para que `npm ci` funcione (P1).
2. backend/: reemplaza las pruebas de plantilla de NestJS por pruebas reales
   de /api/health y de /api/auth (login, me, logout) que pasen (P2).
3. backend/: corrige el error de lint en src/main.ts (P3).
4. frontend/: haz que `npm run build` pase con una página mínima en
   app/estudiante/preinscripcion/page.tsx (un componente simple con un TODO;
   la página real es otra tarea) (P4).
5. Puertos y entorno (P5): documenta y fija backend=3000 y frontend=3001
   (script `dev` del frontend con -p 3001) y agrega .env.example en backend/
   y frontend/ con NEXT_PUBLIC_API_URL y lo que corresponda, SIN secretos.
6. README reales de backend/ y frontend/ en lugar de las plantillas (P6):
   qué es, cómo instalar, correr, probar y qué variables necesita.
7. ObserveModule con claves de relleno (P7): léelas de variables de entorno o
   desactívalo si no hay clave; sin secretos en git.
8. frontend/app/layout.tsx: lang="es" (P8).

NO toques: webapp/, modules/, firma_electronica/. Los usuarios fijos y la
clave 12345 del backend se reemplazan en la Tarea 13, no aquí.

VERIFICACIÓN (ejecútala): en backend, `npm ci`, `npm test`, `npm run test:e2e`,
`npm run lint`, `npm run build`; en frontend, `npm ci`, `npm run lint`,
`npm run build`. Reporta el resultado real de cada comando.

ENTREGABLE: un solo PR con estos cambios y la salida de la verificación.
```

## Criterios de aceptación
- [ ] `npm ci`, pruebas, lint y build pasan en backend y frontend.
- [ ] Existen `.env.example` y README reales en ambos.
- [ ] No se tocó `webapp/`, `modules/` ni `firma_electronica/`.
- [ ] Resumen final con lo realmente verificado frente a lo pendiente.
