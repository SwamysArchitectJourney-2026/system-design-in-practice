---
learning_level: "Intermediate"
prerequisites: ["Failure Models (Part 1)", "Basic understanding of distributed systems"]
estimated_time: "25 minutes"
learning_objectives:
  - "Apply failure recovery strategies in system design"
  - "Design systems that gracefully handle different failure types"
  - "Implement fault tolerance patterns"
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

### Retry Logic

**Concept**: Automatically retry failed operations.

**When to Retry**:
- Transient failures (network timeouts, temporary unavailability)
- Idempotent operations (safe to retry)

**Strategies**:
- **Exponential Backoff**: Wait longer between retries (1s, 2s, 4s, 8s...)
- **Jitter**: Add randomness to prevent thundering herd
- **Max Retries**: Limit retry attempts to avoid infinite loops

**Example**: API call fails → wait 1s → retry → wait 2s → retry → give up after 3 attempts.

### Circuit Breaker Pattern

**Concept**: Stop calling failing service after threshold.

**States**:
- **Closed**: Normal operation, calls go through
- **Open**: Service failing, calls fail fast without trying
- **Half-Open**: Testing if service recovered, allow limited calls

**Benefits**:
- Prevents cascading failures
- Reduces load on failing service
- Fast failure response

**Example**: Payment service fails 5 times → circuit opens → all payment requests fail fast for 30 seconds → circuit half-opens to test recovery.

### Graceful Degradation

**Concept**: System continues operating with reduced functionality.

**Strategies**:
- **Fallback Values**: Return default/cached data
- **Feature Flags**: Disable non-critical features
- **Read-Only Mode**: Allow reads, block writes

**Example**: Recommendation service down → show default recommendations instead of failing entire page.

### Redundancy and Failover

**Concept**: Deploy multiple instances, switch to backup on failure.

**Types**:
- **Active-Active**: All instances handle traffic
- **Active-Passive**: Backup ready to take over

**Example**: Primary database fails → automatically route to replica.

## Design Patterns for Failure Handling

### Pattern 1: Timeout and Retry

**Implementation**:
- Set reasonable timeouts (don't wait forever)
- Retry with exponential backoff
- Fail fast if service is down

**Trade-offs**:
- ✅ Handles transient failures
- ❌ Adds latency on retries
- ⚠️ Must ensure idempotency

### Pattern 2: Bulkhead Isolation

**Concept**: Isolate failures to prevent cascading.

**Implementation**:
- Separate thread pools for different operations
- Resource limits per service
- Independent failure domains

**Example**: Payment processing isolated from user profile updates → payment failure doesn't affect profile updates.

### Pattern 3: Health Checks and Auto-Recovery

**Concept**: Continuously monitor health, automatically recover.

**Implementation**:
- Periodic health check endpoints
- Automatic restart on failure
- Gradual traffic increase after recovery

**Example**: Service becomes unhealthy → removed from load balancer → restarted → health check passes → gradually added back.

## Failure Scenarios and Responses

### Scenario 1: Database Failure

**Detection**: Connection timeout, health check failure

**Response**:
1. Circuit breaker opens
2. Route reads to replica (if available)
3. Queue writes for later processing
4. Alert operations team

**Recovery**: Database restored → circuit breaker half-opens → verify health → resume normal operation.

### Scenario 2: Network Partition

**Detection**: Cannot reach service, timeout errors

**Response**:
1. Use cached data if available
2. Graceful degradation
3. Queue operations for later
4. Alert on partition

**Recovery**: Network restored → sync queued operations → verify consistency.

### Scenario 3: Service Overload

**Detection**: High latency, error rate increase

**Response**:
1. Rate limiting
2. Load shedding (reject non-critical requests)
3. Scale up resources
4. Circuit breaker to protect downstream

**Recovery**: Load decreases → remove rate limits → scale down if needed.

## Key Takeaways

1. **Failures are expected** - design for them, don't assume they won't happen
2. **Retry with backoff** - handle transient failures gracefully
3. **Circuit breakers prevent cascades** - fail fast to protect system
4. **Graceful degradation** - keep system partially functional
5. **Monitor and recover** - detect failures quickly, recover automatically

---

*Previous: [Failure Models (Part 1)](./04_failure-models.md)*  
*Next: Learn about [Fault Tolerance Principles](../04_principles/05_fault-tolerance.md) or explore [Real-World Failures](../08_failures/01_introduction.md).*
