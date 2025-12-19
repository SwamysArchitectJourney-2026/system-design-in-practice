---
learning_level: "Intermediate"
prerequisites: ["Basic understanding of distributed systems", "System design fundamentals"]
estimated_time: "25 minutes"
learning_objectives:
  - "Understand different types of failures in distributed systems"
  - "Apply failure detection and recovery strategies"
  - "Design systems that gracefully handle failures"
related_topics:
  prerequisites:
    - ./01_abstractions.md
    - ./02_network-abstractions.md
  builds_upon:
    - ./03_consistency-models.md
  enables:
    - ../04_principles/05_fault-tolerance.md
    - ../08_failures/01_introduction.md
  cross_refs: []
---

# The Spectrum of Failure Models

## Why Failure Models Matter

In distributed systems, **failures are not exceptions—they are expected**. Understanding failure models helps you:

- Design systems that continue operating despite failures
- Choose appropriate fault tolerance strategies
- Set realistic expectations for system behavior
- Plan for recovery and mitigation

## Types of Failures

### 1. Crash Failures

**Definition**: A component stops responding completely.

**Characteristics**:
- Component stops processing requests
- No output, no response
- Easy to detect (timeout)

**Example**: Server process crashes, database connection lost.

**Detection**: Timeouts, health checks, heartbeat mechanisms.

### 2. Omission Failures

**Definition**: Component fails to send or receive messages.

**Types**:
- **Send omission**: Message not sent
- **Receive omission**: Message not received

**Example**: Network packet loss, message queue drops message.

**Detection**: Message acknowledgments, sequence numbers.

### 3. Timing Failures

**Definition**: Component responds, but outside expected time window.

**Characteristics**:
- Response arrives too late
- System appears slow or unresponsive
- May be mistaken for crash failure

**Example**: Database query takes 30 seconds instead of 100ms.

**Detection**: Timeouts, latency monitoring, SLAs.

### 4. Byzantine Failures

**Definition**: Component behaves arbitrarily or maliciously.

**Characteristics**:
- Sends incorrect data
- Lies about state
- Behaves inconsistently
- Hardest to detect and handle

**Example**: Compromised server sends wrong data, malicious node in consensus.

**Detection**: Cryptographic verification, consensus protocols, redundancy.

## Failure Detection

### Heartbeat Mechanism

**How it works**:
- Components send periodic "I'm alive" messages
- If heartbeat stops, component is considered failed

**Trade-offs**:
- ✅ Simple to implement
- ❌ Network issues can cause false positives
- ❌ Detection delay (must wait for timeout)

### Health Checks

**How it works**:
- External monitor periodically checks component health
- Component responds with status (healthy/unhealthy)

**Trade-offs**:
- ✅ Can check actual functionality, not just liveness
- ❌ Adds load to system
- ❌ May miss transient issues

### Timeout-Based Detection

**How it works**:
- If response doesn't arrive within timeout, assume failure

**Trade-offs**:
- ✅ Simple, built into most systems
- ❌ Must choose timeout carefully (too short = false positives, too long = slow detection)

## Failure Recovery Strategies

### 1. Retry with Exponential Backoff

**When to use**: Transient failures (network glitches, temporary overload).

**How it works**:
- Retry failed operation
- Wait longer between each retry (exponential backoff)
- Give up after max attempts

**Example**: API call fails → wait 1s → retry → wait 2s → retry → wait 4s → retry.

### 2. Circuit Breaker

**When to use**: Repeated failures from a dependency.

**How it works**:
- Track failure rate
- If threshold exceeded, "open" circuit (stop calling)
- After timeout, "half-open" (test if fixed)
- If successful, "close" circuit (resume normal operation)

**Example**: Database repeatedly timing out → stop sending queries → test after 30s → resume if healthy.

### 3. Graceful Degradation

**When to use**: Non-critical features failing.

**How it works**:
- Disable failing feature
- Continue serving core functionality
- Return cached data or simplified responses

**Example**: Recommendation service down → show default recommendations instead of personalized.

### 4. Failover

**When to use**: Primary component fails, need backup.

**How it works**:
- Detect primary failure
- Switch traffic to backup/replica
- Restore primary when fixed

**Example**: Primary database fails → route reads to read replica → promote replica to primary.

## Designing for Failure

### Principles

1. **Assume failures will happen**: Design defensively
2. **Fail fast**: Detect and handle failures quickly
3. **Isolate failures**: Prevent cascade failures
4. **Plan recovery**: Know how to restore service
5. **Monitor everything**: Detect failures before users notice

### Common Patterns

**Redundancy**: Multiple instances of critical components.

**Idempotency**: Operations safe to retry.

**Stateless design**: Easier to recover (no state to restore).

**Timeouts**: Don't wait forever for responses.

**Rate limiting**: Prevent overload from causing failures.

## Key Takeaways

1. **Failures are normal** - design expecting them
2. **Different failure types** require different strategies
3. **Detect failures quickly** - use heartbeats, health checks, timeouts
4. **Recover gracefully** - retry, circuit break, degrade, failover
5. **Isolate failures** - prevent cascade effects

---

*Previous: [Consistency Models](./03_consistency-models.md)*  
*Next: Learn about [Fault Tolerance](../04_principles/05_fault-tolerance.md) or explore [Failure Analysis](../08_failures/01_introduction.md).*
