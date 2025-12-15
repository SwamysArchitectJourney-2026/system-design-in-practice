# Script to reorder URL Shortener case study files
# Run this from the repository root

$basePath = "src\07_case-studies\url-shortener"

# Step 1: Rename files to temporary names to avoid conflicts
Write-Host "Step 1: Renaming to temporary names..."
Rename-Item -Path "$basePath\02_high-level-design.md" -NewName "temp_03_high-level-design.md" -ErrorAction Stop
Rename-Item -Path "$basePath\03_low-level-design.md" -NewName "temp_04_low-level-design.md" -ErrorAction Stop
Rename-Item -Path "$basePath\04_scalability.md" -NewName "temp_05_scalability.md" -ErrorAction Stop
Rename-Item -Path "$basePath\05_trade-offs.md" -NewName "temp_08_trade-offs.md" -ErrorAction Stop
Rename-Item -Path "$basePath\06_back-of-envelope.md" -NewName "temp_02_back-of-envelope.md" -ErrorAction Stop
Rename-Item -Path "$basePath\07_observability.md" -NewName "temp_06_observability.md" -ErrorAction Stop
Rename-Item -Path "$basePath\08_security.md" -NewName "temp_07_security.md" -ErrorAction Stop

# Step 2: Rename temporary files to final names
Write-Host "Step 2: Renaming to final names..."
Rename-Item -Path "$basePath\temp_02_back-of-envelope.md" -NewName "02_back-of-envelope.md" -ErrorAction Stop
Rename-Item -Path "$basePath\temp_03_high-level-design.md" -NewName "03_high-level-design.md" -ErrorAction Stop
Rename-Item -Path "$basePath\temp_04_low-level-design.md" -NewName "04_low-level-design.md" -ErrorAction Stop
Rename-Item -Path "$basePath\temp_05_scalability.md" -NewName "05_scalability.md" -ErrorAction Stop
Rename-Item -Path "$basePath\temp_06_observability.md" -NewName "06_observability.md" -ErrorAction Stop
Rename-Item -Path "$basePath\temp_07_security.md" -NewName "07_security.md" -ErrorAction Stop
Rename-Item -Path "$basePath\temp_08_trade-offs.md" -NewName "08_trade-offs.md" -ErrorAction Stop

Write-Host "Files renamed successfully!"
Write-Host "New order:"
Write-Host "  01_requirements.md"
Write-Host "  02_back-of-envelope.md"
Write-Host "  03_high-level-design.md"
Write-Host "  04_low-level-design.md"
Write-Host "  05_scalability.md"
Write-Host "  06_observability.md"
Write-Host "  07_security.md"
Write-Host "  08_trade-offs.md"
Write-Host ""
Write-Host "Next: Update all cross-references in the files."

