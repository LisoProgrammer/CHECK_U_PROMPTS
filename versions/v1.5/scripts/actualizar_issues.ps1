<#
Actualiza los issues de CheckU con los ajustes del analisis (Tarea 01).
- Encuentra cada issue por su titulo ("Tarea 02 - ...").
- Agrega al final el bloque de ajustes\<clave>.md (una sola vez).
- Convierte las dependencias "(Tarea 03)" en referencias reales "#N".
- Crea la Tarea 00 si no existe.
- Guarda una copia de cada cuerpo original en backup_issues\ antes de editar.

Uso (PowerShell 7 recomendado):
  .\scripts\actualizar_issues.ps1 -DryRun          # solo muestra
  .\scripts\actualizar_issues.ps1 -Only 02         # una tarea de prueba
  .\scripts\actualizar_issues.ps1                  # todas
#>
param(
  [string]$Repo = "ISCOUTB/check_u",
  [string]$Owner = "ISCOUTB",
  [int]$Project = 208,
  [string]$Only = "",
  [switch]$SinDependencias,
  [switch]$DryRun
)
$ErrorActionPreference = "Stop"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8
$utf8 = New-Object System.Text.UTF8Encoding $false
$root = Join-Path $PSScriptRoot ".."
$marker = "<!-- ajuste-t01 -->"
$bad = [regex]::new("[" + [char]0x00C3 + [char]0x00C2 + [char]0xFFFD + "]")
$backup = Join-Path $root "backup_issues"
if (-not (Test-Path $backup)) { New-Item -ItemType Directory $backup | Out-Null }

$raw = (gh issue list --repo $Repo --state all --limit 200 --json number,title,body) -join "`n"
if ($LASTEXITCODE -ne 0) { throw "No se pudo listar los issues de $Repo (gh auth status?)." }
$issues = $raw | ConvertFrom-Json
$byKey = @{}
foreach ($i in $issues) {
  if ($i.title -match '^Tarea\s+(\w+)\b') { $byKey[$Matches[1].ToLower()] = $i }
}
Write-Host ("Issues de tarea encontrados: " + $byKey.Count)

function Resolve-Deps([string]$text) {
  [regex]::Replace($text, '\(Tarea (\w+)\)', [System.Text.RegularExpressions.MatchEvaluator]{
    param($m)
    $k = $m.Groups[1].Value.ToLower()
    if ($byKey.ContainsKey($k)) { "#" + $byKey[$k].number } else { $m.Value }
  })
}

# Tarea 00 (nueva)
if (-not $byKey.ContainsKey("00") -and (-not $Only -or $Only -eq "00")) {
  $nf = Join-Path $root "tareas_nuevas\00-saneamiento.md"
  $lines = [System.IO.File]::ReadAllLines($nf, $utf8)
  $title = $lines[0] -replace '^#\s*', ''
  $body = ($lines | Select-Object -Skip 1) -join "`n"
  if ($DryRun) { Write-Host "[DRY] crearia: $title" }
  else {
    gh label create ia-task --repo $Repo --color 0E8A16 --force | Out-Null
    $tmp = New-TemporaryFile
    [System.IO.File]::WriteAllText($tmp.FullName, $body, $utf8)
    $url = gh issue create --repo $Repo --title $title --body-file $tmp.FullName --label ia-task | Select-Object -Last 1
    $code = $LASTEXITCODE
    Remove-Item $tmp.FullName -ErrorAction SilentlyContinue
    if ($code -ne 0 -or -not $url) { throw "No se pudo crear la Tarea 00." }
    gh project item-add $Project --owner $Owner --url $url | Out-Null
    $num = [int](($url -split '/')[-1])
    $byKey["00"] = [pscustomobject]@{ number = $num; title = $title; body = $body }
    Write-Host "Creado: $title -> $url"
  }
}

foreach ($key in ($byKey.Keys | Sort-Object)) {
  if ($Only -and $key -ne $Only.ToLower()) { continue }
  $i = $byKey[$key]
  $orig = [string]$i.body
  if ($bad.IsMatch($orig)) { throw "El cuerpo de #$($i.number) parece tener caracteres danados. Usa PowerShell 7 (pwsh) y vuelve a intentar." }
  $new = $orig
  if (-not $SinDependencias) { $new = Resolve-Deps $new }
  $ajf = Join-Path $root "ajustes\$key.md"
  if ((Test-Path $ajf) -and (-not $new.Contains($marker))) {
    $aj = [System.IO.File]::ReadAllText($ajf, $utf8)
    $new = $new.TrimEnd() + "`n`n---`n" + $aj.Trim() + "`n"
  }
  if ($new -eq $orig) { Write-Host "Sin cambios: #$($i.number) $($i.title)"; continue }
  if ($DryRun) { Write-Host "[DRY] editaria #$($i.number): $($i.title)"; continue }
  [System.IO.File]::WriteAllText((Join-Path $backup "issue-$($i.number).md"), $orig, $utf8)
  $tmp = New-TemporaryFile
  [System.IO.File]::WriteAllText($tmp.FullName, $new, $utf8)
  gh issue edit $i.number --repo $Repo --body-file $tmp.FullName | Out-Null
  $code = $LASTEXITCODE
  Remove-Item $tmp.FullName -ErrorAction SilentlyContinue
  if ($code -ne 0) { throw "Fallo al editar #$($i.number)." }
  Write-Host "Actualizado: #$($i.number) $($i.title)"
}
