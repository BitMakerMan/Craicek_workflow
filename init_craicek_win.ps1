<#
.SYNOPSIS
    CRAICEK WORKFLOW INSTALLER (Windows Version)
    Run this script via PowerShell to set up the docs structure.
#>

Write-Host "⚡ Initializing Craicek Workflow..." -ForegroundColor Cyan

# Create docs directory
$docsPath = Join-Path $PSScriptRoot "docs"
if (-not (Test-Path $docsPath)) {
    New-Item -ItemType Directory -Path $docsPath | Out-Null
    Write-Host "📂 Created /docs directory" -ForegroundColor Green
} else {
    Write-Host "📂 /docs directory already exists" -ForegroundColor Yellow
}

# Function to create file
function New-CraicekFile ($fileName, $content) {
    $filePath = Join-Path $PSScriptRoot $fileName
    if (-not (Test-Path $filePath)) {
        Set-Content -Path $filePath -Value $content -Encoding UTF8
        Write-Host "✅ Created $fileName" -ForegroundColor Green
    } else {
        Write-Host "⚠️  $fileName already exists (skipped)" -ForegroundColor Yellow
    }
}

# 1. CONTEXT
$content00 = @"
# ⚡ SESSIONE ATTUALE
> STATUS: INITIAL BOOT

## 🎯 Obiettivo Unico
[Scrivi qui l'obiettivo della sessione]

## 📍 Dove eravamo rimasti
- Start: Repository inizializzata
- Context: Nessun file aperto

## 📋 Checklist Sessione
- [ ] Configurazione iniziale
"@
New-CraicekFile "docs\00_CONTEXT.md" $content00

# 2. SPECS
$content01 = @"
# 📘 Project Specifications
> The immutable vision of the project.

## Vision
[Describe what we are building]

## Core Features
1. ...
"@
New-CraicekFile "docs\01_SPECS.md" $content01

# 3. RULES
$content02 = @"
# 📐 Tech Rules & Standards
> Read-only technical constraints.

## Tech Stack
- Frontend:
- Backend:

## Coding Standards
1. Use strict typing
2. No console.log in production
"@
New-CraicekFile "docs\02_RULES.md" $content02

# 4. ROADMAP
$content10 = @"
# 🗺️ Roadmap
> High level planning and history.

## 🚀 Current Sprint
- [ ] Task 1

## 🔮 Backlog
- [ ] Future Task
"@
New-CraicekFile "docs\10_ROADMAP.md" $content10

# 5. MEMORY
$content20 = @"
# 🧠 Memory & Lessons Learned
> Append-only log of critical decisions and errors to avoid.

## 🚫 Error Log
- [YYYY-MM-DD] ...
"@
New-CraicekFile "docs\20_MEMORY.md" $content20

# 6. QA
$content30 = @"
# 🧪 Quality Assurance
> Regression testing tables.

## 🛡️ Regression Checks
| Area | Check | Status |
|------|-------|--------|
| Auth | Login | [ ] |
"@
New-CraicekFile "docs\30_QA.md" $content30

# 7. PROTOCOL
$contentProtocol = @"
# ⚡ CRAICEK PROTOCOL v2.0
> SYSTEM INSTRUCTION FOR AI AGENT

## FASE 1: BOOT (Start)
1. Read ONLY 'docs/00_CONTEXT.md'.
2. Do not read other files unless requested.
3. Confirm the objective.

## FASE 2: VIBECODING (Execute)
1. Execute tasks in checklist.
2. If error occurs -> Check 'docs/20_MEMORY.md'.
3. Monitor Token Usage (Stop at 50%).

## FASE 3: HANDOVER (Stop)
WHEN USER SAYS STOP:
1. Update 'docs/10_ROADMAP.md' (if task done).
2. Save lessons in 'docs/20_MEMORY.md'.
3. **CRITICAL**: Wipe and Rewrite 'docs/00_CONTEXT.md' with precise snapshot for next session.
"@
New-CraicekFile "docs\Craicek_protocol.md" $contentProtocol

Write-Host "🎉 Craicek Workflow installed successfully!" -ForegroundColor Cyan
Write-Host "👉 Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
