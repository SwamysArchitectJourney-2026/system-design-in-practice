# Case Study Template

**Version**: 1.0  
**Last Updated**: December 19, 2025  
**Purpose**: Standardized template for all system design case studies

---

## Case Study Structure

Each case study should follow this structure with the following files:

1. `README.md` - Overview and navigation
2. `01_requirements.md` - Functional and non-functional requirements
3. `02_back-of-envelope.md` - Capacity planning calculations
4. `03_high-level-design.md` - System architecture and components
5. `04_low-level-design.md` - Detailed implementation design
6. `05_scalability.md` - Scaling strategies and considerations
7. `06_observability.md` - Monitoring, logging, SLIs/SLOs
8. `07_security.md` - Security considerations
9. `08_trade-offs.md` - Design decisions and trade-offs
10. `diagrams/` - C4 and sequence diagrams

---

## README.md Template

```markdown
# [System Name] Case Study

A comprehensive system design case study for building [system description].

## Overview

[2-3 sentence overview of what this system does and why it's important]

## Case Study Structure

### Core Documentation

1. **[Requirements](./01_requirements.md)** - Functional and non-functional requirements, scale considerations
2. **[Back-of-Envelope](./02_back-of-envelope.md)** - Capacity planning calculations
3. **[High-Level Design](./03_high-level-design.md)** - System architecture, components, and design decisions
4. **[Low-Level Design](./04_low-level-design.md)** - Detailed implementation: [specific details]
5. **[Scalability](./05_scalability.md)** - Scaling strategies, [specific scaling concerns]
6. **[Observability](./06_observability.md)** - Monitoring, logging, SLIs/SLOs, distributed tracing
7. **[Security](./07_security.md)** - [Security-specific concerns]
8. **[Trade-offs](./08_trade-offs.md)** - Design decisions, alternatives, and accepted trade-offs

### Diagrams

All diagrams are located in the [`diagrams/`](./diagrams/) folder:
- [Context Diagram](./diagrams/01_context-diagram.md) - C4 Level 1
- [Container Diagram](./diagrams/02_container-diagram.md) - C4 Level 2
- [Component Diagram](./diagrams/03_component-diagram.md) - C4 Level 3
- [Sequence Diagrams](./diagrams/sequence-diagrams/) - Interaction flows

## Problem Statement

### What This System Optimizes For

[Explicitly state what the system is designed to optimize for]
- [Optimization 1]
- [Optimization 2]
- [Optimization 3]

### What Is Intentionally NOT Optimized

[Be explicit about trade-offs and what was intentionally deprioritized]
- [Non-optimization 1] - [Reason]
- [Non-optimization 2] - [Reason]

### What Breaks First at Scale

[Identify the first bottleneck that will appear as the system scales]
- [Bottleneck 1] - [When it appears] - [How to address]
- [Bottleneck 2] - [When it appears] - [How to address]

## Interviewer Lens

### Signals of Senior-Level Thinking

**Excellent candidates demonstrate**:
- [Signal 1: e.g., "Identifies read/write ratio early and designs accordingly"]
- [Signal 2: e.g., "Considers consistency vs availability trade-offs explicitly"]
- [Signal 3: e.g., "Plans for failure scenarios and graceful degradation"]
- [Signal 4: e.g., "Discusses operational concerns (monitoring, deployment)"]

**Red flags (common mistakes)**:
- [Mistake 1: e.g., "Jumps to microservices without justification"]
- [Mistake 2: e.g., "Ignores non-functional requirements"]
- [Mistake 3: e.g., "Doesn't consider failure scenarios"]
- [Mistake 4: e.g., "Over-engineers for scale that doesn't exist"]

### Evaluation Criteria

- **Requirements Clarification**: Did candidate ask clarifying questions?
- **Architecture Design**: Is the design appropriate for the scale?
- **Trade-off Analysis**: Are trade-offs explicitly discussed?
- **Scalability Thinking**: Can the design evolve as requirements change?
- **Operational Awareness**: Are monitoring, deployment, and failure scenarios considered?

## Key Design Highlights

### Architecture
- [Key architectural decision 1]
- [Key architectural decision 2]

### Technology Stack
- [Technology choice 1] - [Reason]
- [Technology choice 2] - [Reason]

### Scale
- **Capacity**: [Numbers]
- **Latency**: [Targets]
- **Availability**: [Targets]

## Learning Objectives

After studying this case study, you should be able to:
- [Objective 1]
- [Objective 2]
- [Objective 3]

## Related Topics

- [Related topic 1]
- [Related topic 2]

---

*This case study demonstrates [key learning points] commonly discussed in system design interviews.*
```

---

## 06_observability.md Template Section

Each case study's `06_observability.md` should include:

### SLIs and SLOs

**Service Level Indicators (SLIs)**:
- **Availability**: [Target, e.g., "99.9% uptime"]
- **Latency**: [Targets, e.g., "p95 < 200ms, p99 < 500ms"]
- **Throughput**: [Target, e.g., "10K requests/second"]
- **Error Rate**: [Target, e.g., "< 0.1% of requests"]

**Service Level Objectives (SLOs)**:
- [SLO 1: e.g., "99.9% of requests complete successfully"]
- [SLO 2: e.g., "95% of requests complete within 200ms"]
- [SLO 3: e.g., "Error budget: 0.1% per month"]

### Monitoring Strategy

- **Key Metrics**: [What to monitor]
- **Alerting Thresholds**: [When to alert]
- **Dashboards**: [What dashboards are needed]

### Failure Scenarios

**Scenario 1: [Failure Type]**
- **Blast Radius**: [What systems are affected]
- **Detection**: [How to detect]
- **Response**: [How to respond]
- **Prevention**: [How to prevent]

**Scenario 2: [Failure Type]**
- [Same structure]

---

## 08_trade-offs.md Template Section

Each case study's `08_trade-offs.md` should explicitly answer:

### Design Decision: [Decision Name]

**Chosen Approach**: [What was chosen]

**Alternatives Considered**:
- [Alternative 1] - [Why not chosen]
- [Alternative 2] - [Why not chosen]

**Trade-offs Accepted**:
- ✅ [Benefit 1]
- ✅ [Benefit 2]
- ❌ [Cost 1]
- ❌ [Cost 2]

**When This Decision Makes Sense**:
- [Condition 1]
- [Condition 2]

---

## Usage Guidelines

1. **Copy this template** when creating a new case study
2. **Fill in all sections** - don't leave placeholders
3. **Be explicit** about optimizations and non-optimizations
4. **Include interviewer lens** - helps both interviewers and candidates
5. **Cross-link** to observability and failures sections
6. **Update diagrams** as design evolves

---

**Note**: This template ensures consistency across all case studies while allowing flexibility for system-specific details.

