#!/bin/bash

# Create a new NUAA program directory and initialize spec.md file
# Usage: create-new-program.sh --json "program description"

set -euo pipefail

# Default values
JSON_MODE=false
PROGRAM_DESCRIPTION=""

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --json)
            JSON_MODE=true
            shift
            ;;
        *)
            if [[ -z "$PROGRAM_DESCRIPTION" ]]; then
                PROGRAM_DESCRIPTION="$1"
            else
                echo "Error: Multiple program descriptions provided" >&2
                exit 1
            fi
            shift
            ;;
    esac
done

# Validate input
if [[ -z "$PROGRAM_DESCRIPTION" ]]; then
    echo "Error: Program description is required" >&2
    exit 1
fi

# Find the repository root
REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
PROGRAMS_DIR="$REPO_ROOT/programs"

# Create programs directory if it doesn't exist
mkdir -p "$PROGRAMS_DIR"

# Find the next available program number
NEXT_NUM=1
if [[ -d "$PROGRAMS_DIR" ]]; then
    for dir in "$PROGRAMS_DIR"/[0-9][0-9][0-9]-*/; do
        if [[ -d "$dir" ]]; then
            basename_dir=$(basename "$dir")
            num="${basename_dir:0:3}"
            if [[ "$num" =~ ^[0-9]{3}$ ]]; then
                if (( num >= NEXT_NUM )); then
                    NEXT_NUM=$((num + 1))
                fi
            fi
        fi
    done
fi

# Format the program number (zero-padded to 3 digits)
PROGRAM_NUM=$(printf "%03d" "$NEXT_NUM")

# Generate program name from description
# Take first 3-5 words, convert to kebab-case
PROGRAM_NAME=$(echo "$PROGRAM_DESCRIPTION" | \
    sed 's/[^a-zA-Z0-9 ]//g' | \
    tr '[:upper:]' '[:lower:]' | \
    awk '{for(i=1;i<=5 && i<=NF;i++) printf "%s%s", $i, (i<5 && i<NF ? "-" : "")}' | \
    sed 's/-$//')

# Create full program ID
PROGRAM_ID="${PROGRAM_NUM}-${PROGRAM_NAME}"
PROGRAM_DIR="$PROGRAMS_DIR/$PROGRAM_ID"

# Create program directory
mkdir -p "$PROGRAM_DIR"

# Create initial spec.md file from template
SPEC_FILE="$PROGRAM_DIR/spec.md"
TEMPLATE_FILE="$REPO_ROOT/templates/program-spec-template.md"

if [[ -f "$TEMPLATE_FILE" ]]; then
    cp "$TEMPLATE_FILE" "$SPEC_FILE"
    # Replace basic placeholders
    sed -i "s/\[PROGRAM_NAME\]/$PROGRAM_NAME/g" "$SPEC_FILE" 2>/dev/null || \
    sed -i '' "s/\[PROGRAM_NAME\]/$PROGRAM_NAME/g" "$SPEC_FILE" 2>/dev/null || true
    
    sed -i "s/\[###-program-name\]/$PROGRAM_ID/g" "$SPEC_FILE" 2>/dev/null || \
    sed -i '' "s/\[###-program-name\]/$PROGRAM_ID/g" "$SPEC_FILE" 2>/dev/null || true
    
    sed -i "s/\[DATE\]/$(date +%Y-%m-%d)/g" "$SPEC_FILE" 2>/dev/null || \
    sed -i '' "s/\[DATE\]/$(date +%Y-%m-%d)/g" "$SPEC_FILE" 2>/dev/null || true
else
    # Create basic spec file if template doesn't exist
    cat > "$SPEC_FILE" << EOF
# Program Specification: $PROGRAM_NAME

**Program ID**: \`$PROGRAM_ID\`  
**Created**: $(date +%Y-%m-%d)  
**Status**: Draft  
**Input**: Program description: "$PROGRAM_DESCRIPTION"

## Program Requirements

[Content will be generated using /specify command]
EOF
fi

# Output results
if $JSON_MODE; then
    printf '{"PROGRAM_ID":"%s","PROGRAM_DIR":"%s","SPEC_FILE":"%s","PROGRAM_NAME":"%s"}\n' \
        "$PROGRAM_ID" "$PROGRAM_DIR" "$SPEC_FILE" "$PROGRAM_NAME"
else
    echo "Created new NUAA program:"
    echo "  Program ID: $PROGRAM_ID"
    echo "  Directory: $PROGRAM_DIR"
    echo "  Spec file: $SPEC_FILE"
    echo "  Ready for /specify command"
fi