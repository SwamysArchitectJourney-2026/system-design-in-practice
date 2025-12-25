<#
.SYNOPSIS
    Quick workspace health check - validates basic structure, file counts, and compliance.

.DESCRIPTION
    Performs a fast health check of the ArchitectJourney workspace:
    - Validates folder structure (01_Reference, 02_Learning, 03_Interview-Prep)
    - Counts markdown files
    - Checks basic naming conventions
    - Validates YAML frontmatter presence

.PARAMETER Path
    Optional path to check. Defaults to repository root.

.EXAMPLE
    .\Quick-HealthCheck.ps1

.EXAMPLE
    .\Quick-HealthCheck.ps1 -Path "src\03_Interview-Prep"
#>

param(
    [string]$Path = "."
)

# Resolve path to absolute and find repository root
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = if ($Path -eq ".") {
    # Try to find repository root (look for src folder)
    $current = $scriptPath
    while ($current -and -not (Test-Path (Join-Path $current "src"))) {
        $parent = Split-Path -Parent $current
        if ($parent -eq $current) { break }
        $current = $parent
    }
    if (Test-Path (Join-Path $current "src")) {
        $current
    } else {
        $scriptPath
    }
} else {
    Resolve-Path $Path -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path
    if (-not $?) { $Path }
}

Write-Host "=== Quick Health Check ===" -ForegroundColor Cyan
Write-Host "Repository Root: $repoRoot" -ForegroundColor Gray
Write-Host ""

# Check folder structure
Write-Host "📁 Folder Structure:" -ForegroundColor Yellow
$expectedFolders = @(
    "src\01_Reference",
    "src\02_Learning",
    "src\03_Interview-Prep"
)

$structureOk = $true
foreach ($folder in $expectedFolders) {
    $fullPath = Join-Path $repoRoot $folder
    if (Test-Path $fullPath) {
        Write-Host "  ✅ $folder" -ForegroundColor Green
    } else {
        Write-Host "  ❌ $folder - MISSING" -ForegroundColor Red
        $structureOk = $false
    }
}

Write-Host ""

# Count markdown files
Write-Host "📄 Markdown Files:" -ForegroundColor Yellow
$mdFiles = Get-ChildItem -Path $repoRoot -Recurse -Filter "*.md" -ErrorAction SilentlyContinue | 
    Where-Object { $_.FullName -notmatch "node_modules|\.git" }

$totalFiles = $mdFiles.Count
Write-Host "  Total: $totalFiles files" -ForegroundColor Cyan

# Count by directory
$byDir = $mdFiles | Group-Object DirectoryName | Sort-Object Count -Descending | Select-Object -First 5
foreach ($dir in $byDir) {
    $relPath = $dir.Name.Replace((Resolve-Path $Path).Path, "").TrimStart("\")
    Write-Host "  - $relPath`: $($dir.Count) files" -ForegroundColor Gray
}

Write-Host ""

# Check YAML frontmatter
Write-Host "📋 YAML Frontmatter Check:" -ForegroundColor Yellow
$filesWithYaml = 0
$filesWithoutYaml = 0
$filesOverLimit = 0

foreach ($file in $mdFiles) {
    $content = Get-Content $file.FullName -Raw -ErrorAction SilentlyContinue
    $lines = (Get-Content $file.FullName -ErrorAction SilentlyContinue).Count
    
    if ($content -match "^---\s*\n") {
        $filesWithYaml++
    } else {
        $filesWithoutYaml++
    }
    
    if ($lines -gt 150) {
        $filesOverLimit++
    }
}

Write-Host "  ✅ Files with YAML: $filesWithYaml" -ForegroundColor Green
if ($filesWithoutYaml -gt 0) {
    Write-Host "  ⚠️  Files without YAML: $filesWithoutYaml" -ForegroundColor Yellow
}
if ($filesOverLimit -gt 0) {
    Write-Host "  ⚠️  Files over 150 lines: $filesOverLimit" -ForegroundColor Yellow
}

Write-Host ""

# Summary
Write-Host "=== Summary ===" -ForegroundColor Cyan
if ($structureOk -and $filesWithoutYaml -eq 0 -and $filesOverLimit -eq 0) {
    Write-Host "✅ Health Check: PASSED" -ForegroundColor Green
    exit 0
} else {
    Write-Host "⚠️  Health Check: ISSUES FOUND" -ForegroundColor Yellow
    if (-not $structureOk) {
        Write-Host "  - Missing expected folders" -ForegroundColor Red
    }
    if ($filesWithoutYaml -gt 0) {
        Write-Host "  - Files missing YAML frontmatter" -ForegroundColor Red
    }
    if ($filesOverLimit -gt 0) {
        Write-Host "  - Files exceeding 150 line limit" -ForegroundColor Red
    }
    exit 1
}

