# URL Shortener - Diagrams

This folder contains all diagrams for the URL Shortener case study, organized by diagram type.

## C4 Model Diagrams

The C4 model provides different levels of abstraction for system architecture:

1. **[Context Diagram](./context-diagram.md)** - C4 Level 1
   - Shows the system and its relationships with users and external systems
   - High-level view of system boundaries

2. **[Container Diagram](./container-diagram.md)** - C4 Level 2
   - Shows the high-level technical building blocks (containers)
   - Applications, databases, and external systems

3. **[Component Diagram](./component-diagram.md)** - C4 Level 3
   - Shows the internal components of the Short URL Service
   - Detailed view of service internals

## Sequence Diagrams

Interaction flows showing step-by-step request processing:

1. **[Shortening Flow](./sequence-diagrams/shortening-flow.md)**
   - Flow when a user creates a short URL
   - Token generation, storage, and caching

2. **[Redirection Flow](./sequence-diagrams/redirection-flow.md)**
   - Flow when a user accesses a short URL
   - CDN, cache, and database interactions

3. **[Token Range Assignment](./sequence-diagrams/token-range-assignment.md)**
   - How service instances request and receive token ranges
   - ACID transaction handling

## Architecture Diagram

A comprehensive architecture diagram is also available in [High-Level Design](../02_high-level-design.md), showing all system components and their relationships.

## Diagram Standards

- **Mermaid-first**: All diagrams use Mermaid syntax for primary visualization
- **ASCII fallback**: ASCII diagrams included for compatibility
- **Original content**: All diagrams are original, not copied from external sources

---

*Return to [Case Study Overview](../README.md)*

