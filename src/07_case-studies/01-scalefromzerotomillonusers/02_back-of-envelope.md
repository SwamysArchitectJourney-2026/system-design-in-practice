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
|-------|-------|----------|--------------|---------|--------------|
| Phase 1 | 1K | 100 | 3.65 GB | 1 | $50-100 |
| Phase 2 | 100K | 1K | 365 GB | 2-3 | $300-500 |
| Phase 3 | 1M | 10K | 3.65 TB | 10-20 | $2K-5K |
| Phase 4 | 10M+ | 100K+ | 36.5+ TB | 100+ | $20K-50K+ |

## Scaling Considerations

- **Cache Hit Ratio**: 80% cache hit rate reduces database load by 5x
- **Read/Write Ratio**: 10:1 read/write ratio affects database design
- **Data Growth**: Plan for 3-5 years of data retention
- **Geographic Distribution**: Multi-region deployment for global users
