<#
Crea una tarea por cada archivo de tasks/ y la agrega al proyecto Kanban.
Modo normal: crea Issues (el repo debe tener Issues activados).
Modo -Draft: crea tarjetas borrador directamente en el tablero (no requiere Issues).

Uso:
  .\crear_issues.ps1 -Project 208 -DryRun            # solo muestra
  .\crear_issues.ps1 -Project 208 -Only 01           # una sola tarea
  .\crear_issues.ps1 -Project 208                    # issues
  .\crear_issues.ps1 -Project 208 -Draft             # borradores (recomendado en PowerShell 7)
#>
param(
  [string]$Repo = "ISCOUTB/check_u",
  [string]$Owner = "ISCOUTB",
  [Parameter(Mandatory = $true)][int]$Project,
  [string]$Only = "",
  [switch]$Draft,
  [switch]$DryRun
)
$ErrorActionPreference = "Stop"
$utf8 = New-Object System.Text.UTF8Encoding $false
$mapFile = Join-Path $PSScriptRoot "issue_map.json"
$map = @{}
if (Test-Path $mapFile) {
  $saved = Get-Content $mapFile -Raw | ConvertFrom-Json
  if ($saved) {
    $saved.PSObject.Properties | ForEach-Object {
      if ($_.Value -and "$($_.Value)" -ne "0") { $map[$_.Name] = $_.Value }
    }
  }
}

if (-not $DryRun -and -not $Draft) {
  gh label create ia-task --repo $Repo --color 0E8A16 --description "Tarea para asistente de IA" --force | Out-Null
  if ($LASTEXITCODE -ne 0) { throw "No se pudo crear la etiqueta en $Repo. Revisa permisos." }
}

$files = Get-ChildItem (Join-Path $PSScriptRoot "..\tasks\*.md") | Sort-Object Name
foreach ($f in $files) {
  $key = ($f.BaseName -split '-')[0]
  if ($Only -and $key -ne $Only) { continue }
  if ($map.ContainsKey($key)) { Write-Host "Omitida (ya creada): $key"; continue }

  $lines = [System.IO.File]::ReadAllLines($f.FullName, $utf8)
  $title = $lines[0] -replace '^#\s*', ''
  $body = ($lines | Select-Object -Skip 1) -join "`n"
  $isDraft = [bool]$Draft
  $body = [regex]::Replace($body, '\{\{T(\w+)\}\}', [System.Text.RegularExpressions.MatchEvaluator]{
    param($m)
    $k = $m.Groups[1].Value
    if (-not $isDraft -and $map.ContainsKey($k) -and "$($map[$k])" -ne "draft") { "#" + $map[$k] } else { "(Tarea $k)" }
  })

  if ($DryRun) { Write-Host "[DRY] $title"; continue }

  if ($Draft) {
    $arg = $body
    # PowerShell < 7.3 no escapa las comillas al llamar programas externos
    if ($PSVersionTable.PSVersion -lt [version]"7.3") { $arg = $body -replace '"', '\"' }
    gh project item-create $Project --owner $Owner --title $title --body $arg | Out-Null
    if ($LASTEXITCODE -ne 0) { throw "Fallo al crear el borrador: $title" }
    $map[$key] = "draft"
    Write-Host "Borrador creado: $title"
  }
  else {
    $tmp = New-TemporaryFile
    [System.IO.File]::WriteAllText($tmp.FullName, $body, $utf8)
    $url = gh issue create --repo $Repo --title $title --body-file $tmp.FullName --label ia-task | Select-Object -Last 1
    $code = $LASTEXITCODE
    Remove-Item $tmp.FullName -ErrorAction SilentlyContinue
    if ($code -ne 0 -or -not $url) { throw "Fallo al crear el issue: $title (revisa que el repo tenga Issues activados)" }
    $map[$key] = [int](($url -split '/')[-1])
    $map | ConvertTo-Json | Set-Content $mapFile -Encoding UTF8
    gh project item-add $Project --owner $Owner --url $url | Out-Null
    if ($LASTEXITCODE -ne 0) { throw "El issue se creó ($url) pero no se pudo agregar al proyecto $Project" }
    Write-Host "Creado: $title -> $url"
    continue
  }
  $map | ConvertTo-Json | Set-Content $mapFile -Encoding UTF8
}
