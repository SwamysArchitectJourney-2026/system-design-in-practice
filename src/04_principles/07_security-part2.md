---
learning_level: "Intermediate"
prerequisites: ["Security in System Design (Part 1)", "System design fundamentals"]
estimated_time: "25 minutes"
learning_objectives:
  - "Apply security best practices to system design"
  - "Design secure service-to-service communication"
  - "Balance security with usability and performance"
related_topics:
  prerequisites:
    - ./07_security.md
  builds_upon:
    - ./07_security.md
  enables:
    - ../05_building-blocks/02_load-balancers.md
    - ../06_patterns/02_rate-limiting.md
  cross_refs: []
---

# Security in System Design (Part 2): Best Practices

## Security in Practice

### API Security

**Requirements**:
- Authentication required
- Rate limiting
- Input validation
- HTTPS only
- Error messages don't leak information

**Example**: API Gateway enforces authentication, rate limits, and validates all inputs before forwarding to services.

### Database Security

**Requirements**:
- Encrypted connections
- Least privilege access
- Encrypted sensitive data
- Regular backups
- Audit logging

**Example**: Database user has read-only access for application, separate admin user for migrations.

### Service-to-Service Security

**Requirements**:
- Service authentication
- Mutual TLS (mTLS)
- API keys or tokens
- Network isolation

**Example**: Services authenticate using mTLS certificates, communicate over private network.

## Security vs Other Principles

### Security vs Usability

**Trade-off**: More security often means less convenience.

**Balance**: Find acceptable security level for use case.

**Example**: MFA adds security but requires extra step.

### Security vs Performance

**Trade-off**: Encryption and validation add overhead.

**Balance**: Secure by default, optimize where needed.

**Example**: TLS adds latency but is essential for security.

## Key Takeaways

1. **Security is fundamental** - design it in from the start
2. **Defense in depth** - multiple layers of protection
3. **Least privilege** - grant minimum necessary permissions
4. **Encrypt everything** - data at rest and in transit
5. **Monitor and detect** - security is ongoing, not one-time

---

*Previous: [Security in System Design (Part 1)](./07_security.md)*  
*Next: Learn about [Availability](./01_availability.md) or explore [Rate Limiting](../06_patterns/02_rate-limiting.md).*

