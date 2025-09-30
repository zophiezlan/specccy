---
description: Create or specify a new NUAA program initiative from community needs description, generating a comprehensive program specification document.
scripts:
  sh: scripts/bash/create-new-program.sh --json "{ARGS}"
  ps: scripts/powershell/create-new-program.ps1 -Json "{ARGS}"
---

The user input to you can be provided directly by the agent or as a command argument - you **MUST** consider it before proceeding with the prompt (if not empty).

User input:

$ARGUMENTS

The text the user typed after `/specify` in the triggering message **is** the program description. Assume you always have it available in this conversation even if `{ARGS}` appears literally below. Do not ask the user to repeat it unless they provided an empty command.

Given that program description, do this:

1. Run the script `{SCRIPT}` from repo root and parse its JSON output for PROGRAM_ID and SPEC_FILE. All file paths must be absolute.
   **IMPORTANT** You must only ever run this script once. The JSON is provided in the terminal as output - always refer to it to get the actual content you're looking for.
2. Load `templates/program-spec-template.md` to understand required sections.
3. Write the specification to SPEC_FILE using the template structure, replacing placeholders with concrete details derived from the program description (arguments) while preserving section order and headings.
4. Report completion with program ID, spec file path, and readiness for the next phase.

**Critical Requirements**:

- All functional requirements must be testable/measurable
- Community voice and peer involvement must be central
- Harm reduction principles must be explicit
- Funding pathway must be identified or marked as needing clarification
- Cultural safety and accessibility must be addressed

**Constitutional Alignment**:
Every program spec must demonstrate alignment with NUAA's constitutional principles:

- Principle I: Peer-Led Development
- Principle II: Evidence-Based Planning
- Principle III: Funding and Compliance Alignment
- Principle IV: Stakeholder Integration
- Principle V: Harm Reduction First

Note: The script creates and initializes the program directory and spec file before writing. Use [NEEDS CLARIFICATION: specific question] for any uncertain aspects rather than making assumptions.
