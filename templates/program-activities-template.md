# Activities: [PROGRAM NAME]

**Generated**: [DATE] | **Program ID**: [###-program-name]  
**Input**: Implementation plan from `programs/[###-program-name]/plan.md`

## Execution Flow (main)

```
1. Load plan.md from program directory
   → If not found: ERROR "No implementation plan found"
   → Extract: program type, service model, stakeholders, evaluation framework
2. Load optional design documents:
   → service-model.md: Extract components → service delivery activities
   → stakeholder-map.md: Each stakeholder → engagement activities
   → evaluation-framework.md: Extract measures → data collection activities
   → research.md: Extract decisions → setup activities
3. Generate activities by category:
   → Setup: program establishment, partnership agreements, staff recruitment
   → Engagement: community consultation, stakeholder meetings, partnership development
   → Service Delivery: direct service activities, peer support, resource distribution
   → Evaluation: data collection, outcome measurement, reporting
   → Quality Assurance: supervision, training, safety protocols
4. Apply activity rules:
   → Different teams/locations = mark [P] for parallel
   → Same staff/resources = sequential (no [P])
   → Engagement before service delivery
   → Evaluation throughout program lifecycle
5. Number activities sequentially (A001, A002...)
6. Generate dependency relationships
7. Create parallel execution examples
8. Validate activity completeness:
   → All stakeholders have engagement activities?
   → All service components have delivery activities?
   → All outcomes have measurement activities?
   → All compliance requirements have monitoring activities?
```

---

## Activity Categories

### A. Program Establishment

_Foundation activities for program launch_

#### A1. Governance and Planning (PRIORITY)

- [ ] A001 [P] Establish program governance structure
- [ ] A002 [P] Finalize partnership agreements with [PRIMARY_PARTNER_1]
- [ ] A003 [P] Finalize partnership agreements with [PRIMARY_PARTNER_2]
- [ ] A004 Complete compliance review and documentation
- [ ] A005 Establish program policies and procedures
- [ ] A006 [P] Set up program evaluation systems

#### A2. Staff and Resources

- [ ] A007 [P] Recruit program coordinator
- [ ] A008 [P] Recruit peer workers
- [ ] A009 [P] Recruit clinical support staff (if applicable)
- [ ] A010 Complete staff orientation and training
- [ ] A011 [P] Establish service delivery locations
- [ ] A012 [P] Procure equipment and resources

### B. Community Engagement

_Activities for ongoing stakeholder involvement_

#### B1. Community Consultation (CONTINUOUS)

- [ ] A013 [P] Conduct initial community consultation sessions
- [ ] A014 [P] Establish community advisory group
- [ ] A015 [P] Develop community feedback mechanisms
- [ ] A016 Schedule regular community meetings (monthly/quarterly)
- [ ] A017 [P] Create culturally appropriate communication materials

#### B2. Stakeholder Relations

- [ ] A018 [P] Establish regular meetings with [GOVERNMENT_PARTNER]
- [ ] A019 [P] Establish regular meetings with [HEALTH_PARTNER]
- [ ] A020 [P] Establish regular meetings with [COMMUNITY_PARTNER]
- [ ] A021 Develop stakeholder communication protocol
- [ ] A022 [P] Create stakeholder reporting schedule

### C. Service Delivery

_Core program activities and service provision_

#### C1. Direct Service Activities

- [ ] A023 [P] Launch [SERVICE_COMPONENT_1] delivery
- [ ] A024 [P] Launch [SERVICE_COMPONENT_2] delivery
- [ ] A025 [P] Launch [SERVICE_COMPONENT_3] delivery
- [ ] A026 Establish participant intake and assessment processes
- [ ] A027 [P] Implement peer support protocols
- [ ] A028 [P] Deliver ongoing education and information sessions

#### C2. Quality Assurance

- [ ] A029 [P] Implement clinical supervision protocols (if applicable)
- [ ] A030 [P] Implement peer supervision and support systems
- [ ] A031 Conduct regular service quality reviews
- [ ] A032 [P] Maintain safety and incident reporting systems
- [ ] A033 [P] Conduct regular equipment/resource audits

### D. Data Collection and Evaluation

_Ongoing monitoring and evaluation activities_

#### D1. Data Collection (CONTINUOUS)

- [ ] A034 [P] Implement participant data collection systems
- [ ] A035 [P] Implement service delivery data collection
- [ ] A036 [P] Implement outcome measurement protocols
- [ ] A037 Establish data quality assurance processes
- [ ] A038 [P] Conduct regular data analysis and review

#### D2. Reporting and Communication

- [ ] A039 [P] Produce monthly internal reports
- [ ] A040 [P] Produce quarterly stakeholder reports
- [ ] A041 [P] Produce annual evaluation reports
- [ ] A042 [P] Communicate outcomes to community
- [ ] A043 [P] Submit required compliance reports

### E. Sustainability and Development

_Long-term program sustainability activities_

#### E1. Funding and Resources

- [ ] A044 [P] Monitor grant compliance and reporting requirements
- [ ] A045 [P] Identify additional funding opportunities
- [ ] A046 [P] Develop sustainability and expansion plans
- [ ] A047 Build organizational capacity and systems
- [ ] A048 [P] Maintain equipment and resource management

#### E2. Professional Development

- [ ] A049 [P] Provide ongoing staff training and development
- [ ] A050 [P] Support peer worker professional development
- [ ] A051 [P] Participate in relevant professional networks
- [ ] A052 [P] Contribute to sector knowledge and advocacy

## Activity Dependencies

### Critical Path

```
A001,A004 → A007,A008,A009 → A010 → A013,A014 → A023,A024,A025
```

### Parallel Streams

```
Stream 1 (Governance): A001 → A004 → A005 → A021
Stream 2 (Staffing): A007 → A010 → A029,A030
Stream 3 (Community): A013 → A014 → A015 → A016
Stream 4 (Data): A034 → A037 → A039 → A040
```

### Ongoing Activities

- Weekly: A016 (community engagement), A034-A037 (data collection)
- Monthly: A031 (quality review), A039 (internal reporting)
- Quarterly: A040 (stakeholder reporting), A045 (funding review)
- Annually: A041 (evaluation reporting), A046 (sustainability planning)

## Activity Generation Rules

_Applied during main() execution_

1. **From Service Model**:
   - Each service component → delivery activity [P]
   - Each staff role → recruitment and training activities
2. **From Stakeholder Map**:
   - Each stakeholder → engagement activity [P]
   - Each partner → relationship management activities
3. **From Evaluation Framework**:

   - Each outcome measure → data collection activity [P]
   - Each reporting requirement → reporting activity

4. **Ordering**:
   - Establishment → Engagement → Service Delivery → Ongoing Operations
   - Dependencies block parallel execution

## Validation Checklist

_GATE: Checked by main() before returning_

- [ ] All service components have delivery activities
- [ ] All stakeholders have engagement activities
- [ ] All evaluation measures have collection activities
- [ ] All compliance requirements have monitoring activities
- [ ] Parallel activities truly independent
- [ ] Each activity specifies responsible role/team
- [ ] No activity requires same staff/resources as another [P] activity
- [ ] Constitutional principles reflected in activity design

## Success Metrics Integration

### Constitutional Compliance Tracking

- **Peer-Led Development**: [Track peer involvement in activities A013-A017, A023-A028]
- **Evidence-Based Planning**: [Track research integration in activities A005, A031, A041]
- **Funding & Compliance**: [Track compliance activities A004, A039-A043, A044]
- **Stakeholder Integration**: [Track engagement activities A013-A022]
- **Harm Reduction First**: [Track service delivery activities A023-A028, A031-A033]

### Key Performance Indicators

_From program specification and funding requirements_

- [KPI_1]: [measurement approach] - tracked via activities [A###]
- [KPI_2]: [measurement approach] - tracked via activities [A###]
- [KPI_3]: [measurement approach] - tracked via activities [A###]

### Community Outcome Measures

_From evaluation framework_

- [OUTCOME_1]: [measurement method] - collected via activities [A###]
- [OUTCOME_2]: [measurement method] - collected via activities [A###]
- [OUTCOME_3]: [measurement method] - collected via activities [A###]

---

_Generated from program plan v[VERSION] - Based on Constitution v1.0.0_
