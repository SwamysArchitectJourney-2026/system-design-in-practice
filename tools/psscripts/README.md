# PowerShell Scripts for system-design-in-practice

**Location**: `tools/psscripts/`

**Purpose**: Automation scripts for validation and repository maintenance (Windows 11 + PowerShell).

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

- File structure (`src/01_introduction` through `src/09_ai-ml-systems`, plus `src/references`)
- Markdown file counts
- Basic naming conventions
- YAML frontmatter presence (warning-only)

---

#### `Validate-FileReferences.ps1`

Validates all file references in markdown files to ensure they point to existing files.

**Usage:**

```powershell
.\tools\psscripts\Validate-FileReferences.ps1
.\tools\psscripts\Validate-FileReferences.ps1 -Path "src\07_case-studies"
```

**Features:**

- Scans all markdown files for references
- Validates relative paths
- Reports broken references
- Supports path filtering

---

### Linting & Link Checking

#### `Run-MarkdownLintAndLychee.ps1`

Runs Markdown lint (`markdownlint-cli2`) and link checking (Lychee) for the repository.

**Usage:**

```powershell
.\tools\psscripts\Run-MarkdownLintAndLychee.ps1
```

---

### One-off Maintenance

#### `reorder-url-shortener.ps1`

Legacy helper for a past rename/reorder of the URL Shortener case study. The repository is already in the final naming scheme.

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

3. **Lint + Link Check** (before committing):

   ```powershell
   .\tools\psscripts\Run-MarkdownLintAndLychee.ps1
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

- [Educational Content Rules](../../.cursor/rules/01_educational-content-rules.mdc)
- [Repository Structure](../../.cursor/rules/02_repository-structure.mdc)
- [Quality Assurance](../../.cursor/rules/03_quality-assurance.mdc)

---

**Note**: These scripts are referenced in `.cursor` rules and `copilot-instructions.md`. Keep them accurate to this repository’s structure.

