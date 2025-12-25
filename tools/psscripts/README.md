# PowerShell Scripts for ArchitectJourney

**Location**: `tools/psscripts/`  
**Purpose**: Automation scripts for content validation, health checks, and repository maintenance

---

## 📋 Available Scripts

### Health Check & Validation

#### `Quick-HealthCheck.ps1`
Fast workspace health check - validates basic structure, file counts, and compliance.

**Usage:**
```powershell
.\tools\psscripts\Quick-HealthCheck.ps1
```

**Checks:**
- File structure (01_Reference, 02_Learning, 03_Interview-Prep)
- Markdown file counts
- Basic naming conventions
- YAML frontmatter presence

---

#### `Validate-FileReferences.ps1`
Validates all file references in markdown files to ensure they point to existing files.

**Usage:**
```powershell
.\tools\psscripts\Validate-FileReferences.ps1
.\tools\psscripts\Validate-FileReferences.ps1 -Path "src\03_Interview-Prep"
```

**Features:**
- Scans all markdown files for references
- Validates relative paths
- Reports broken references
- Supports path filtering

---

#### `Review-EducationalContent.ps1`
General compliance review for educational content rules.

**Usage:**
```powershell
.\tools\psscripts\Review-EducationalContent.ps1
.\tools\psscripts\Review-EducationalContent.ps1 -Path "src\01_Reference"
```

**Checks:**
- YAML frontmatter compliance
- Line count (≤150 lines)
- File naming conventions
- Cross-reference validation

---

### Analysis & Statistics

#### `Get-FileStats.ps1`
File statistics analysis - provides detailed statistics about files in the repository.

**Usage:**
```powershell
.\tools\psscripts\Get-FileStats.ps1
.\tools\psscripts\Get-FileStats.ps1 -Path "src\03_Interview-Prep"
```

---

#### `Get-MarkdownSummary.ps1`
Markdown file analysis - summarizes markdown files with key metrics.

**Usage:**
```powershell
.\tools\psscripts\Get-MarkdownSummary.ps1
```

---

#### `Get-RepoStats.ps1`
Repository overview - provides high-level repository statistics.

**Usage:**
```powershell
.\tools\psscripts\Get-RepoStats.ps1
```

---

### Comparison & Duplication

#### `Compare-DocFiles.ps1`
Compare multiple files for similarities and differences.

**Usage:**
```powershell
.\tools\psscripts\Compare-DocFiles.ps1 -File1 "path1.md" -File2 "path2.md"
```

---

#### `Find-DuplicateContent.ps1`
Find duplicate headings and content patterns across files.

**Usage:**
```powershell
.\tools\psscripts\Find-DuplicateContent.ps1
```

---

### Comprehensive Reviews

#### `Comprehensive-ReferenceReview.ps1`
Deep dive review with CoT/ReAct methodology for file references.

**Usage:**
```powershell
.\tools\psscripts\Comprehensive-ReferenceReview.ps1
```

---

#### `Comprehensive-WorkspaceReview.ps1`
Full workspace validation - comprehensive review of all content.

**Usage:**
```powershell
.\tools\psscripts\Comprehensive-WorkspaceReview.ps1
```

---

### Fix & Repair

#### `Fix-BrokenFileReferences.ps1`
Automatically fixes broken file references where possible.

**Usage:**
```powershell
.\tools\psscripts\Fix-BrokenFileReferences.ps1
```

**Warning**: Review changes before committing!

---

## 🚀 Quick Start

1. **Health Check** (start here):
   ```powershell
   .\tools\psscripts\Quick-HealthCheck.ps1
   ```

2. **Validate References** (after adding content):
   ```powershell
   .\tools\psscripts\Validate-FileReferences.ps1
   ```

3. **Review Content** (before committing):
   ```powershell
   .\tools\psscripts\Review-EducationalContent.ps1
   ```

---

## 📝 Script Development Guidelines

When creating new scripts:

1. **Follow PowerShell best practices**
   - Use `-WhatIf` for destructive operations
   - Provide `-Path` parameter for flexibility
   - Include `-Verbose` for detailed output
   - Return structured objects (not just strings)

2. **Error Handling**
   - Use `try-catch` blocks
   - Provide meaningful error messages
   - Exit with appropriate codes

3. **Documentation**
   - Include comment-based help (`<# ... #>`)
   - Document all parameters
   - Provide usage examples

4. **Testing**
   - Test with sample data first
   - Verify against known good state
   - Handle edge cases

---

## 🔗 Related Documentation

- [Educational Content Rules](../.cursor/rules/01_educational-content-rules.mdc)
- [Repository Structure](../.cursor/rules/02_repository-structure.mdc)
- [Quality Assurance](../.cursor/rules/03_quality-assurance.mdc)

---

**Note**: These scripts are referenced in `.cursor` rules and `copilot-instructions.md`. They should be created as needed for automation and validation tasks.

