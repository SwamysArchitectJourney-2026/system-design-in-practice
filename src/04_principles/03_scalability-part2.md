---
learning_level: "Intermediate"
prerequisites: ["Scalability Fundamentals (Part 1)"]
estimated_time: "25 minutes"
learning_objectives:
  - "Apply scaling strategy decision framework to real scenarios"
  - "Identify and resolve common scalability bottlenecks"
  - "Design scalable systems using proven patterns"
related_topics:
  prerequisites:
    - ./03_scalability.md
    - ../03_foundations/01_abstractions.md
  builds_upon:
    - ./03_scalability.md
    - ../05_building-blocks/02_load-balancers.md
  enables:
    - ../07_case-studies/01-scalefromzerotomillonusers/README.md
    - ../05_building-blocks/03_databases-part1.md
  cross_refs: []
---

# Scalability in System Design (Part 2)

*Previous: [Scalability Fundamentals - Vertical and Horizontal Scaling](./03_scalability.md)*

## Scaling Strategy Decision Framework

Consider these factors when choosing a scaling approach:

1. **Current Scale**: Start with vertical scaling for small systems, move to horizontal as you grow
2. **Traffic Patterns**: Predictable traffic favors vertical; variable traffic needs horizontal
3. **Availability Requirements**: High availability requires horizontal scaling
4. **Cost Constraints**: Vertical is cheaper initially; horizontal is more cost-effective at scale
5. **Operational Complexity**: Vertical is simpler; horizontal requires more DevOps expertise

## Common Scalability Patterns

### Pattern 1: Start Simple, Evolve Gradually

Begin with a single-server architecture, then evolve:

1. **Phase 1**: Single server (vertical scaling)
2. **Phase 2**: Separate database server (vertical scaling)
3. **Phase 3**: Add read replicas (hybrid approach)
4. **Phase 4**: Multiple application servers (horizontal scaling)
5. **Phase 5**: Distributed architecture (full horizontal scaling)

### Pattern 2: Stateless Design for Horizontal Scaling

Design applications to be stateless:

- Store session data in external cache (Redis) or database
- Avoid server-side session storage
- Use load balancers with any routing algorithm (round-robin, least connections)
- Enables easy addition/removal of servers

### Pattern 3: Database Scaling Strategies

Databases require different scaling approaches:

- **Read Replicas**: Scale read operations horizontally
- **Sharding**: Partition data across multiple database instances
- **Caching**: Reduce database load with in-memory caches
- **Read/Write Separation**: Route reads to replicas, writes to primary

## Identifying Scalability Bottlenecks

Common bottlenecks and solutions:

| Bottleneck | Solution |
| --------- | -------- |
| **Single Application Server** | Add more servers + load balancer |
| **Database Overload** | Read replicas, caching, sharding |
| **Network Bandwidth** | CDN, edge caching, compression |
| **CPU/Memory Limits** | Horizontal scaling (preferred) or vertical scaling |
| **State Management** | Externalize state (database, cache, message queue) |

## Key Takeaways

1. **Start simple**: Begin with vertical scaling, evolve to horizontal
2. **Design for growth**: Plan architecture evolution path
3. **Stateless is key**: Stateless design enables horizontal scaling
4. **Consider trade-offs**: Each scaling approach has costs and benefits
5. **Think incrementally**: Scale in phases, not all at once

---

*Previous: [Scalability Fundamentals - Vertical and Horizontal Scaling](./03_scalability.md)*  
*Next: Explore [Load Balancers](../../05_building-blocks/02_load-balancers.md) for horizontal scaling implementation, or study [Scale from Zero to Million Users](../../07_case-studies/01-scalefromzerotomillonusers/README.md) case study.*

