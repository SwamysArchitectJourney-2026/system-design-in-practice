# Scale from Zero to Million Users - Back-of-Envelope Calculations

## Capacity Planning by Phase

### Phase 1: 0-1,000 Users

**Assumptions**:

- 1,000 active users
- 10 requests/user/day average
- 100 requests/second peak
- 1 KB average request/response size

**Calculations**:

- **Daily Requests**: 1,000 users × 10 requests = 10,000 requests/day
- **Peak QPS**: 100 requests/second
- **Bandwidth**: 100 QPS × 1 KB × 2 (request + response) = 200 KB/s = 1.6 Mbps
- **Storage**: 10,000 requests/day × 1 KB × 365 days = 3.65 GB/year
- **Servers**: 1 server (2 CPU, 4 GB RAM) sufficient

**Infrastructure Cost**: ~$50-100/month

### Phase 2: 1,000-100,000 Users

**Assumptions**:

- 100,000 active users
- 10 requests/user/day average
- 1,000 requests/second peak
- 1 KB average request/response size

**Calculations**:

- **Daily Requests**: 100,000 users × 10 requests = 1,000,000 requests/day
- **Peak QPS**: 1,000 requests/second
- **Bandwidth**: 1,000 QPS × 1 KB × 2 = 2 MB/s = 16 Mbps
- **Storage**: 1M requests/day × 1 KB × 365 days = 365 GB/year
- **Servers**: 2-3 servers (4 CPU, 8 GB RAM each) with read replicas

**Infrastructure Cost**: ~$300-500/month

### Phase 3: 100,000-1,000,000 Users

**Assumptions**:

- 1,000,000 active users
- 10 requests/user/day average
- 10,000 requests/second peak
- 1 KB average request/response size

**Calculations**:

- **Daily Requests**: 1M users × 10 requests = 10,000,000 requests/day
- **Peak QPS**: 10,000 requests/second
- **Bandwidth**: 10,000 QPS × 1 KB × 2 = 20 MB/s = 160 Mbps
- **Storage**: 10M requests/day × 1 KB × 365 days = 3.65 TB/year
- **Servers**: 10-20 servers (8 CPU, 16 GB RAM each) with load balancer

**Infrastructure Cost**: ~$2,000-5,000/month

### Phase 4: 1,000,000+ Users

**Assumptions**:

- 10,000,000+ active users
- 10 requests/user/day average
- 100,000+ requests/second peak
- 1 KB average request/response size

**Calculations**:

- **Daily Requests**: 10M users × 10 requests = 100,000,000 requests/day
- **Peak QPS**: 100,000 requests/second
- **Bandwidth**: 100,000 QPS × 1 KB × 2 = 200 MB/s = 1.6 Gbps
- **Storage**: 100M requests/day × 1 KB × 365 days = 36.5 TB/year
- **Servers**: 100+ servers distributed across regions

**Infrastructure Cost**: ~$20,000-50,000/month

## Key Metrics Summary

| Phase | Users | Peak QPS | Storage/Year | Servers | Monthly Cost |
| ----- | ----- | -------- | ------------ | ------- | ------------ |
| Phase 1 | 1K | 100 | 3.65 GB | 1 | $50-100 |
| Phase 2 | 100K | 1K | 365 GB | 2-3 | $300-500 |
| Phase 3 | 1M | 10K | 3.65 TB | 10-20 | $2K-5K |
| Phase 4 | 10M+ | 100K+ | 36.5+ TB | 100+ | $20K-50K+ |

## Scaling Considerations

- **Cache Hit Ratio**: 80% cache hit rate reduces database load by 5x
- **Read/Write Ratio**: 10:1 read/write ratio affects database design
- **Data Growth**: Plan for 3-5 years of data retention
- **Geographic Distribution**: Multi-region deployment for global users

---

## Understanding Performance Metrics

> **📚 Foundational Content**: For detailed explanations of performance metrics (p90/p95, latency vs throughput, QPS/RPS, concurrent users), see [Performance Metrics in System Design](../../03_foundations/08_performance-metrics.md).

**Quick Reference**:
- **p90/p95**: Percentile metrics showing response time distribution (p95 = 95% of requests finish in this time)
- **Latency**: Time to complete a request (lower is better, measured in ms)
- **Throughput**: Requests processed per second (higher is better, measured in RPS/QPS)
- **Concurrent Users vs RPS**: RPS = (Concurrent Users × Requests per Session) / Session Duration
- **QPS vs RPS**: Essentially the same metric (QPS for databases, RPS for APIs)

---

## Component-Level Back-of-Envelope Calculations

### A. Data Store

**Performance Target**: Returns within 50ms for 95% of requests (p95 < 50ms)

**Capacity Planning**:

**Phase 1-2 (0-100K users)**:
- Single database instance
- Read replicas for read-heavy workloads
- Connection pool: 50-100 connections
- Storage: 365 GB - 3.65 TB/year

**Phase 3-4 (100K-1M+ users)**:
- Database sharding or read replicas
- Connection pool: 200-500 connections per shard
- Storage: 3.65 TB - 36.5+ TB/year
- Read replicas: 2-5 replicas per primary

**Calculations**:
- **Read Operations**: 90% of traffic (10:1 read/write ratio)
- **Write Operations**: 10% of traffic
- **Database Load**: Total QPS / (1 + number of read replicas)
- **Storage Growth**: Daily writes × record size × retention period

**Example (Phase 3)**:
- 10,000 QPS total
- 9,000 read QPS, 1,000 write QPS
- 3 read replicas
- Primary database handles: 1,000 write QPS + (9,000 / 3) = 4,000 QPS
- Each replica handles: 3,000 read QPS

### B. Caching

**Strategy**: Use Redis or Memcached to cache frequent queries, reducing database load

**Cache Hit Ratio Target**: 80-90% (industry standard)

**Capacity Planning**:

**Phase 2 (1K-100K users)**:
- Single Redis instance
- Memory: 2-4 GB
- Cache TTL: 5-15 minutes
- Reduces database load by 4-5x

**Phase 3-4 (100K-1M+ users)**:
- Redis cluster (distributed)
- Memory: 16-64 GB total (across nodes)
- Cache TTL: 1-10 minutes (varies by data type)
- Reduces database load by 5-10x

**Calculations**:
- **Cache Hit Rate**: 80% (typical)
- **Database Load Reduction**: 
  - Without cache: 10,000 QPS to database
  - With 80% hit rate: 2,000 QPS to database (80% reduction)
- **Cache Memory**: 
  - Hot data: 20% of total data
  - Cache size = (Daily unique reads × record size × 0.2) / cache_hit_ratio

**Example (Phase 3)**:
- 10,000 read QPS
- 80% cache hit rate
- Cache handles: 8,000 QPS (hits)
- Database handles: 2,000 QPS (misses)
- Cache memory needed: ~8-16 GB for hot data

### C. Load Balancing

**Types**: External (public-facing) and Internal (service-to-service)

**External Load Balancer**:
- Sits between internet and application servers
- Handles user traffic
- SSL termination
- Health checks
- Geographic routing (Phase 4)

**Internal Load Balancer**:
- Routes traffic between services
- Service-to-service communication
- Not exposed to internet
- Lower latency requirements

**Capacity Planning**:

**Phase 2 (1K-100K users)**:
- Single external load balancer
- 1,000-10,000 connections/second capacity
- Health checks every 5-10 seconds

**Phase 3-4 (100K-1M+ users)**:
- External load balancer with auto-scaling
- 10,000-100,000+ connections/second capacity
- Internal load balancers for microservices
- Health checks every 1-5 seconds

**Calculations**:
- **Connections per Second**: Peak QPS × average connection duration
- **Load Balancer Capacity**: Must handle 2-3x peak traffic for headroom
- **Health Check Overhead**: (Number of backends × health check frequency) / 60 seconds

**Example (Phase 3)**:
- 10,000 peak QPS
- Average connection: 2 seconds
- Connections/second: 10,000 × 2 = 20,000 connections/second
- Load balancer capacity needed: 20,000 × 2 = 40,000 connections/second (with headroom)

**Internal vs External Load Balancers**:

**External Load Balancer** (Public-facing):
- **Location**: Between internet and application servers
- **Purpose**: Distribute user traffic to application servers
- **Features**:
  - SSL/TLS termination
  - Public IP addresses
  - DDoS protection
  - Geographic routing (multi-region)
- **Use Cases**: 
  - User-facing APIs
  - Web applications
  - Mobile app backends
- **Latency**: 1-5ms overhead per request

**Internal Load Balancer** (Service-to-service):
- **Location**: Inside private network, between services
- **Purpose**: Route traffic between microservices
- **Features**:
  - Private IP addresses only
  - Service discovery integration
  - Health checks
  - Circuit breaker support
- **Use Cases**:
  - Microservices communication
  - Database connection pooling
  - Internal API routing
- **Latency**: 0.5-2ms overhead per request

**When to Use Each**:

**External Load Balancer**:
- All user-facing traffic
- Phase 2+ (when you have multiple application servers)
- Required for SSL termination
- Needed for geographic distribution

**Internal Load Balancer**:
- Microservices architecture (Phase 4)
- Service mesh implementations
- Database read replica routing
- Internal service-to-service communication

**Example Architecture (Phase 4)**:
```
Internet → External LB → [App Server 1, App Server 2, ...]
                              ↓
                    Internal LB → [User Service, Order Service, ...]
                              ↓
                    Internal LB → [Database Primary, Read Replica 1, ...]
```

### D. CDN (Content Delivery Network)

**Purpose**: Cache static content at edge locations close to users

**CDN, Traffic Distribution, and Edge Locations**:

**Edge Locations**: Servers distributed globally, close to end users
- Reduces latency by serving content from nearby locations
- Typical latency: 10-50ms (vs 100-300ms from origin)

**Traffic Distribution**:
- DNS routes users to nearest edge location
- Edge location serves cached content
- On cache miss, edge fetches from origin and caches for future requests

**Cache Hit Ratio**: 90-95% for static content (typical)

**Capacity Planning**:

**Phase 3-4 (100K-1M+ users)**:
- CDN for static assets (images, CSS, JS, videos)
- Edge locations: 50-200+ locations globally
- Bandwidth: 80-90% of total bandwidth (CDN handles most static traffic)
- Origin bandwidth: 10-20% of total (cache misses and dynamic content)

**Calculations**:
- **Static Content**: 60-80% of total bandwidth
- **CDN Bandwidth**: Static bandwidth × 0.9 (90% cache hit)
- **Origin Bandwidth**: Static bandwidth × 0.1 (10% cache miss) + Dynamic bandwidth
- **Latency Improvement**: 
  - Without CDN: 200-300ms (origin to user)
  - With CDN: 10-50ms (edge to user)

**Example (Phase 3)**:
- Total bandwidth: 160 Mbps
- Static content: 60% = 96 Mbps
- CDN handles: 96 × 0.9 = 86.4 Mbps (cache hits)
- Origin handles: 96 × 0.1 = 9.6 Mbps (cache misses) + 64 Mbps (dynamic) = 73.6 Mbps

### E. Monitoring

**Purpose**: Track system health, performance, and business metrics

**Metrics Collected**:

**Infrastructure Metrics**:
- CPU utilization (per server)
- Memory usage (per server)
- Disk I/O (per server)
- Network bandwidth (per server)

**Application Metrics**:
- Request rate (QPS/RPS)
- Response time (p50, p90, p95, p99)
- Error rate (4xx, 5xx)
- Cache hit ratio

**Business Metrics**:
- Active users
- Transactions per second
- Revenue per request

**Capacity Planning**:

**Phase 1-2 (0-100K users)**:
- Basic monitoring: 10-50 metrics
- Data retention: 7-30 days
- Update frequency: 1-5 minutes

**Phase 3-4 (100K-1M+ users)**:
- Comprehensive monitoring: 100-1000+ metrics
- Data retention: 90-365 days
- Update frequency: 10-60 seconds
- Distributed tracing for microservices

**Calculations**:
- **Metrics per Second**: (Number of metrics × Update frequency) / 60
- **Storage per Day**: (Metrics per second × Bytes per metric × 86400 seconds)
- **Example**: 100 metrics × 1 update/minute = 100/60 = 1.67 metrics/second
- Storage: 1.67 × 100 bytes × 86400 = ~14 MB/day

### F. Alerting

**Purpose**: Notify team when metrics exceed thresholds

**Alert Types**:

**Critical Alerts** (immediate response):
- Service down (error rate > 5%)
- High latency (p95 > 1 second)
- Database connection failures
- Disk space < 10%

**Warning Alerts** (investigate soon):
- Error rate > 1%
- Latency increasing (p95 > 500ms)
- CPU > 80%
- Cache hit ratio < 70%

**Capacity Planning**:

**Phase 1-2 (0-100K users)**:
- 5-10 alert rules
- Email/SMS notifications
- On-call rotation: 1-2 people

**Phase 3-4 (100K-1M+ users)**:
- 20-50+ alert rules
- PagerDuty/Opsgenie integration
- On-call rotation: 5-10 people
- Alert routing by service/severity

**Calculations**:
- **Alert Volume**: Typically 1-5% of metrics generate alerts
- **False Positive Rate**: Target < 5% (alerts that don't require action)
- **Alert Fatigue**: Too many alerts reduce effectiveness (aim for < 10 alerts/day per on-call person)

### G. Auto-Scaling

**Purpose**: Automatically adjust resources based on demand

**Scaling Triggers**:

**Scale Up** (add instances):
- CPU utilization > 70% for 5 minutes
- Memory usage > 80% for 5 minutes
- Request queue depth > 100
- p95 latency > 500ms for 5 minutes

**Scale Down** (remove instances):
- CPU utilization < 30% for 10 minutes
- Memory usage < 50% for 10 minutes
- Request queue depth < 10

**Capacity Planning**:

**Phase 2-3 (1K-1M users)**:
- Auto-scaling groups: 2-20 instances
- Scale-up: +2 instances at a time
- Scale-down: -1 instance at a time
- Cooldown: 5-10 minutes between scaling actions

**Phase 4 (1M+ users)**:
- Auto-scaling groups: 20-100+ instances
- Scale-up: +5-10 instances at a time
- Scale-down: -2-5 instances at a time
- Cooldown: 2-5 minutes between scaling actions

**Calculations**:
- **Target Capacity**: Peak QPS / (QPS per instance × target utilization)
- **Example**: 10,000 peak QPS, 500 QPS per instance, 70% target utilization
- Target instances: 10,000 / (500 × 0.7) = ~29 instances
- **Scaling Time**: 2-5 minutes to add instances, 1-3 minutes to remove

### H. Backup & Recovery

**Purpose**: Protect data and enable disaster recovery

**Backup Strategy**:

**Phase 1-2 (0-100K users)**:
- Daily full backups
- 7-30 day retention
- Manual recovery process
- RTO (Recovery Time Objective): 4-24 hours
- RPO (Recovery Point Objective): 24 hours

**Phase 3-4 (100K-1M+ users)**:
- Continuous backups (transaction logs)
- Daily full backups
- 30-90 day retention
- Automated recovery process
- RTO: 1-4 hours
- RPO: 1 hour or less

**Capacity Planning**:

**Backup Storage**:
- Full backup size: Database size × compression ratio (typically 0.3-0.5)
- Incremental backup: 5-10% of full backup size
- Total backup storage: (Full backup + Incremental backups × retention days) × 2 (for redundancy)

**Example (Phase 3)**:
- Database size: 3.65 TB
- Full backup: 3.65 TB × 0.4 = 1.46 TB (compressed)
- Daily incremental: 3.65 TB × 0.05 = 182 GB
- 30-day retention: 1.46 TB + (182 GB × 30) = 6.92 TB
- Total with redundancy: 6.92 TB × 2 = 13.84 TB

**Recovery Testing**:
- Test restore monthly (Phase 1-2)
- Test restore weekly (Phase 3-4)
- Document recovery procedures

### I. Security & Compliance

**Purpose**: Protect data and meet regulatory requirements

**Security Measures**:

**Phase 1-2 (0-100K users)**:
- HTTPS/TLS encryption
- Password hashing (bcrypt)
- Basic input validation
- SQL injection prevention
- Security headers

**Phase 3-4 (100K-1M+ users)**:
- All Phase 1-2 measures
- WAF (Web Application Firewall)
- DDoS protection
- Rate limiting
- Security scanning
- Penetration testing
- Compliance audits (SOC 2, GDPR, etc.)

**Capacity Planning**:

**Security Overhead**:
- Encryption: 5-10% CPU overhead
- WAF: 10-20ms latency overhead
- DDoS protection: Minimal overhead (handled at edge)
- Security scanning: Runs asynchronously, minimal impact

**Compliance Requirements**:
- Data encryption at rest: Required for sensitive data
- Data encryption in transit: Required (HTTPS/TLS)
- Access logging: All access attempts logged
- Audit trails: 90-365 day retention
- Compliance reporting: Monthly/quarterly reports

**Calculations**:
- **Security Logs**: 1-5% of total log volume
- **Audit Storage**: (Number of operations × log entry size × retention days)
- **Example**: 10M operations/day × 200 bytes × 365 days = 730 GB/year