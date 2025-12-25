<#
.SYNOPSIS
    Validates all file references in markdown files to ensure they point to existing files.

.DESCRIPTION
    Scans markdown files for file references (links, cross-refs, prerequisites, etc.)
    and validates that all referenced files exist.

.PARAMETER Path
    Path to scan. Defaults to "src" directory.

.PARAMETER Verbose
    Show detailed output for each file checked.

.EXAMPLE
    .\Validate-FileReferences.ps1

.EXAMPLE
    .\Validate-FileReferences.ps1 -Path "src\03_Interview-Prep" -Verbose
#>

param(
    [string]$Path = "src",
    [switch]$Verbose
)

Write-Host "=== File Reference Validation ===" -ForegroundColor Cyan
Write-Host ""

if (-not (Test-Path $Path)) {
    Write-Host "❌ Path not found: $Path" -ForegroundColor Red
    exit 1
}

# Find all markdown files
$mdFiles = Get-ChildItem -Path $Path -Recurse -Filter "*.md" -ErrorAction SilentlyContinue |
    Where-Object { $_.FullName -notmatch "node_modules|\.git" }

Write-Host "📄 Scanning $($mdFiles.Count) markdown files..." -ForegroundColor Yellow
Write-Host ""

$brokenRefs = @()
$totalRefs = 0
$validRefs = 0

foreach ($file in $mdFiles) {
    $content = Get-Content $file.FullName -Raw -ErrorAction SilentlyContinue
    $fileDir = $file.DirectoryName
    
    # Find references: [text](./path.md), [text](../path.md), etc.
    $refPattern = '\[([^\]]+)\]\(([^)]+\.md)\)'
    $matches = [regex]::Matches($content, $refPattern)
    
    foreach ($match in $matches) {
        $totalRefs++
        $refPath = $match.Groups[2].Value
        
        # Resolve relative path
        $resolvedPath = Join-Path $fileDir $refPath
        $resolvedPath = [System.IO.Path]::GetFullPath($resolvedPath)
        
        if (-not (Test-Path $resolvedPath)) {
            $brokenRefs += [PSCustomObject]@{
                File = $file.FullName.Replace((Get-Location).Path, "").TrimStart("\")
                Reference = $refPath
                Line = ($content.Substring(0, $match.Index) -split "`n").Count
            }
            if ($Verbose) {
                Write-Host "  ❌ $($file.Name) → $refPath" -ForegroundColor Red
            }
        } else {
            $validRefs++
            if ($Verbose) {
                Write-Host "  ✅ $($file.Name) → $refPath" -ForegroundColor Green
            }
        }
    }
}

Write-Host "=== Results ===" -ForegroundColor Cyan
Write-Host "  Total references: $totalRefs" -ForegroundColor Cyan
Write-Host "  ✅ Valid: $validRefs" -ForegroundColor Green
Write-Host "  ❌ Broken: $($brokenRefs.Count)" -ForegroundColor $(if ($brokenRefs.Count -gt 0) { "Red" } else { "Green" })

if ($brokenRefs.Count -gt 0) {
    Write-Host ""
    Write-Host "Broken References:" -ForegroundColor Yellow
    foreach ($ref in $brokenRefs) {
        Write-Host "  - $($ref.File):$($ref.Line) → $($ref.Reference)" -ForegroundColor Red
    }
    exit 1
} else {
    Write-Host ""
    Write-Host "✅ All references valid!" -ForegroundColor Green
    exit 0
}

