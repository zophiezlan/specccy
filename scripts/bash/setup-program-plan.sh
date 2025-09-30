#!/bin/bash

# Setup program plan directory and initialize plan.md file
# Usage: setup-program-plan.sh --json

set -euo pipefail

# Default values
JSON_MODE=false

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --json)
            JSON_MODE=true
            shift
            ;;
        *)
            echo "Error: Unknown argument $1" >&2
            exit 1
            ;;
    esac
done

# Find the repository root
REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
PROGRAMS_DIR="$REPO_ROOT/programs"

# Find the current program directory (most recent by number)
CURRENT_PROGRAM_DIR=""
if [[ -d "$PROGRAMS_DIR" ]]; then
    for dir in "$PROGRAMS_DIR"/[0-9][0-9][0-9]-*/; do
        if [[ -d "$dir" ]]; then
            CURRENT_PROGRAM_DIR="$dir"
        fi
    done
fi

if [[ -z "$CURRENT_PROGRAM_DIR" || ! -d "$CURRENT_PROGRAM_DIR" ]]; then
    echo "Error: No program directory found. Run /specify first." >&2
    exit 1
fi

# Remove trailing slash
CURRENT_PROGRAM_DIR=${CURRENT_PROGRAM_DIR%/}

# Check if spec.md exists
PROGRAM_SPEC="$CURRENT_PROGRAM_DIR/spec.md"
if [[ ! -f "$PROGRAM_SPEC" ]]; then
    echo "Error: Program specification not found at $PROGRAM_SPEC" >&2
    exit 1
fi

# Create plan.md from template
IMPL_PLAN="$CURRENT_PROGRAM_DIR/plan.md"
TEMPLATE_FILE="$REPO_ROOT/templates/program-plan-template.md"

if [[ -f "$TEMPLATE_FILE" ]]; then
    cp "$TEMPLATE_FILE" "$IMPL_PLAN"
    
    # Extract program ID from directory name
    PROGRAM_ID=$(basename "$CURRENT_PROGRAM_DIR")
    
    # Replace basic placeholders in plan template
    sed -i "s/\[PROGRAM\]/$PROGRAM_ID/g" "$IMPL_PLAN" 2>/dev/null || \
    sed -i '' "s/\[PROGRAM\]/$PROGRAM_ID/g" "$IMPL_PLAN" 2>/dev/null || true
    
    sed -i "s/\[###-program-name\]/$PROGRAM_ID/g" "$IMPL_PLAN" 2>/dev/null || \
    sed -i '' "s/\[###-program-name\]/$PROGRAM_ID/g" "$IMPL_PLAN" 2>/dev/null || true
    
    sed -i "s/\[DATE\]/$(date +%Y-%m-%d)/g" "$IMPL_PLAN" 2>/dev/null || \
    sed -i '' "s/\[DATE\]/$(date +%Y-%m-%d)/g" "$IMPL_PLAN" 2>/dev/null || true
else
    echo "Error: Program plan template not found at $TEMPLATE_FILE" >&2
    exit 1
fi

# Check for available documents
AVAILABLE_DOCS=()
[[ -f "$CURRENT_PROGRAM_DIR/research.md" ]] && AVAILABLE_DOCS+=("research.md")
[[ -f "$CURRENT_PROGRAM_DIR/stakeholder-map.md" ]] && AVAILABLE_DOCS+=("stakeholder-map.md")
[[ -f "$CURRENT_PROGRAM_DIR/service-model.md" ]] && AVAILABLE_DOCS+=("service-model.md")
[[ -f "$CURRENT_PROGRAM_DIR/evaluation-framework.md" ]] && AVAILABLE_DOCS+=("evaluation-framework.md")

# Output results
if $JSON_MODE; then
    # Build JSON array of available documents
    if [[ ${#AVAILABLE_DOCS[@]} -eq 0 ]]; then
        json_docs="[]"
    else
        json_docs=$(printf '"%s",' "${AVAILABLE_DOCS[@]}")
        json_docs="[${json_docs%,}]"
    fi
    
    printf '{"PROGRAM_SPEC":"%s","IMPL_PLAN":"%s","PROGRAMS_DIR":"%s","PROGRAM_ID":"%s","AVAILABLE_DOCS":%s}\n' \
        "$PROGRAM_SPEC" "$IMPL_PLAN" "$CURRENT_PROGRAM_DIR" "$(basename "$CURRENT_PROGRAM_DIR")" "$json_docs"
else
    echo "Program plan setup complete:"
    echo "  Program Spec: $PROGRAM_SPEC"
    echo "  Implementation Plan: $IMPL_PLAN"
    echo "  Program Directory: $CURRENT_PROGRAM_DIR"
    echo "  Available Docs: ${AVAILABLE_DOCS[*]:-none}"
    echo "  Ready for /plan command execution"
fi