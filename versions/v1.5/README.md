# Actualizar los issues con los ajustes de la Tarea 01

1. Copia `ajustes/`, `tareas_nuevas/` y `scripts/actualizar_issues.ps1` a la raiz de tu proyecto (junto a `tasks/` y `scripts/`).
2. `Unblock-File .\scripts\actualizar_issues.ps1`
3. Simulacion: `.\scripts\actualizar_issues.ps1 -DryRun`
4. Prueba con una: `.\scripts\actualizar_issues.ps1 -Only 02`, y revisa el issue en GitHub.
5. Todas: `.\scripts\actualizar_issues.ps1`

Es seguro repetirlo: no duplica ajustes. Cada cuerpo original se guarda en `backup_issues/issue-N.md`.
Para revertir uno: `gh issue edit N --repo ISCOUTB/check_u --body-file backup_issues\issue-N.md`
