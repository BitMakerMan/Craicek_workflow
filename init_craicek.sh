#!/bin/bash

# CRAICEK WORKFLOW INSTALLER
# Run this script in the root of your project to set up the docs structure.

echo "⚡ Initializing Craicek Workflow..."

# Create directory
if [ ! -d "docs" ]; then
  mkdir docs
  echo "📂 Created /docs directory"
else
  echo "📂 /docs directory already exists"
fi

# Function to create file if not exists
create_file() {
    if [ ! -f "$1" ]; then
        echo "$2" > "$1"
        echo "✅ Created $1"
    else
        echo "⚠️  $1 already exists (skipped)"
    fi
}

# 1. CONTEXT (RAM)
create_file "docs/00_CONTEXT.md" "# ⚡ SESSIONE ATTUALE
> STATUS: INITIAL BOOT

## 🎯 Obiettivo Unico
[Scrivi qui l'obiettivo della sessione]

## 📍 Dove eravamo rimasti
- Start: Repository inizializzata
- Context: Nessun file aperto

## 📋 Checklist Sessione
- [ ] Configurazione iniziale"

# 2. SPECS (ROM)
create_file "docs/01_SPECS.md" "# 📘 Project Specifications
> The immutable vision of the project.

## Vision
[Describe what we are building]

## Core Features
1. ..."

# 3. RULES (ROM)
create_file "docs/02_RULES.md" "# 📐 Tech Rules & Standards
> Read-only technical constraints.

## Tech Stack
- Frontend:
- Backend:

## Coding Standards
1. Use strict typing
2. No console.log in production"

# 4. ROADMAP (DB)
create_file "docs/10_ROADMAP.md" "# 🗺️ Roadmap
> High level planning and history.

## 🚀 Current Sprint
- [ ] Task 1

## 🔮 Backlog
- [ ] Future Task"

# 5. MEMORY (LOG)
create_file "docs/20_MEMORY.md" "# 🧠 Memory & Lessons Learned
> Append-only log of critical decisions and errors to avoid.

## 🚫 Error Log
- [YYYY-MM-DD] ..."

# 6. QA (TEST)
create_file "docs/30_QA.md" "# 🧪 Quality Assurance
> Regression testing tables.

## 🛡️ Regression Checks
| Area | Check | Status |
|------|-------|--------|
| Auth | Login | [ ] |"

# 7. PROTOCOL (KERNEL)
create_file "docs/Craicek_protocol.md" "# ⚡ CRAICEK PROTOCOL v2.0
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
"

echo "🎉 Craicek Workflow installed successfully!"
echo "👉 Run: 'chmod +x init_craicek.sh' if needed."
