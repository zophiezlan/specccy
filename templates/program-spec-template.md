# Program Specification: [PROGRAM_NAME]

**Program ID**: `[###-program-name]`  
**Created**: [DATE]  
**Status**: Draft  
**Input**: Program description: "$ARGUMENTS"

## Execution Flow (main)

```
1. Parse program description from Input
   → If empty: ERROR "No program description provided"
2. Extract key concepts from description
   → Identify: target population, services, outcomes, stakeholders, constraints
3. For each unclear aspect:
   → Mark with [NEEDS CLARIFICATION: specific question]
4. Fill User/Community Scenarios & Evaluation section
   → If no clear user flow: ERROR "Cannot determine community impact scenarios"
5. Generate Program Requirements
   → Each requirement must be measurable
   → Mark ambiguous requirements
6. Identify Key Stakeholders and Funding Sources
7. Run Review Checklist
   → If any [NEEDS CLARIFICATION]: WARN "Spec has uncertainties"
   → If implementation details found: ERROR "Remove operational details"
8. Return: SUCCESS (spec ready for planning)
```

---

## ⚡ Quick Guidelines

- ✅ Focus on WHAT the community needs and WHY
- ❌ Avoid HOW to operate (no staffing models, operational procedures, detailed budgets)
- 👥 Written for board members, funders, and community stakeholders, not operational staff

### Section Requirements

- **Mandatory sections**: Must be completed for every program
- **Optional sections**: Include only when relevant to the program
- When a section doesn't apply, remove it entirely (don't leave as "N/A")

### For AI Generation

When creating this spec from a program prompt:

1. **Mark all ambiguities**: Use [NEEDS CLARIFICATION: specific question] for any assumption you'd need to make
2. **Don't guess**: If the prompt doesn't specify something (e.g., "peer support program" without target demographics), mark it
3. **Think like an evaluator**: Every vague requirement should fail the "measurable and unambiguous" checklist item
4. **Common underspecified areas**:
   - Target population and eligibility criteria
   - Geographic scope and service boundaries
   - Outcome measures and success indicators
   - Funding sources and sustainability
   - Partner organization roles and responsibilities
   - Cultural safety and accessibility requirements

---

## Community Impact & Evaluation _(mandatory)_

### Primary Community Story

[Describe the main community journey and program interaction in plain language]

### Acceptance Scenarios

1. **Given** [community need/situation], **When** [program intervention], **Then** [expected community outcome]
2. **Given** [participant situation], **When** [service delivery], **Then** [expected participant outcome]

### Edge Cases

- What happens when [boundary condition, e.g., participant in crisis]?
- How does program handle [challenging scenario, e.g., funding cuts, staff shortages]?

## Requirements _(mandatory)_

### Functional Requirements

- **FR-001**: Program MUST [specific service capability, e.g., "provide sterile injecting equipment"]
- **FR-002**: Program MUST [specific capability, e.g., "maintain confidential participant records"]
- **FR-003**: Participants MUST be able to [key access/interaction, e.g., "access services without identification"]
- **FR-004**: Program MUST [data/information requirement, e.g., "collect de-identified outcome data"]
- **FR-005**: Program MUST [compliance requirement, e.g., "meet NSW Health NSP guidelines"]

_Example of marking unclear requirements:_

- **FR-006**: Program MUST serve [NEEDS CLARIFICATION: target population not specified - general community, specific demographics, geographic boundaries?]
- **FR-007**: Program MUST operate [NEEDS CLARIFICATION: operating hours/schedule not specified]

### Non-Functional Requirements

- **NFR-001**: Program MUST be accessible to [target population] within [timeframe]
- **NFR-002**: Program MUST maintain [quality standard, e.g., "peer worker ratios per guidelines"]
- **NFR-003**: Program MUST achieve [outcome measure, e.g., "80% participant satisfaction"]
- **NFR-004**: Program MUST comply with [regulatory framework]

## Stakeholder Mapping _(mandatory)_

### Primary Stakeholders

- **Community Members**: [specific demographics/groups served]
- **Peer Workers**: [roles and involvement level]
- **Partner Organizations**: [specific partners and their roles]

### Secondary Stakeholders

- **Government Agencies**: [specific departments/programs]
- **Funders**: [specific funding bodies/grants]
- **NUAA Internal**: [relevant teams/departments]

### Stakeholder Engagement Requirements

- How will each stakeholder group be consulted during design?
- What ongoing feedback mechanisms are required?
- Who has decision-making authority at different stages?

## Funding and Compliance _(mandatory)_

### Funding Sources

- **Primary**: [specific funding program/grant, amount if known]
- **Secondary**: [backup or supplementary funding]
- **Sustainability**: [long-term funding strategy]

### Compliance Requirements

- **Regulatory**: [specific regulations, licensing requirements]
- **Funder**: [grant conditions, reporting requirements]
- **Organizational**: [NUAA policies, board requirements]
- **Professional**: [relevant professional standards]

### Key Performance Indicators

- [Specific, measurable KPIs required by funders]
- [Additional NUAA organizational KPIs]
- [Community outcome measures]

## Risk Assessment _(if high-risk program)_

### Identified Risks

- [Major risks to program success, sustainability, or safety]
- [Funding/political risks]
- [Operational risks]

### Mitigation Strategies

- [How each major risk will be addressed]

## Cultural Safety & Accessibility _(mandatory)_

### Cultural Safety Requirements

- How will the program ensure cultural safety for Aboriginal and Torres Strait Islander community members?
- What specific cultural competency requirements exist?

### Accessibility Requirements

- Physical accessibility needs
- Communication accessibility (languages, formats)
- Economic accessibility (free services, transport, etc.)
- Social accessibility (non-judgmental, peer-led approach)

## Evidence Base _(mandatory)_

### Supporting Research

- [Key research supporting this program approach]
- [Evidence for target population need]
- [Evidence for proposed intervention effectiveness]

### Best Practice Examples

- [Similar programs with demonstrated success]
- [Lessons learned from comparable initiatives]

---

## Review & Acceptance Checklist

### Completeness Review

- [ ] All mandatory sections completed
- [ ] Target population clearly defined
- [ ] Services/interventions specified
- [ ] Success measures identified
- [ ] Stakeholders mapped
- [ ] Funding pathway identified
- [ ] Compliance requirements documented

### Quality Review

- [ ] Program aligns with NUAA mission and harm reduction principles
- [ ] Community consultation approach described
- [ ] Evidence base documented
- [ ] Cultural safety requirements addressed
- [ ] Accessibility considerations included
- [ ] Sustainability factors considered

### Constitutional Compliance

- [ ] Peer involvement planned at all stages (Principle I)
- [ ] Evidence-based approach documented (Principle II)
- [ ] Funding and compliance framework clear (Principle III)
- [ ] Stakeholder engagement planned (Principle IV)
- [ ] Harm reduction alignment demonstrated (Principle V)

### Clarity Review

- [ ] Requirements are testable and unambiguous
- [ ] No implementation details included
- [ ] Success criteria are measurable
- [ ] Roles and responsibilities clear
- [ ] Timeline and milestones realistic

**Ready for planning**: All checkboxes above must be marked before proceeding to program planning phase.
