---
learning_level: "Beginner"
prerequisites: ["Basic understanding of distributed systems", "Network communication basics"]
estimated_time: "25 minutes"
learning_objectives:
  - "Understand what RPCs are and why they matter in distributed systems"
  - "Compare RPC vs REST for service-to-service communication"
  - "Recognize RPC implementation patterns and error handling strategies"
related_topics:
  prerequisites:
    - ./01_abstractions.md
  builds_upon:
    - ./01_abstractions.md
  enables:
    - ./07_request-flow-and-basic-architecture-part1.md
    - ../05_building-blocks/09_message-queues.md
  cross_refs: []
---

# Network Abstractions: Remote Procedure Calls (RPC)

## What Are RPCs?

Remote Procedure Calls (RPCs) are an **abstraction that makes distributed service calls look like local function calls**. Instead of manually constructing HTTP requests, parsing responses, and handling network errors, RPC frameworks handle these details automatically.

### The Abstraction Layer

**Without RPC** (Direct HTTP):
```python
# Manual HTTP call
response = requests.post(
    "https://user-service.example.com/api/v1/users",
    json={"name": "Alice", "email": "alice@example.com"},
    headers={"Authorization": "Bearer token123"}
)
user = response.json()
```

**With RPC** (Abstraction):
```python
# Looks like a local function call
user = user_service.create_user(name="Alice", email="alice@example.com")
```

The RPC framework handles:
- Network protocol details (HTTP, gRPC, etc.)
- Serialization/deserialization
- Connection management
- Error translation

## Why RPCs Matter

### 1. Developer Experience

RPCs provide:
- **Type safety**: Compile-time checking of service contracts
- **IDE support**: Autocomplete, parameter hints, documentation
- **Consistency**: Same calling pattern across services

### 2. Performance

RPC frameworks optimize:
- **Binary protocols**: More efficient than JSON (gRPC uses Protocol Buffers)
- **Connection pooling**: Reuse connections, reduce overhead
- **Streaming**: Handle large data efficiently

### 3. Service Contracts

RPCs enforce:
- **Interface definitions**: Services must match defined contracts
- **Versioning**: Handle API evolution gracefully
- **Documentation**: Contracts serve as living documentation

## RPC vs REST

### When to Use RPC

**Best for**:
- Service-to-service communication (internal APIs)
- High-performance requirements
- Strong typing needs
- Streaming data

**Example**: Microservices calling each other within a data center.

### When to Use REST

**Best for**:
- Public APIs (external consumers)
- Web browsers (HTTP/JSON is universal)
- Simple CRUD operations
- Human-readable debugging

**Example**: Public API for third-party developers.

### Comparison

| Aspect | RPC | REST |
|--------|-----|------|
| **Protocol** | Binary (gRPC) or custom | HTTP/JSON |
| **Performance** | Higher throughput | Lower latency for simple calls |
| **Type Safety** | Strong (compile-time) | Weak (runtime validation) |
| **Browser Support** | Limited (needs proxy) | Native |
| **Caching** | Not standard | HTTP caching built-in |
| **Tooling** | Framework-specific | Universal (curl, Postman) |

## RPC Implementation Patterns

### Pattern 1: Synchronous RPC

**Blocking call** - client waits for response:

```python
# Client blocks until response
result = payment_service.process_payment(amount=100, user_id=123)
print(f"Payment ID: {result.payment_id}")
```

**Use when**: Need immediate result, simple request/response.

### Pattern 2: Asynchronous RPC

**Non-blocking call** - client continues immediately:

```python
# Client doesn't wait
future = payment_service.process_payment_async(amount=100, user_id=123)
# Do other work...
result = future.get()  # Get result when ready
```

**Use when**: Long-running operations, don't need immediate response.

### Pattern 3: Streaming RPC

**Continuous data flow**:

```python
# Stream results as they arrive
for result in search_service.stream_results(query="system design"):
    process_result(result)
```

**Use when**: Large datasets, real-time updates, progressive results.

## Error Handling in RPCs

### Error Types

1. **Network Errors**: Connection failures, timeouts
2. **Protocol Errors**: Invalid request format, version mismatch
3. **Application Errors**: Business logic failures, validation errors
4. **Service Errors**: Service unavailable, overloaded

### Error Handling Strategies

**Retry Logic**:
- Transient errors (network, timeouts) → retry with exponential backoff
- Permanent errors (validation, not found) → don't retry

**Circuit Breaker**:
- Stop calling failing service after threshold
- Fail fast instead of waiting for timeouts

**Fallback**:
- Return cached data or default values
- Graceful degradation

## Key Takeaways

1. **RPCs abstract network complexity** - make distributed calls look local
2. **Choose RPC for internal services** - better performance and type safety
3. **Use REST for public APIs** - universal, browser-friendly
4. **Handle errors gracefully** - retry, circuit break, fallback
5. **Consider streaming** - for large data or real-time updates

---

*Previous: [Abstractions in System Design](./01_abstractions.md)*  
*Next: Learn about [Consistency Models](./03_consistency-models.md) or explore [Request Flow](./07_request-flow-and-basic-architecture-part1.md).*
