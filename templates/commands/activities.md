---
description: Generate detailed implementation activities from the program plan, breaking down service delivery into concrete actionable steps with dependencies and timelines.
scripts:
  sh: scripts/bash/check-prerequisites.sh --json --require-plan
  ps: scripts/powershell/check-prerequisites.ps1 -Json -RequirePlan
---

The user input to you can be provided directly by the agent or as a command argument - you **MUST** consider it before proceeding with the prompt (if not empty).

User input:

$ARGUMENTS

You are generating detailed implementation activities for a NUAA program at `programs/[###-program-name]/activities.md`. This translates the program plan into specific, actionable steps with clear responsibilities and timelines.

Follow this execution flow:

1. Run `{SCRIPT}` from repo root and parse JSON for PROGRAM_DIR and AVAILABLE_DOCS. All paths must be absolute.

2. Load program planning artifacts:

   - **REQUIRED**: Read plan.md for program context, service delivery model, constitutional compliance
   - **IF EXISTS**: Read stakeholder-map.md for engagement strategies
   - **IF EXISTS**: Read service-model.md for delivery components and staffing
   - **IF EXISTS**: Read evaluation-framework.md for measurement and reporting activities
   - **IF EXISTS**: Read research.md for evidence-based decisions and constraints

3. Use the activities template at `templates/program-activities-template.md`:

   - Replace all placeholder tokens with program-specific content
   - Generate activities from each design document
   - Apply activity generation rules and dependencies

4. Generate activity categories:

   - **Program Establishment**: Governance, partnerships, staff recruitment, resource setup
   - **Community Engagement**: Consultation, advisory groups, feedback mechanisms
   - **Service Delivery**: Core program activities, peer support, participant support
   - **Data Collection and Evaluation**: Measurement, analysis, reporting
   - **Sustainability and Development**: Funding, professional development, capacity building

5. Apply constitutional principles to activity design:

   - **Peer-Led Development**: Ensure peer involvement in all service delivery activities
   - **Evidence-Based Planning**: Include research and evaluation activities
   - **Funding & Compliance**: Build in monitoring and reporting activities
   - **Stakeholder Integration**: Create engagement activities for all stakeholder groups
   - **Harm Reduction First**: Embed harm reduction principles in all service activities

6. Establish activity dependencies and parallelization:

   - Mark activities that can run in parallel with [P]
   - Create dependency chains for sequential activities
   - Identify critical path for program launch
   - Account for resource and staffing constraints

7. Integrate success metrics and KPIs:

   - Map each KPI to specific measurement activities
   - Link community outcomes to data collection activities
   - Create reporting activities for all compliance requirements

8. Validate activity completeness:

   - All service components have delivery activities
   - All stakeholders have engagement activities
   - All evaluation measures have collection activities
   - All constitutional principles reflected in activities
   - Resource requirements realistic and achievable

9. Output activities summary:
   - Total number of activities generated
   - Key activity categories and critical path
   - Parallel execution opportunities
   - Resource and staffing implications
   - Timeline for program launch and ongoing delivery

**Critical Success Factors**:

- Community consultation activities must be prioritized and ongoing
- Peer worker activities must be central to service delivery
- Evaluation activities must be embedded throughout program lifecycle
- Compliance and reporting activities must meet all funder requirements
- All activities must align with constitutional principles

**Quality Gates**:

- Constitutional compliance reflected in all activity categories
- Service delivery activities center peer involvement
- Evaluation activities capture all required outcomes
- Stakeholder engagement ensures community voice
- Resource requirements support sustainable delivery

The activities document provides the roadmap for program implementation, ensuring all constitutional principles are operationalized and community outcomes are achieved.
