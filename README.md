# Paquete de tareas CheckU

## Contenido
- `docs/PROMPT_BASE.md`: contexto común (copiar al repo).
- `docs/PROMPT_MAESTRO.md`: **debes guardar aquí tu prompt maestro original** (no incluido en este paquete).
- `tasks/`: 19 tareas (una por archivo; el Prompt 8 va en cinco: 08a a 08e).
- `scripts/crear_issues.ps1`: crea los issues y los agrega al Kanban.

## Pasos
1. Copia `docs/` a la raíz del repo y haz commit (los issues lo referencian).
2. `winget install GitHub.cli` y luego `gh auth login` y `gh auth refresh -s project`.
3. Ver el número de tu proyecto en la URL `github.com/orgs/ISCOUTB/projects/<N>`.
4. Prueba: `.\scripts\crear_issues.ps1 -Project <N> -DryRun`
5. Un solo issue de prueba: `.\scripts\crear_issues.ps1 -Project <N> -Only 01`
6. Todos: `.\scripts\crear_issues.ps1 -Project <N>` (omite los ya creados).

Requiere PowerShell 7 y permiso de escritura en el repo y el proyecto.
Las dependencias quedan como `#N` en cada issue porque se crean en orden.
