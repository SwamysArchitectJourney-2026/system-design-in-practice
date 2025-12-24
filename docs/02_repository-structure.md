# Repository Structure

**Version**: 2.0  
**Last Updated**: December 19, 2025  
**Purpose**: Single source of truth for repository structure

> **Note**: This document should be referenced from `.github/copilot-instructions.md`, `.cursor/rules/02_repository-structure.mdc`, `README.md`, and other documentation files. When the structure changes, update this file first, then update references.

---

## Complete Repository Structure

```text
system-design-in-practice/
├── .cursor/                               # Cursor AI configuration
│   └── rules/                             # Project rules
│       ├── 01_educational-content-rules.mdc
│       ├── 02_repository-structure.mdc
│       ├── 03_quality-assurance.mdc
│       ├── 04_markdown-standards.mdc
│       ├── 05_primary-directives.mdc
│       ├── 06_cross-domain-integration.mdc
│       └── README.md
├── .github/                               # GitHub configuration
│   ├── workflows/                         # CI/CD workflows
│   ├── ISSUE_TEMPLATE/                    # Issue templates
│   ├── copilot-instructions.md            # GitHub Copilot instructions
│   └── prompts/                           # Reusable prompt templates
├── docs/                                  # Documentation
│   ├── 01_road-map.md                     # Learning path and roadmap
│   ├── 02_repository-structure.md         # THIS FILE - Single source of truth
│   └── review-reports/                    # Review and migration reports
│       └── 15Dec2025-comprehensive-review.md
├── source-material/                       # Staging area for source content (git-ignored)
│   ├── C4_Diagrams.md                     # Source material (migrated)
│   ├── ChooseRightDb.md                   # Source material (migrated)
│   ├── URLShortner.md                     # Source material (migrated)
│   └── URL+Shortening+Service.png         # Image reference (not migrated - create original diagrams)
├── src/                                   # Educational content
│   ├── CONTENT_INDEX.md                   # Complete content index
│   │
│   ├── 01_introduction/                   # Getting started
│   │   ├── 01_modern-system-design.md
│   │   ├── 02_why-learn-system-design.md
│   │   ├── 03_learning-structure.md
│   │   └── README.md
│   │
│   ├── 02_interview-prep/                 # Interview preparation
│   │   ├── 01_getting-ready.md
│   │   ├── 02_dos-and-donts.md
│   │   ├── 03_preparation-timeline.md
│   │   ├── 04_mock-interviews.md
│   │   ├── 05_ai-evaluation.md
│   │   ├── 06_hld-vs-lld.md
│   │   └── README.md
│   │
│   ├── 03_foundations/                    # Foundational concepts
│   │   ├── 01_abstractions.md
│   │   ├── 02_network-abstractions-part1.md
│   │   ├── 03_consistency-models-part1.md
│   │   ├── 04_failure-models-part1.md
│   │   ├── 05_back-of-envelope-part1.md
│   │   ├── 06_c4-diagrams-part1.md
│   │   ├── 07_scaling-fundamentals.md
│   │   ├── 07_scaling-fundamentals-part1.md
│   │   ├── 07_scaling-fundamentals-part2.md
│   │   └── README.md
│   │
│   ├── 04_principles/                     # System design principles
│   │   ├── 01_availability.md
│   │   ├── 02_reliability.md
│   │   ├── 03_scalability.md
│   │   ├── 04_consistency.md
│   │   ├── 05_fault-tolerance.md
│   │   ├── 06_maintainability.md
│   │   ├── 07_security.md
│   │   └── README.md
│   │
│   ├── 05_building-blocks/                # Core building blocks
│   │   ├── 01_dns.md
│   │   ├── 02_load-balancers.md
│   │   ├── 03_databases-part1.md         # Split into parts (150-line limit)
│   │   ├── 03_databases-part2.md
│   │   ├── 04_key-value-store.md
│   │   ├── 05_cdn.md
│   │   ├── 06_sequencer.md
│   │   ├── 07_monitoring.md
│   │   ├── 08_distributed-cache.md
│   │   ├── 09_message-queues.md
│   │   ├── 10_pub-sub.md
│   │   ├── 11_object-storage.md
│   │   ├── 12_search.md
│   │   ├── 13_distributed-logging.md
│   │   ├── 14_task-scheduler.md
│   │   ├── 15_sharded-counters.md
│   │   └── README.md
│   │
│   ├── 06_patterns/                       # Architectural patterns
│   │   ├── 01_caching.md
│   │   ├── 02_rate-limiting.md
│   │   ├── 03_circuit-breaker.md
│   │   ├── 04_cqrs.md
│   │   ├── 05_event-driven.md
│   │   └── README.md
│   │
│   ├── 07_case-studies/                   # End-to-end case studies
│   │   ├── 01-scalefromzerotomillonusers/ # Scale from zero to million users
│   │   ├── 02-rate-limiter/               # Rate limiter design
│   │   ├── 03-consistenthashing/          # Consistent hashing
│   │   ├── 04-uniqueidgenerator/          # Unique ID generator
│   │   ├── 05-url-shortener/              # URL Shortener (complete case study)
│   │   │   ├── 01_requirements.md
│   │   │   ├── 02_back-of-envelope.md
│   │   │   ├── 03_high-level-design.md
│   │   │   ├── 04_low-level-design.md
│   │   │   ├── 05_scalability.md
│   │   │   ├── 06_observability.md
│   │   │   ├── 07_security.md
│   │   │   ├── 08_trade-offs.md
│   │   │   ├── README.md
│   │   │   └── diagrams/                   # Case study specific diagrams
│   │   │       ├── 01_context-diagram.md
│   │   │       ├── 02_container-diagram.md
│   │   │       ├── 03_component-diagram.md
│   │   │       └── sequence-diagrams/
│   │   │           ├── 01_shortening-flow.md
│   │   │           ├── 02_redirection-flow.md
│   │   │           └── 03_token-range-assignment.md
│   │   ├── chatgpt/
│   │   ├── deployment/
│   │   ├── google-docs/
│   │   ├── google-maps/
│   │   ├── instagram/
│   │   ├── livestreaming/
│   │   ├── newsfeed/
│   │   ├── payment/
│   │   ├── quora/
│   │   ├── twitter/
│   │   ├── typeahead/
│   │   ├── uber/
│   │   ├── videoconferencing/
│   │   ├── web-crawler/
│   │   ├── whatsapp/
│   │   ├── yelp/
│   │   ├── youtube/
│   │   └── README.md
│   │
│   ├── 08_failures/                       # Real-world failure analysis
│   │   ├── 01_introduction.md
│   │   ├── 02_facebook-outage.md
│   │   ├── 03_aws-kinesis-outage.md
│   │   ├── 04_aws-outage.md
│   │   ├── 05_lessons-learned.md
│   │   └── README.md
│   │
│   ├── 09_ai-ml-systems/                  # Gen AI and ML system design
│   │   └── README.md
│   │
│   └── references/                        # Learning resources
│       ├── books.md
│       ├── papers.md
│       └── tools.md
│
├── README.md                              # Main repository documentation
├── CONTRIBUTING.md                        # Contribution guidelines
├── CODE_OF_CONDUCT.md                     # Code of conduct
├── LICENSE                                 # MIT License
└── lychee.toml                            # Link checker configuration
```

---

## Key Structure Notes

### File Naming Conventions

- **Educational Content** (`src/01_introduction/` through `src/08_failures/`):
  - ✅ Use zero-padded numeric prefixes: `01_`, `02_`, etc.
  - ❌ **NEVER** use `00_` prefix - **NO EXCEPTIONS**
  - ✅ Use hyphens for multi-word names: `01_modern-system-design.md`
  - ✅ Split files use: `topic-slug-part1.md`, `topic-slug-part2.md` (avoid `A/B/C`)

- **Case Studies** (`src/07_case-studies/`):
  - ✅ Can use numbered files: `01_requirements.md`, `02_back-of-envelope.md`, etc.
  - ✅ Or use standard names: `requirements.md`, `high-level-design.md`, etc.
  - ✅ Diagrams co-located in `diagrams/` folder within each case study

- **References** (`src/references/`):
  - ✅ Logical names: `books.md`, `papers.md`, `tools.md`
  - ⚠️ No numbering required

### Content Organization

1. **Learning Progression**: Content follows logical learning order (01 → 08)
2. **Split Files**: Files exceeding 150 lines are split into parts (e.g., `03_databases-part1.md`, `03_databases-part2.md`)
3. **Case Study Structure**: Each case study includes:
   - Requirements, Back-of-Envelope, HLD, LLD, Scalability, Observability, Security, Trade-offs
   - Diagrams folder with C4 and sequence diagrams

### Special Directories

- **`source-material/`**: Staging area for source content (git-ignored)
  - Raw source materials placed here before migration
  - Files are transformed and migrated to `src/` following zero-copy policy
  - Source files remain after migration (user deletes manually)

- **`docs/review-reports/`**: Review and migration verification reports
  - Date-based naming: `DDMonYYYY-description.md`
  - Documents migration status, rule compliance, and content quality

---

## Update Protocol

**When repository structure changes**:

1. ✅ **Update this file first** (`docs/02_repository-structure.md`)
2. ✅ **Update references** in:
   - `.github/copilot-instructions.md` - Reference this file
   - `.cursor/rules/02_repository-structure.mdc` - Reference this file
   - `README.md` - Reference this file
3. ✅ **Verify consistency** across all documentation

**Self-Check Question**: "Did I update `docs/02_repository-structure.md` first?" - If no, STOP and do it NOW.

---

## References

- **Repository Structure**: This file (`docs/02_repository-structure.md`)
- **Content Rules**: `.cursor/rules/01_educational-content-rules.mdc`
- **Learning Path**: `docs/ROADMAP.md`
- **Content Index**: `src/CONTENT_INDEX.md`
- **GitHub Copilot Instructions**: `.github/copilot-instructions.md`
