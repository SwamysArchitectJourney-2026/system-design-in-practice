<#
.SYNOPSIS
    Quick workspace health check - validates basic structure, file counts, and compliance.

.DESCRIPTION
    Performs a fast health check of the system-design-in-practice repository:
    - Validates folder structure (01_introduction, 02_interview-prep, ...)
    - Counts markdown files
    - Checks basic naming conventions
    - Validates YAML frontmatter presence

.PARAMETER Path
    Optional path to check. Defaults to repository root.

.EXAMPLE
    .\Quick-HealthCheck.ps1

.EXAMPLE
    .\Quick-HealthCheck.ps1 -Path "src\02_interview-prep"
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
    $resolved = Resolve-Path $Path -ErrorAction SilentlyContinue
    if ($resolved) { $resolved.Path } else { $Path }
}

Write-Host "=== Quick Health Check ===" -ForegroundColor Cyan
Write-Host "Repository Root: $repoRoot" -ForegroundColor Gray
Write-Host ""

# Check folder structure
Write-Host "📁 Folder Structure:" -ForegroundColor Yellow
$expectedFolders = @(
    "src\01_introduction",
    "src\02_interview-prep",
    "src\03_foundations",
    "src\04_principles",
    "src\05_building-blocks",
    "src\06_patterns",
    "src\07_case-studies",
    "src\08_failures",
    "src\09_ai-ml-systems",
    "src\references"
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
    $repoRootResolved = (Resolve-Path $repoRoot -ErrorAction SilentlyContinue)
    $base = if ($repoRootResolved) { $repoRootResolved.Path } else { $repoRoot }
    $relPath = $dir.Name.Replace($base, "").TrimStart("\")
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
if ($structureOk) {
    Write-Host "✅ Health Check: PASSED" -ForegroundColor Green
    if ($filesWithoutYaml -gt 0) {
        Write-Host "  - Note: some files are missing YAML frontmatter (warning only)" -ForegroundColor Yellow
    }
    if ($filesOverLimit -gt 0) {
        Write-Host "  - Note: some files exceed 150 lines (warning only)" -ForegroundColor Yellow
    }
    exit 0
}

Write-Host "❌ Health Check: FAILED" -ForegroundColor Red
Write-Host "  - Missing expected folders" -ForegroundColor Red
exit 1

