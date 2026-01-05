# System Design in Practice – Learning Journey

[![License](https://img.shields.io/badge/License-MIT-purple)](LICENSE)
[![Status](https://img.shields.io/badge/Status-Active-success)](https://github.com/Swamy-s-Tech-Skills-Academy-2026/system-design-in-practice)
[![System Design](https://img.shields.io/badge/System-Design-orange)](https://github.com/Swamy-s-Tech-Skills-Academy-2026/system-design-in-practice)
![Format](https://img.shields.io/badge/Format-25%20Minutes-yellow)
![Built with](https://img.shields.io/badge/Built%20with-GitHub%20Copilot-brown)
[![Maintainer](https://img.shields.io/badge/Maintainer-Viswanatha%20Swamy%20P%20K-blue)](https://github.com/Swamy-s-Tech-Skills-Academy-2026)

**Repository**: [system-design-in-practice](https://github.com/Swamy-s-Tech-Skills-Academy-2026/system-design-in-practice)

> **⚠️ IMPORTANT: This is NOT an official course or syllabus. This is Swamy's personal learning journey and study materials.**

**Purpose**: Apply system design principles and patterns to build scalable, reliable distributed systems.

This repository focuses on **how to design**, not just what to know.

---

## 📌 Disclaimer

This is **Swamy's personal learning** repository and reference workspace, not official course material or a packaged curriculum.

---

## 📑 Table of Contents

- [Who This Is For / Who This Is Not For](#-who-this-is-for--who-this-is-not-for)
- [What This Repository Covers](#-what-this-repository-covers)
- [Repository Structure Overview](#-repository-structure-overview)
- [How to Use This Repository](#-how-to-use-this-repository)
- [Quick Start](#-quick-start)
- [Related Repositories](#-related-repositories)
- [Key Principles](#-key-principles)
- [Success Criteria](#-success-criteria)
- [Resources](#-resources)
- [Status](#-status)
- [Development & Quality Assurance](#️-development--quality-assurance)
- [Contributing](#-contributing)
- [About & Community](#-about--community)
- [License](#-license)

---

## 👥 Who This Is For / Who This Is Not For

### ✅ Who This Is For

- Software Engineers preparing for system design evaluations
- Senior engineers transitioning to architect roles
- Engineers designing scalable systems in production
- Developers learning distributed systems concepts
- Anyone wanting to build practical system design skills

### ❌ Who This Is Not For

- Those seeking official course materials or certification guides
- People looking for a complete, ready-to-use curriculum (this is a personal learning journey)
- Those who want passive learning without hands-on practice
- Anyone expecting step-by-step tutorials (this focuses on principles and case studies)

---

## 🎯 What This Repository Covers

**This IS:**

- A practical system design application repository
- End-to-end case studies with complete designs
- Building blocks and architectural patterns
- Real-world failure analysis and lessons learned
- A place to practice designing systems at scale

**This is NOT:**

- A course or official curriculum
- A replacement for hands-on experience
- An evaluation cheat sheet
- A collection of ready-made solutions

### Core Topics

- Core system design principles (availability, scalability, reliability, consistency)
- Common architectural patterns (caching, CQRS, event-driven, circuit breakers)
- Building blocks of distributed systems (DNS, load balancers, databases, message queues)
- End-to-end system design case studies (URL Shortener, YouTube, Twitter, etc.)
- Diagrams (C4, sequence, flow diagrams)
- Trade-offs and failure scenarios
- AI/ML system design patterns

---

## 🗂 Repository Structure Overview

> **📋 Single Source of Truth**: The complete and up-to-date repository structure is maintained in [`docs/02_repository-structure.md`](docs/02_repository-structure.md). This file should be referenced for the authoritative structure.

### Quick Structure Overview

```text
src/
├── 01_introduction/          → Getting started with system design
├── 02_evaluation-prep/        → Preparation strategies
├── 03_foundations/           → Foundational concepts (abstractions, consistency, failures, C4 diagrams)
├── 04_principles/            → System design principles (availability, scalability, etc.)
├── 05_building-blocks/       → Core components (DNS, load balancers, databases, etc.)
├── 06_patterns/             → Architectural patterns (caching, CQRS, event-driven, etc.)
├── 07_case-studies/          → End-to-end case studies (URL Shortener, YouTube, Twitter, etc.)
├── 08_failures/              → Real-world failure analysis
├── 09_ai-ml-systems/         → AI/ML system design patterns
└── references/               → Learning resources (books, papers, tools)
```

**Progressive by application:**

1. **Introduction** → Context
2. **Foundations** → Core concepts
3. **Principles** → Design fundamentals
4. **Building Blocks** → Components
5. **Patterns** → Architectural solutions
6. **Case Studies** → Complete designs
7. **Failures** → Lessons learned

For the complete repository structure with all file names and details, see: **[`docs/02_repository-structure.md`](docs/02_repository-structure.md)**

---

## 🚀 How to Use This Repository

### Recommended Learning Path

1. **Start with Introduction** (`src/01_introduction/`)
   - Read concept files
   - Understand the learning structure
   - Review roadmap in `docs/01_road-map.md`

2. **Build Foundations** (`src/03_foundations/`)
   - Study abstractions, consistency models, failure models
   - Learn C4 diagramming
   - Understand back-of-envelope calculations

3. **Learn Principles** (`src/04_principles/`)
   - Master availability, scalability, reliability
   - Understand consistency trade-offs
   - Learn fault tolerance and security

4. **Study Building Blocks** (`src/05_building-blocks/`)
   - Learn DNS, load balancers, databases
   - Understand caching, message queues, pub-sub
   - Study search, logging, and task scheduling

5. **Explore Patterns** (`src/06_patterns/`)
   - Study caching strategies
   - Learn CQRS and event-driven architecture
   - Understand rate limiting and circuit breakers

6. **Practice with Case Studies** (`src/07_case-studies/`)
   - Start with simple systems (URL Shortener)
   - Progress to complex systems (YouTube, Twitter)
   - Study multiple case studies

7. **Learn from Failures** (`src/08_failures/`)
   - Analyze real-world incidents
   - Understand failure patterns
   - Apply lessons to your designs

---

## 🎯 Quick Start

### For Beginners

1. Read `src/01_introduction/README.md`
2. Study `src/03_foundations/` (core concepts)
3. Explore `src/04_principles/` (design fundamentals)
4. Practice with `src/07_case-studies/` (start with URL Shortener)

### For Preparation

1. Review `src/02_evaluation-prep/README.md`
2. Study `src/05_building-blocks/` (core components)
3. Practice `src/07_case-studies/` (multiple case studies)
4. Review `src/08_failures/` (learn from real incidents)

### For Experienced Engineers

1. Review `src/06_patterns/` (architectural patterns)
2. Deep dive into `src/07_case-studies/` (complex systems)
3. Study `src/09_ai-ml-systems/` (AI/ML design patterns)
4. Analyze `src/08_failures/` (failure patterns)

---

## 🔗 Related Repositories

### `architecture-reasoning-in-practice`

**Relationship:**

- **Reasoning** lives there (`architecture-reasoning-in-practice`)
- **Application** lives here (`system-design-in-practice`)

**Workflow:**

1. Learn how to think → `architecture-reasoning-in-practice/02_thinking/`
2. Learn what your role owns → `architecture-reasoning-in-practice/04_roles/`
3. Apply thinking to full designs → `system-design-in-practice/07_case-studies/`
4. Reflect and refine → back to reasoning repository

**No duplication. No mirroring.**

---

## 📋 Key Principles

### Progressive Application

- Start with foundations
- Build understanding of principles
- Learn building blocks
- Apply patterns
- Design complete systems
- Learn from failures

### Design Philosophy

- **Trade-offs over perfection**: Every design decision involves trade-offs
- **Scale-aware thinking**: Design for growth from the start
- **Failure-first mindset**: Assume components will fail
- **Observability built-in**: Design for debuggability

### Practical Focus

- Real-world case studies
- Production-ready patterns
- Failure analysis
- Scalability considerations

---

## ✅ Success Criteria

You're ready when you can:

- Design scalable systems from requirements
- Choose appropriate building blocks and patterns
- Explain trade-offs for design decisions
- Handle failures gracefully in your designs
- Design for observability and debuggability
- Apply lessons from real-world failures

---

## 🔗 Resources

### Repository Resources

- **Repository Structure**: [`docs/02_repository-structure.md`](docs/02_repository-structure.md) - Complete structure with all file names
- **Content Index**: [`src/CONTENT_INDEX.md`](src/CONTENT_INDEX.md) - Comprehensive topic index
- **Roadmap**: [`docs/01_road-map.md`](docs/01_road-map.md) - Learning path and roadmap
- **Introduction**: [`src/01_introduction/README.md`](src/01_introduction/README.md) - Getting started guide

### Learning Resources

- **References**: [`src/references/`](src/references/) - Books, papers, and tools
  - [`books.md`](src/references/books.md) - Recommended books
  - [`papers.md`](src/references/papers.md) - Research papers
  - [`tools.md`](src/references/tools.md) - Useful tools

---

## 🚧 Status

This repository is **actively evolving** as I progress through my system design learning journey.

---

## 🛠️ Development & Quality Assurance

### Documentation Quality Checks (Local)

Run Markdown lint against README and all documentation before opening a PR:

```bash
# From repo root - lint all markdown files
npx --yes markdownlint-cli2 "README.md" "docs/**/*.md" "src/**/*.md" ".github/**/*.md"
```

This uses the repository's `.markdownlint.json` configuration automatically.

### Link Validation (Lychee)

Run link checker to validate all links in documentation:

```bash
# Validate all links (recommended; matches CI behavior)
docker run --rm -w /input -v "${PWD}:/input" lycheeverse/lychee:latest --config lychee.toml --no-progress README.md docs/**/*.md src/**/*.md .github/**/*.md
```

### Pre-Commit Checklist

Before committing changes:

- [ ] Run markdownlint and fix any issues
- [ ] Run Lychee link checker (if Docker available)
- [ ] Verify all file references point to existing files
- [ ] Check that code fences have language specifications
- [ ] Ensure proper blank lines around headings and lists

---

## 🤝 Contributing

Contributions are welcome and encouraged. You may contribute in the following ways:

- Bug fixes and corrections
- Documentation improvements
- New learning content or explanations
- Additional case studies, examples, or diagrams
- Curated learning resources
- Tooling, scripts, or automation enhancements

Please review [CONTRIBUTING.md](CONTRIBUTING.md) for detailed contribution guidelines.

---

## 📞 About & Community

### [Swamy's Tech Skills Academy](https://www.linkedin.com/company/swamy-s-tech-skills-academy) & [ShyvnTech](https://www.linkedin.com/company/shyvntech)

This repository is stewarded and supported by **Swamy's Tech Skills Academy** and **ShyvnTech**. It is focused on helping developers and engineers master system design through structured learning and real-world case studies.

You can connect with the community to:

- Follow structured learning journeys and deep-dive content
- Participate in knowledge-sharing discussions
- Explore mentoring, workshops, and custom training opportunities

---

## 📝 Attribution

All content in this repository is original and transformative. While inspired by various learning sources, the explanations, examples, diagrams, and case studies are created from first principles to provide a unique learning experience.

---

## 📜 License

This project is licensed under the [MIT License](LICENSE). See the [LICENSE](LICENSE) file for details.

---

> 🎓 **System Design in Practice** — Designed and maintained by `Viswanatha Swamy P K`
> Empowering developers to master system design and excel in building scalable distributed systems.
> © 2025 Swamy's Tech Skills Academy, ShyvnTech & Srivari Software Solutions
