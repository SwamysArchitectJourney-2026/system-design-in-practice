---
learning_level: "Beginner"
prerequisites: ["Basic arithmetic", "Understanding of system components"]
estimated_time: "25 minutes"
learning_objectives:
  - "Perform quick capacity planning calculations for system design"
  - "Estimate storage, bandwidth, and compute requirements"
  - "Use back-of-envelope calculations to validate design decisions"
related_topics:
  prerequisites: []
  builds_upon: []
  enables:
    - ../07_case-studies/01-scalefromzerotomillonusers/02_back-of-envelope.md
    - ../07_case-studies/05-url-shortener/02_back-of-envelope.md
  cross_refs: []
---

# Back-of-the-Envelope Calculations

## Why Back-of-the-Envelope Calculations Matter

Back-of-the-envelope calculations are **quick, rough estimates** that help you:
- Validate design feasibility before deep implementation
- Identify bottlenecks early in the design process
- Communicate scale and requirements clearly
- Make informed technology choices

In system design interviews, these calculations demonstrate **practical engineering judgment** and show you can think quantitatively about systems.

## Core Calculation Principles

### Round Numbers for Speed

Use round numbers to simplify mental math:
- 1 million = 10^6
- 1 billion = 10^9
- 1 trillion = 10^12
- 1 KB = 10^3 bytes (approximately)
- 1 MB = 10^6 bytes
- 1 GB = 10^9 bytes

### Order of Magnitude Thinking

Focus on **orders of magnitude** rather than exact numbers:
- Is it 1 million or 10 million? (Same order)
- Is it 1 million or 1 billion? (Different orders - matters more)

## Storage Calculations

### Basic Formula

```
Total Storage = (Data per Record) × (Number of Records) × (Retention Period)
```

### Example: User Profile Storage

**Assumptions**:
- 100 million users
- 1 KB per user profile
- 5 years retention

**Calculation**:
```
Storage = 100M users × 1 KB × 5 years
        = 10^8 × 10^3 bytes × 5
        = 5 × 10^11 bytes
        = 500 GB
```

### Storage Growth Over Time

Consider:
- **Write rate**: How much new data per day?
- **Retention**: How long to keep data?
- **Growth factor**: 2-3x for indexes, backups, replicas

## Bandwidth Calculations

### Basic Formula

```
Bandwidth = (Requests per Second) × (Data per Request) × 2
```

The factor of 2 accounts for both request and response.

### Example: API Bandwidth

**Assumptions**:
- 10,000 requests/second
- 1 KB average request size
- 2 KB average response size
- Total: 3 KB per request

**Calculation**:
```
Bandwidth = 10K QPS × 3 KB × 2
          = 10^4 × 3 × 10^3 bytes × 2
          = 60 × 10^6 bytes/second
          = 60 MB/s
          = 480 Mbps
```

## Server Capacity Estimation

### Basic Formula

```
Servers Needed = (Total QPS) / (QPS per Server)
```

### Example: Application Servers

**Assumptions**:
- 100,000 requests/second total
- Each server handles 1,000 requests/second
- Need 50% headroom for spikes

**Calculation**:
```
Servers = (100K QPS) / (1K QPS/server) × 1.5
        = 100 × 1.5
        = 150 servers
```

## Common Patterns

### Read-Heavy vs Write-Heavy

- **Read-heavy** (10:1 ratio): Focus on caching, read replicas
- **Write-heavy** (1:1 ratio): Focus on write throughput, sharding
- **Balanced**: Consider both read and write paths

### Cache Hit Ratio Impact

If 80% of reads hit cache:
- Cache handles: 80% of reads
- Database handles: 20% of reads + 100% of writes
- **Effective database load reduced by 4x** for reads

### Data Growth Projections

Plan for growth:
- **Year 1**: Baseline
- **Year 2**: 2-3x growth
- **Year 3**: 5-10x growth

Design for 3-5 years, not just current scale.

## Key Takeaways

1. **Round numbers** for quick mental math
2. **Focus on orders of magnitude** - exact numbers less important
3. **Account for growth** - design for 3-5 years
4. **Consider all factors** - storage, bandwidth, compute
5. **Validate assumptions** - check if numbers make sense

---

*Next: Apply these calculations in [Scale from Zero to Million Users case study](../07_case-studies/01-scalefromzerotomillonusers/02_back-of-envelope.md) or explore [C4 Diagrams](./06_c4-diagrams.md).*
