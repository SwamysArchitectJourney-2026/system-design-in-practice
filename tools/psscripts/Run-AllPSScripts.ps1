<#
.SYNOPSIS
  Runs all PowerShell scripts in tools/psscripts with safe defaults.

.DESCRIPTION
  This is a convenience runner to "ensure all is well" without accidentally
  triggering scripts that require mandatory parameters or are legacy/mutating.

  Behavior:
  - Runs known health/validation scripts by default.
  - Skips scripts that require mandatory parameters unless -RunParamRequired is set.
  - Skips scripts marked as legacy or potentially mutating unless -IncludeLegacyOrMutating is set.

.PARAMETER RepoRoot
  Repository root path.

.PARAMETER IncludeLegacyOrMutating
  If set, attempts to run scripts that are legacy or might mutate content.

.PARAMETER RunParamRequired
  If set, attempts to run scripts with mandatory params (will still fail unless you provide args).

.PARAMETER IncludeHeavy
  If set, also runs tooling-heavy scripts (node/docker) like Run-MarkdownLintAndLychee.
#>

[CmdletBinding()]
param(
  [string]$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..")),
  [switch]$IncludeLegacyOrMutating,
  [switch]$RunParamRequired,
  [switch]$IncludeHeavy
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repoRootPath = (Resolve-Path $RepoRoot).Path
$psscriptsPath = Join-Path $repoRootPath 'tools\psscripts'

if (-not (Test-Path -LiteralPath $psscriptsPath)) {
  throw "Missing scripts folder: $psscriptsPath"
}

Write-Host "=== Run-AllPSScripts ===" -ForegroundColor Cyan
Write-Host "RepoRoot : $repoRootPath" -ForegroundColor Gray
Write-Host "Scripts  : $psscriptsPath" -ForegroundColor Gray
Write-Host "" 

$scripts = Get-ChildItem -LiteralPath $psscriptsPath -Filter '*.ps1' -File | Sort-Object Name

# Known categories
$legacyOrMutating = @(
  'reorder-url-shortener.ps1'
)

$paramRequired = @(
  'Compare-DocFiles.ps1'
)

$heavy = @(
  'Run-MarkdownLintAndLychee.ps1'
)

$defaultRun = @(
  'Quick-HealthCheck.ps1',
  'Validate-FileReferences.ps1',
  'Test-ContentCompliance.ps1',
  'Verify-ZeroCopy.ps1',
  'Get-RepoStats.ps1',
  'Get-FileStats.ps1',
  'Get-MarkdownSummary.ps1',
  'Find-DuplicateContent.ps1'
)

$results = @()

function Invoke-Script {
  param(
    [Parameter(Mandatory)]
    [System.IO.FileInfo]$ScriptFile,
    [string[]]$Args = @()
  )

  $name = $ScriptFile.Name
  $path = $ScriptFile.FullName

  Write-Host "---" -ForegroundColor DarkGray
  Write-Host "Running: $name" -ForegroundColor Yellow

  $sw = [System.Diagnostics.Stopwatch]::StartNew()
  try {
    Push-Location $repoRootPath
    & $path @Args
    $exit = $LASTEXITCODE
    if ($null -eq $exit) { $exit = 0 }
    $sw.Stop()

    $results += [PSCustomObject]@{
      Script = $name
      Status = if ($exit -eq 0) { 'PASS' } else { 'FAIL' }
      ExitCode = $exit
      Seconds = [Math]::Round($sw.Elapsed.TotalSeconds, 2)
    }

    if ($exit -eq 0) {
      Write-Host "PASS: $name ($($sw.Elapsed.TotalSeconds.ToString('0.00'))s)" -ForegroundColor Green
    } else {
      Write-Host "FAIL: $name (exit $exit, $($sw.Elapsed.TotalSeconds.ToString('0.00'))s)" -ForegroundColor Red
    }
  } catch {
    $sw.Stop()
    $results += [PSCustomObject]@{
      Script = $name
      Status = 'ERROR'
      ExitCode = 1
      Seconds = [Math]::Round($sw.Elapsed.TotalSeconds, 2)
    }
    Write-Host "ERROR: $name - $($_.Exception.Message)" -ForegroundColor Red
  } finally {
    Pop-Location -ErrorAction SilentlyContinue
  }
}

foreach ($script in $scripts) {
  $name = $script.Name

  if ($heavy -contains $name -and -not $IncludeHeavy) {
    $results += [PSCustomObject]@{ Script = $name; Status = 'SKIP'; ExitCode = 0; Seconds = 0 }
    continue
  }

  if ($legacyOrMutating -contains $name -and -not $IncludeLegacyOrMutating) {
    $results += [PSCustomObject]@{ Script = $name; Status = 'SKIP'; ExitCode = 0; Seconds = 0 }
    continue
  }

  if ($paramRequired -contains $name -and -not $RunParamRequired) {
    $results += [PSCustomObject]@{ Script = $name; Status = 'SKIP'; ExitCode = 0; Seconds = 0 }
    continue
  }

  if ($defaultRun -contains $name) {
    Invoke-Script -ScriptFile $script
    continue
  }

  # Unknown scripts: be conservative.
  $results += [PSCustomObject]@{ Script = $name; Status = 'SKIP'; ExitCode = 0; Seconds = 0 }
}

Write-Host "\n=== Summary ===" -ForegroundColor Cyan
$results | Format-Table -AutoSize

$failCount = ($results | Where-Object { $_.Status -in @('FAIL', 'ERROR') } | Measure-Object).Count
if ($failCount -gt 0) {
  throw "One or more scripts failed ($failCount)."
}

Write-Host "All executed scripts passed." -ForegroundColor Green
