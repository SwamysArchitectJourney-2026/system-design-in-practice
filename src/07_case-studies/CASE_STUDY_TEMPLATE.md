# Case Study Template

This template provides a standardized structure for all case studies in this repository. Use this as a guide when creating new case studies.

---

## Case Study Structure

Each case study should follow this structure:

### Core Documentation Files

1. **`README.md`** - Overview and navigation
2. **`01_requirements.md`** - Functional and non-functional requirements
3. **`02_back-of-envelope.md`** - Capacity planning calculations
4. **`03_high-level-design.md`** - System architecture (HLD)
5. **`04_low-level-design.md`** - Detailed design (LLD)
6. **`05_scalability.md`** - Scaling strategies
7. **`06_observability.md`** - Monitoring, logging, SLIs/SLOs
8. **`07_security.md`** - Security considerations
9. **`08_trade-offs.md`** - Design decisions and trade-offs

### Diagrams Folder

All diagrams should be co-located in `diagrams/` folder:

- **C4 Diagrams**:
  - `01_context-diagram.md` - System context (Level 1)
  - `02_container-diagram.md` - Container architecture (Level 2)
  - `03_component-diagram.md` - Component details (Level 3)

- **Sequence Diagrams**:
  - `sequence-diagrams/01_[flow-name].md` - Key interaction flows

---

## README.md Template

```markdown
# [System Name] Case Study

A comprehensive system design case study for building [system description].

## Overview

[Brief description of the system and what makes it interesting/challenging]

## Case Study Structure

[Link to all files]

## Key Design Highlights

### Architecture
- [Key architectural decisions]
- [Scaling approach]
- [Technology choices]

### Scale
- [Capacity numbers]
- [Traffic patterns]
- [Performance targets]

## Learning Objectives

After studying this case study, you should be able to:
- [Objective 1]
- [Objective 2]
- [Objective 3]

## Related Topics

- [Links to related building blocks, patterns, principles]
```

---

## Requirements Template (01_requirements.md)

```markdown
# [System Name] - Requirements

## Functional Requirements

1. **[Core Feature 1]**: [Description]
2. **[Core Feature 2]**: [Description]
3. **[Core Feature 3]**: [Description]

## Non-Functional Requirements

### Performance
- **Response Time**: [Target latency]
- **Throughput**: [Target QPS]
- **Availability**: [Target uptime]

### Scalability
- **User Scale**: [Target user count]
- **Data Scale**: [Target data volume]
- **Geographic Distribution**: [Global/Regional]

### Constraints
- **Budget**: [Cost considerations]
- **Time to Market**: [Timeline]
- **Team Size**: [Resource constraints]
```

---

## High-Level Design Template (03_high-level-design.md)

```markdown
# [System Name] - High-Level Design

## System Architecture

[Architecture overview with key components]

## Key Components

### 1. [Component Name]
- **Purpose**: [What it does]
- **Technology**: [Tech stack]
- **Scaling Strategy**: [How it scales]

### 2. [Component Name]
[Similar structure]

## Design Decisions

### Decision 1: [Decision Name]
- **Rationale**: [Why this choice]
- **Alternatives Considered**: [Other options]
- **Trade-offs**: [Pros and cons]

## What This System Optimizes For

- ✅ **[Optimization 1]**: [What the system prioritizes]
- ✅ **[Optimization 2]**: [What the system prioritizes]

## What This System Does NOT Optimize For

- ❌ **[Non-optimization 1]**: [What is intentionally not prioritized]
- ❌ **[Non-optimization 2]**: [What is intentionally not prioritized]

## What Breaks First at Scale

1. **[Bottleneck 1]**: [What fails first and why]
2. **[Bottleneck 2]**: [What fails next]

## Interviewer Lens

### What Signals Senior-Level Thinking

- ✅ [Signal 1]
- ✅ [Signal 2]
- ✅ [Signal 3]

### Common Candidate Mistakes

- ❌ [Mistake 1]
- ❌ [Mistake 2]
- ❌ [Mistake 3]
```

---

## Observability Template (06_observability.md)

### Required Sections

```markdown
# [System Name] - Observability

## SLIs and SLOs

### Service Level Indicators (SLIs)

- **Availability**: [Metric definition]
- **Latency**: [p50, p95, p99 targets]
- **Error Rate**: [Target error percentage]
- **Throughput**: [Requests per second]

### Service Level Objectives (SLOs)

- **Availability**: 99.9% (three nines)
- **Latency**: p95 < 200ms
- **Error Rate**: < 0.1%
- **Throughput**: 10K QPS

## Monitoring Strategy

### Key Metrics

- [Metric 1]: [Why it matters]
- [Metric 2]: [Why it matters]

### Alerting Strategy

- **Critical Alerts**: [What triggers critical alerts]
- **Warning Alerts**: [What triggers warnings]

## Failure Scenarios

### Scenario 1: [Failure Type]
- **Blast Radius**: [What is affected]
- **Detection**: [How to detect]
- **Mitigation**: [How to fix]
- **Prevention**: [How to prevent]

### Scenario 2: [Failure Type]
[Similar structure]

## Cross-References

- Related: [Observability Building Block](../../05_building-blocks/07_monitoring.md)
- Related: [Failure Analysis](../../08_failures/01_introduction.md)
```

---

## Security Template (07_security.md)

```markdown
# [System Name] - Security

## Authentication and Authorization

- [Auth strategy]
- [Access control approach]

## Data Protection

- **Encryption at Rest**: [Approach]
- **Encryption in Transit**: [Approach]
- **PII Handling**: [How sensitive data is protected]

## Threat Mitigation

- **DDoS Protection**: [Strategy]
- **Rate Limiting**: [Approach]
- **Input Validation**: [Validation strategy]

## Compliance

- [Relevant compliance requirements]
```

---

## Trade-offs Template (08_trade-offs.md)

```markdown
# [System Name] - Trade-offs

## Architecture Trade-offs

### [Decision 1]
- **Chosen Approach**: [What was chosen]
- **Benefits**: [Pros]
- **Costs**: [Cons]
- **Alternatives**: [What else was considered]

## Performance Trade-offs

### [Trade-off 1]
- **What was prioritized**: [Priority]
- **What was sacrificed**: [Sacrifice]
- **Rationale**: [Why]

## Cost Trade-offs

### [Cost Decision]
- **Approach**: [What was chosen]
- **Cost Impact**: [Financial implications]
- **Value Delivered**: [What value this provides]
```

---

## Diagram Standards

### C4 Diagrams

- **Context Diagram**: Show system and external actors
- **Container Diagram**: Show major building blocks
- **Component Diagram**: Show internal structure of one key container

### Sequence Diagrams

- Include both Mermaid and ASCII fallback
- Show error scenarios where relevant
- Include latency numbers when appropriate
- Add "Interviewer Lens" section

---

## Interview Preparation Notes

### Key Points to Emphasize

1. [Point 1]
2. [Point 2]
3. [Point 3]

### Common Interview Questions

- **Q**: [Question]
  - **A**: [How to answer using this case study]

### Verbal Explanation Practice

Practice explaining:
- The overall architecture in 2 minutes
- One key flow (read or write) in detail
- How the system scales
- One failure scenario and mitigation

---

## Quality Checklist

Before considering a case study complete:

- [ ] All 8 core documentation files present
- [ ] C4 diagrams (context, container, component) included
- [ ] At least 2 sequence diagrams for key flows
- [ ] "Interviewer Lens" sections added
- [ ] SLIs/SLOs defined in observability section
- [ ] At least one failure scenario analyzed
- [ ] Cross-references to building blocks and principles
- [ ] Back-of-envelope calculations validated
- [ ] Trade-offs explicitly documented
- [ ] "What breaks first" section included

---

*This template should be used as a guide. Adapt as needed for specific case studies while maintaining consistency across the repository.*
