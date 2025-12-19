---
learning_level: "Intermediate"
prerequisites: ["Basic understanding of distributed systems", "Database concepts"]
estimated_time: "25 minutes"
learning_objectives:
  - "Understand the spectrum of consistency models from strong to eventual"
  - "Apply CAP theorem and PACELC to consistency decisions"
  - "Choose appropriate consistency model for different use cases"
related_topics:
  prerequisites:
    - ./01_abstractions.md
  builds_upon:
    - ./02_network-abstractions.md
  enables:
    - ../04_principles/04_consistency.md
    - ../05_building-blocks/03_databases-part1.md
  cross_refs: []
---

# Spectrum of Consistency Models

## What Is Consistency?

Consistency determines **when and how all nodes in a distributed system see the same data**. In a single-server system, consistency is simple: one source of truth. In distributed systems, consistency becomes a **trade-off** between correctness and availability.

## The Consistency Spectrum

Consistency models range from **strong** (always correct) to **eventual** (correct eventually):

```
Strong Consistency → Sequential → Causal → Eventual → Weak
     (Always)         (Ordered)   (Causal)   (Eventually)  (No Guarantees)
```

### Strong Consistency

**Definition**: All nodes see updates **immediately and in the same order**.

**Characteristics**:
- ✅ Data is always correct
- ✅ No stale reads
- ❌ Higher latency (must wait for all replicas)
- ❌ Lower availability (can't serve if replicas are down)

**Example**: Financial transactions - money transfers must be immediately visible everywhere.

### Sequential Consistency

**Definition**: All nodes see updates in **the same order**, but not necessarily immediately.

**Characteristics**:
- ✅ Preserves operation order
- ✅ Easier to reason about
- ⚠️ Slightly relaxed from strong consistency

**Example**: Chat messages - all users see messages in the same order.

### Causal Consistency

**Definition**: Updates that are **causally related** are seen in order; unrelated updates can be seen in any order.

**Characteristics**:
- ✅ Preserves cause-and-effect relationships
- ✅ Better performance than sequential
- ⚠️ More complex to implement

**Example**: Social media posts - replies must appear after the original post, but unrelated posts can appear in any order.

### Eventual Consistency

**Definition**: All nodes will **eventually** see the same data, but not immediately.

**Characteristics**:
- ✅ High availability (can serve even if some replicas are down)
- ✅ Low latency (don't wait for all replicas)
- ❌ Temporary inconsistencies possible
- ❌ Stale reads possible

**Example**: User profile updates - acceptable if it takes a few seconds to propagate globally.

### Weak Consistency

**Definition**: **No guarantees** about when or in what order updates are seen.

**Characteristics**:
- ✅ Maximum performance
- ✅ Maximum availability
- ❌ No ordering guarantees
- ❌ High inconsistency risk

**Example**: Analytics data, non-critical metrics.

## CAP Theorem

**CAP** states that in a distributed system, you can guarantee at most **two out of three**:

- **C**onsistency: All nodes see the same data simultaneously
- **A**vailability: System remains operational
- **P**artition tolerance: System continues despite network failures

### CAP Trade-offs

**CP (Consistency + Partition Tolerance)**:
- Choose consistency over availability
- Example: Financial systems, critical databases
- If network partitions, system becomes unavailable to maintain consistency

**AP (Availability + Partition Tolerance)**:
- Choose availability over consistency
- Example: Social media, content delivery
- System remains available but may serve stale data during partitions

**CA (Consistency + Availability)**:
- Only possible in non-partitioned systems (single data center)
- Real distributed systems must handle partitions

## PACELC Extension

**PACELC** extends CAP by considering **normal operation** (no partitions):

- **P**artitioned: Choose **A**vailability or **C**onsistency
- **E**lse (normal operation): Choose **L**atency or **C**onsistency

### PACELC Implications

**PC/EC** (Partition: Consistency, Else: Consistency):
- Always prioritize consistency
- Example: Financial systems, critical data

**PA/EL** (Partition: Availability, Else: Latency):
- Prioritize performance
- Example: Content delivery, caching systems

**PA/EC** (Partition: Availability, Else: Consistency):
- Balance: available during partitions, consistent during normal operation
- Example: Most production systems

## Choosing the Right Consistency Model

### Decision Framework

1. **What happens if data is stale?**
   - Critical (money, medical) → Strong consistency
   - Acceptable (social posts) → Eventual consistency

2. **How often is data updated?**
   - Frequent updates → Consider eventual consistency
   - Rare updates → Strong consistency feasible

3. **Geographic distribution?**
   - Global → Eventual consistency often necessary
   - Single region → Strong consistency possible

4. **Read vs Write ratio?**
   - Read-heavy → Eventual consistency with caching
   - Write-heavy → Consider strong consistency

## Common Patterns

### Pattern 1: Read Your Writes

**Requirement**: After writing, subsequent reads must see your write.

**Solution**: Route reads to the same replica that handled the write, or use strong consistency for user's own data.

### Pattern 2: Monotonic Reads

**Requirement**: Once you read a value, you never see an older value.

**Solution**: Route all reads for a user to the same replica, or use version numbers.

### Pattern 3: Session Consistency

**Requirement**: Consistency guarantees within a user session.

**Solution**: Sticky sessions, or route user's requests to same replica.

## Key Takeaways

1. **Consistency is a spectrum** - from strong to eventual
2. **CAP theorem** - can't have all three (C, A, P)
3. **PACELC** - considers normal operation too
4. **Choose based on requirements** - what's acceptable for your use case
5. **Trade-offs are inevitable** - consistency vs availability vs latency

---

*Previous: [Network Abstractions: RPC](./02_network-abstractions.md)*  
*Next: Learn about [Failure Models](./04_failure-models.md) or explore [Consistency Principles](../04_principles/04_consistency.md).*
