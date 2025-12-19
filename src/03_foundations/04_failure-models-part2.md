---
learning_level: "Intermediate"
prerequisites: ["Failure Models (Part 1)", "Basic understanding of distributed systems"]
estimated_time: "25 minutes"
learning_objectives:
  - "Apply failure recovery strategies in system design"
  - "Design systems that gracefully handle different failure types"
  - "Understand fault tolerance patterns and trade-offs"
related_topics:
  prerequisites:
    - ./04_failure-models.md
  builds_upon:
    - ./04_failure-models.md
  enables:
    - ../04_principles/05_fault-tolerance.md
    - ../08_failures/01_introduction.md
  cross_refs: []
---

# Failure Models (Part 2): Recovery Strategies and Design Patterns

## Failure Recovery Strategies

### Strategy 1: Retry

**When to use**: Transient failures (network issues, temporary overload)

**How it works**:
- Automatically retry failed operations
- Use exponential backoff to avoid overwhelming system
- Limit retry attempts

**Example**: API call fails → wait 1s, retry → wait 2s, retry → wait 4s, retry → give up

**Trade-offs**:
- ✅ Handles transient issues automatically
- ❌ Can amplify load if many retries
- ❌ May delay detection of permanent failures

### Strategy 2: Failover

**When to use**: Component failures, need immediate switch

**How it works**:
- Detect failure
- Switch to backup component
- Resume service

**Example**: Primary database fails → switch to replica → continue serving

**Trade-offs**:
- ✅ Maintains availability
- ❌ May lose in-flight transactions
- ❌ Requires state synchronization

### Strategy 3: Graceful Degradation

**When to use**: Non-critical component failures

**How it works**:
- Continue operating with reduced functionality
- Disable non-essential features
- Return cached or default data

**Example**: Recommendation service down → show default recommendations

**Trade-offs**:
- ✅ System remains usable
- ❌ Reduced user experience
- ❌ May hide underlying issues

### Strategy 4: Circuit Breaker

**When to use**: Repeated failures, need to fail fast

**How it works**:
- Monitor failure rate
- Open circuit after threshold
- Stop calling failing service
- Periodically test if service recovered

**Example**: Payment service failing → stop calling it → return error immediately

**Trade-offs**:
- ✅ Prevents cascading failures
- ✅ Fails fast instead of timing out
- ❌ May delay recovery detection

## Designing for Failure

### Principle 1: Assume Failures Will Happen

**Design philosophy**: Failures are normal, not exceptional.

**Implications**:
- Every component can fail
- Network can partition
- Data can be lost
- Design defensively

### Principle 2: Fail Fast

**Concept**: Detect and report failures quickly.

**Benefits**:
- Faster recovery
- Better user experience
- Clearer error messages

**Implementation**: Timeouts, health checks, circuit breakers.

### Principle 3: Isolate Failures

**Concept**: Prevent one failure from cascading to others.

**Strategies**:
- Service boundaries
- Bulkheads (resource isolation)
- Circuit breakers
- Rate limiting

### Principle 4: Design for Recovery

**Concept**: Make recovery automatic and fast.

**Strategies**:
- Stateless services (easy to restart)
- Replicated data (failover ready)
- Health checks (detect issues early)
- Automated recovery (self-healing)

## Common Failure Scenarios

### Scenario 1: Database Failure

**Failure**: Primary database crashes

**Recovery**:
1. Detect failure (health check timeout)
2. Promote replica to primary
3. Update connection strings
4. Resume service

**Prevention**: Regular backups, replication, monitoring.

### Scenario 2: Network Partition

**Failure**: Network split between data centers

**Recovery**:
1. Detect partition (heartbeat failure)
2. Choose partition to serve (CAP trade-off)
3. Continue with available partition
4. Merge when network recovers

**Prevention**: Multiple network paths, geographic distribution.

### Scenario 3: Service Overload

**Failure**: Service receives more requests than it can handle

**Recovery**:
1. Rate limit incoming requests
2. Queue excess requests
3. Scale up capacity
4. Return 503 (Service Unavailable) if overloaded

**Prevention**: Auto-scaling, load balancing, capacity planning.

## Key Takeaways

1. **Failures are expected** - design systems to handle them
2. **Detect failures quickly** - use timeouts, health checks, heartbeats
3. **Recover automatically** - failover, retry, graceful degradation
4. **Isolate failures** - prevent cascading to other components
5. **Test failure scenarios** - chaos engineering, failure injection

---

*Previous: [Failure Models (Part 1)](./04_failure-models.md)*  
*Next: Learn about [Fault Tolerance](../04_principles/05_fault-tolerance.md) or explore [Real-World Failures](../08_failures/01_introduction.md).*
