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
$content00 = "# ⚡ SESSIONE ATTUALE" + "`r`n"
$content00 += "> STATUS: INITIAL BOOT" + "`r`n`r`n"
$content00 += "## 🎯 Obiettivo Unico" + "`r`n"
$content00 += "[Scrivi qui l'obiettivo della sessione]" + "`r`n`r`n"
$content00 += "## 📍 Dove eravamo rimasti" + "`r`n"
$content00 += "- Start: Repository inizializzata" + "`r`n"
$content00 += "- Context: Nessun file aperto" + "`r`n`r`n"
$content00 += "## 📋 Checklist Sessione" + "`r`n"
$content00 += "- [ ] Configurazione iniziale"
New-CraicekFile "docs\00_CONTEXT.md" $content00

# 2. SPECS
$content01 = "# 📘 Project Specifications" + "`r`n"
$content01 += "> The immutable vision of the project." + "`r`n`r`n"
$content01 += "## Vision" + "`r`n"
$content01 += "[Describe what we are building]" + "`r`n`r`n"
$content01 += "## Core Features" + "`r`n"
$content01 += "1. ..."
New-CraicekFile "docs\01_SPECS.md" $content01

# 3. RULES
$content02 = "# 📐 Tech Rules & Standards" + "`r`n"
$content02 += "> Read-only technical constraints." + "`r`n`r`n"
$content02 += "## Tech Stack" + "`r`n"
$content02 += "- Frontend:" + "`r`n"
$content02 += "- Backend:" + "`r`n`r`n"
$content02 += "## Coding Standards" + "`r`n"
$content02 += "1. Use strict typing" + "`r`n"
$content02 += "2. No console.log in production"
New-CraicekFile "docs\02_RULES.md" $content02

# 4. ROADMAP
$content10 = "# 🗺️ Roadmap" + "`r`n"
$content10 += "> High level planning and history." + "`r`n`r`n"
$content10 += "## 🚀 Current Sprint" + "`r`n"
$content10 += "- [ ] Task 1" + "`r`n`r`n"
$content10 += "## 🔮 Backlog" + "`r`n"
$content10 += "- [ ] Future Task"
New-CraicekFile "docs\10_ROADMAP.md" $content10

# 5. MEMORY
$content20 = "# 🧠 Memory & Lessons Learned" + "`r`n"
$content20 += "> Append-only log of critical decisions and errors to avoid." + "`r`n`r`n"
$content20 += "## 🚫 Error Log" + "`r`n"
$content20 += "- [YYYY-MM-DD] ..."
New-CraicekFile "docs\20_MEMORY.md" $content20

# 6. QA
$content30 = "# 🧪 Quality Assurance" + "`r`n"
$content30 += "> Regression testing tables." + "`r`n`r`n"
$content30 += "## 🛡️ Regression Checks" + "`r`n"
$content30 += "| Area | Check | Status |" + "`r`n"
$content30 += "|------|-------|--------|" + "`r`n"
$content30 += "| Auth | Login | [ ] |"
New-CraicekFile "docs\30_QA.md" $content30

# 7. PROTOCOL
$contentProtocol = "# ⚡ CRAICEK PROTOCOL v2.0" + "`r`n"
$contentProtocol += "> SYSTEM INSTRUCTION FOR AI AGENT" + "`r`n`r`n"
$contentProtocol += "## FASE 1: BOOT (Start)" + "`r`n"
$contentProtocol += "1. Read ONLY 'docs/00_CONTEXT.md'." + "`r`n"
$contentProtocol += "2. Do not read other files unless requested." + "`r`n"
$contentProtocol += "3. Confirm the objective." + "`r`n`r`n"
$contentProtocol += "## FASE 2: VIBECODING (Execute)" + "`r`n"
$contentProtocol += "1. Execute tasks in checklist." + "`r`n"
$contentProtocol += "2. If error occurs -> Check 'docs/20_MEMORY.md'." + "`r`n"
$contentProtocol += "3. Monitor Token Usage (Stop at 50%)." + "`r`n`r`n"
$contentProtocol += "## FASE 3: HANDOVER (Stop)" + "`r`n"
$contentProtocol += "WHEN USER SAYS STOP:" + "`r`n"
$contentProtocol += "1. Update 'docs/10_ROADMAP.md' (if task done)." + "`r`n"
$contentProtocol += "2. Save lessons in 'docs/20_MEMORY.md'." + "`r`n"
$contentProtocol += "3. **CRITICAL**: Wipe and Rewrite 'docs/00_CONTEXT.md' with precise snapshot for next session."
New-CraicekFile "docs\Craicek_protocol.md" $contentProtocol

Write-Host "🎉 Craicek Workflow installed successfully!" -ForegroundColor Cyan
Write-Host "👉 Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
