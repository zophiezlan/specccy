---
description: "Program implementation plan template for NUAA initiatives"
scripts:
  sh: scripts/bash/update-agent-context.sh __AGENT__
  ps: scripts/powershell/update-agent-context.ps1 -AgentType __AGENT__
---

# Program Implementation Plan: [PROGRAM]

**Program ID**: `[###-program-name]` | **Date**: [DATE] | **Spec**: [link]
**Input**: Program specification from `/programs/[###-program-name]/spec.md`

## Execution Flow (/plan command scope)

```
1. Load program spec from Input path
   → If not found: ERROR "No program spec at {path}"
2. Fill Program Context (scan for NEEDS CLARIFICATION)
   → Detect Program Type from description (service delivery, advocacy, training, outreach)
   → Set Structure Decision based on program type
3. Fill the Constitution Check section based on the content of the constitution document.
4. Evaluate Constitution Check section below
   → If violations exist: Document in Complexity Tracking
   → If no justification possible: ERROR "Simplify approach first"
   → Update Progress Tracking: Initial Constitution Check
5. Execute Phase 0 → research.md
   → If NEEDS CLARIFICATION remain: ERROR "Resolve unknowns"
6. Execute Phase 1 → stakeholder-map.md, service-model.md, evaluation-framework.md, program-specific guidance file
7. Re-evaluate Constitution Check section
   → If new violations: Refactor design, return to Phase 1
   → Update Progress Tracking: Post-Design Constitution Check
8. Plan Phase 2 → Describe activity generation approach (DO NOT create activities.md)
9. STOP - Ready for /activities command
```

**IMPORTANT**: The /plan command STOPS at step 8. Phases 2-4 are executed by other commands:

- Phase 2: /activities command creates activities.md
- Phase 3-4: Program implementation execution

## Summary

[Extract from program spec: primary community need + service approach from research]

## Program Context

**Program Type**: [e.g., NSP Service, Peer Training, Outreach, Advocacy Campaign or NEEDS CLARIFICATION]  
**Target Population**: [e.g., PWID in regional NSW, young people who use drugs, peers seeking employment or NEEDS CLARIFICATION]  
**Geographic Scope**: [e.g., Statewide NSW, Sydney Metro, Specific LHD regions or NEEDS CLARIFICATION]  
**Service Delivery Model**: [e.g., peer-led, clinical, outreach, digital/remote or NEEDS CLARIFICATION]  
**Primary Partners**: [e.g., NSW Health, Local Health Districts, community organizations or NEEDS CLARIFICATION]
**Funding Source**: [primary grant/funding program or NEEDS CLARIFICATION]  
**Duration**: [e.g., 12 months, ongoing, 3-year grant cycle or NEEDS CLARIFICATION]  
**Success Metrics**: [domain-specific, e.g., equipment distribution targets, training completions, reach targets or NEEDS CLARIFICATION]  
**Compliance Framework**: [regulatory/funder requirements, e.g., NSW Health guidelines, grant conditions or NEEDS CLARIFICATION]

## Constitution Check

_GATE: Must pass before Phase 0 research. Re-check after Phase 1 design._

### Peer-Led Development Gate (Principle I)

- [ ] Community consultation planned for design phase?
- [ ] Peer workers involved in service delivery model?
- [ ] Community feedback mechanisms included?
- [ ] "Nothing About Us Without Us" principle embedded?

### Evidence-Based Planning Gate (Principle II)

- [ ] Literature review planned?
- [ ] Needs assessment data referenced?
- [ ] Best practice examples identified?
- [ ] Decision rationale documented?

### Funding & Compliance Gate (Principle III)

- [ ] Primary funding source confirmed?
- [ ] Grant conditions documented?
- [ ] KPI targets specified?
- [ ] Compliance framework identified?
- [ ] Reporting requirements mapped?

### Stakeholder Integration Gate (Principle IV)

- [ ] All stakeholder categories identified?
- [ ] Engagement strategy planned?
- [ ] Partner roles clarified?
- [ ] Communication plan outlined?

### Harm Reduction First Gate (Principle V)

- [ ] Harm reduction principles explicitly referenced?
- [ ] No abstinence-only approaches?
- [ ] Dignity and human rights centered?
- [ ] Evidence-based harm reduction methods used?

_If any gate fails: Document in Complexity Tracking or redesign approach_

## Program Structure

### Documentation (this program)

```
programs/[###-program]/
├── plan.md                    # This file (/plan command output)
├── research.md               # Phase 0 output (/plan command)
├── stakeholder-map.md        # Phase 1 output (/plan command)
├── service-model.md          # Phase 1 output (/plan command)
├── evaluation-framework.md   # Phase 1 output (/plan command)
└── activities.md             # Phase 2 output (/activities command - NOT created by /plan)
```

### Service Delivery Structure (program implementation)

<!--
  ACTION REQUIRED: Replace the placeholder structure below with the concrete layout
  for this program. Delete unused options and expand the chosen structure with
  real organizational elements. The delivered plan must not include Option labels.
-->

```
# [REMOVE IF UNUSED] Option 1: Direct service delivery (DEFAULT)
service-delivery/
├── peer-workers/
├── clinical-support/
├── community-outreach/
└── administration/

evaluation/
├── data-collection/
├── outcome-measurement/
└── reporting/

# [REMOVE IF UNUSED] Option 2: Training/Education program
training-delivery/
├── curriculum-development/
├── peer-educators/
├── participant-support/
└── evaluation/

resources/
├── training-materials/
├── assessment-tools/
└── certification/

# [REMOVE IF UNUSED] Option 3: Advocacy/Campaign initiative
advocacy/
├── policy-research/
├── community-mobilization/
├── media-engagement/
└── stakeholder-relations/

campaign-materials/
├── communications/
├── educational-resources/
└── evaluation-tools/
```

**Structure Decision**: [Based on Program Type - choose one structure above and detail specific organizational elements]

## Phase 0: Research & Evidence Gathering

_Prerequisites: Program spec complete_

**Research Questions**:

1. What evidence exists for this program approach with target population?
2. What similar programs exist and what are their outcomes?
3. What are the specific needs and preferences of target community?
4. What regulatory/compliance requirements apply?
5. What resources and partnerships are available?

**Deliverable**: `research.md` containing:

- Literature review summary
- Needs assessment data analysis
- Best practice examples from similar programs
- Regulatory compliance requirements
- Resource and partnership landscape analysis
- Evidence gaps and mitigation strategies

## Phase 1: Design & Frameworks

_Prerequisites: research.md complete_

1. **Map stakeholder ecosystem** → `stakeholder-map.md`:

   - Primary/secondary stakeholder categories
   - Engagement strategies and communication plans
   - Decision-making authority and consultation processes
   - Conflict resolution and feedback mechanisms

2. **Design service delivery model** from program requirements:

   - Service components and delivery methods
   - Staffing model and peer worker integration
   - Participant pathways and access points
   - Quality assurance and safety protocols
   - Output to `service-model.md`

3. **Develop evaluation framework** from success criteria:

   - Logic model linking activities to outcomes
   - Data collection methods and tools
   - Evaluation timeline and reporting schedule
   - Output to `evaluation-framework.md`

4. **Create program guidance document**:
   - Run `{SCRIPT}`
   - If exists: Add only NEW program elements from current plan
   - Preserve manual additions between markers
   - Update program summary and approach documentation
   - Keep under 150 lines for readability
   - Output to repository root

**Output**: stakeholder-map.md, service-model.md, evaluation-framework.md, program-specific file

## Phase 2: Activity Planning

_This phase is beyond the scope of the /plan command_

**Phase 2**: Activity generation (/activities command creates activities.md)

- Break down service delivery into concrete activities
- Assign responsibilities and timelines
- Identify resource requirements and dependencies
- Create implementation schedule and milestones

## Phase 3+: Future Implementation

_These phases are beyond the scope of the /plan command_

**Phase 3**: Activity execution (execute activities.md following constitutional principles)  
**Phase 4**: Ongoing delivery (implement service model, collect data, engage stakeholders)  
**Phase 5**: Evaluation and improvement (analyze outcomes, report to stakeholders, iterate)

## Complexity Tracking

_Fill ONLY if Constitution Check has violations that must be justified_

| Violation                         | Why Needed                     | Simpler Alternative Rejected Because         |
| --------------------------------- | ------------------------------ | -------------------------------------------- |
| [e.g., Multiple funding sources]  | [revenue diversification need] | [single funder insufficient for scope]       |
| [e.g., Complex partnership model] | [specific expertise needed]    | [NUAA-only delivery insufficient for impact] |

## Progress Tracking

_This checklist is updated during execution flow_

**Phase Status**:

- [ ] Phase 0: Research complete (/plan command)
- [ ] Phase 1: Design complete (/plan command)
- [ ] Phase 2: Activity planning complete (/plan command - describe approach only)
- [ ] Phase 3: Activities generated (/activities command)
- [ ] Phase 4: Implementation complete
- [ ] Phase 5: Evaluation and reporting complete

**Gate Status**:

- [ ] Initial Constitution Check: PASS
- [ ] Post-Design Constitution Check: PASS
- [ ] All NEEDS CLARIFICATION resolved
- [ ] Complexity deviations documented

---

_Based on Constitution v1.0.0 - See `/memory/constitution.md`_
