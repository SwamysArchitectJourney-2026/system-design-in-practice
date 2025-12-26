# System Design in Practice

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Status](https://img.shields.io/badge/status-learning--journey-green.svg)
![System Design](https://img.shields.io/badge/System-Design-orange.svg)
![Maintainer](https://img.shields.io/badge/maintainer-Viswanatha%20Swamy%20P%20K-blue)

> **⚠️ IMPORTANT: This is NOT an official course or syllabus. This is Swamy's personal learning journey and study materials.**
>
> This repository documents **my personal learning journey in system design** — the concepts I'm studying, the mental models I'm building, and how my thinking evolves over time.
>
> It is **not a course**, not a certification guide, and not a step-by-step tutorial. The structure exists to support *my thinking*, not to prescribe how others must learn.
>
> This repository will evolve as my understanding deepens.

## 🚧 Status

This repository is **actively evolving** as I progress through my system design learning journey.

---

## 📌 Disclaimer

This is **Swamy's personal learning** repository, not official course material or a structured curriculum.

---

## What This Repository Covers

- Core system design principles
- Common architectural patterns
- Building blocks of distributed systems
- End-to-end system design case studies
- Diagrams (C4, sequence, flow)
- Trade-offs and failure scenarios

## Who Might Find This Useful

While this repository documents *my* learning journey, others might find it useful if they are:

- Software Engineers preparing for system design interviews
- Senior engineers transitioning to architect roles
- Engineers designing scalable systems in production

**Note**: This is not a curriculum designed for others—it's my personal learning structure that happens to be publicly accessible.

## Philosophy

Design is about **trade-offs**, not perfect solutions.

---

## Repository Structure

> **📋 Single Source of Truth**: The complete and up-to-date repository structure is maintained in [`docs/02_repository-structure.md`](docs/02_repository-structure.md). This file contains the authoritative structure with all file names, conventions, and organization details.

**For the complete repository structure**, see: **[docs/02_repository-structure.md](docs/02_repository-structure.md)**

**Quick Overview**:

- `src/01_introduction/` - Getting started with system design
- `src/02_interview-prep/` - Interview preparation strategies
- `src/03_foundations/` - Foundational concepts (abstractions, consistency, failures, C4 diagrams)
- `src/04_principles/` - System design principles (availability, scalability, etc.)
- `src/05_building-blocks/` - Core building blocks (DNS, load balancers, databases, etc.)
- `src/06_patterns/` - Architectural patterns (caching, rate limiting, CQRS, etc.)
- `src/07_case-studies/` - End-to-end case studies (URL Shortener, YouTube, Twitter, etc.)
- `src/08_failures/` - Real-world failure analysis
- `src/references/` - Learning resources (books, papers, tools)

---

## How I Navigate This Repository

When I'm learning a new area, I typically:

1. Review the [01_road-map.md](docs/01_road-map.md) to understand the learning path I'm following
2. Check [src/CONTENT_INDEX.md](src/CONTENT_INDEX.md) for a complete topic index
3. Start with **src/01_introduction/** for an overview
4. Review **src/02_interview-prep/** when preparing for interviews
5. Study **src/03_foundations/** for fundamental concepts
6. Explore **src/04_principles/** for system design principles
7. Learn **src/05_building-blocks/** to understand core components
8. Study **src/07_case-studies/** for end-to-end system designs
9. Review **src/08_failures/** to learn from real-world incidents

**For others reading along**: Feel free to explore in any order that makes sense for your own learning journey.

## Why This Learning Journey Is Public

I believe learning becomes clearer when ideas are written down, structured, and revisited.
Making this repository public helps me:

- Hold myself accountable
- Refine my thinking through clarity
- Share mental models with others on a similar path

Others are welcome to read along, but this repository primarily reflects *my* journey.

---

## Attribution & Learning Sources

This repository represents a learning journey in system design. The content has been created through study and synthesis of knowledge from:

- **Books**: Various system design and distributed systems textbooks and reference materials
- **Video Courses**: Online courses and educational video content on system design
- **Web Resources**: Articles, documentation, and technical blogs from the software engineering community
- **Real-World Case Studies**: Analysis of publicly available system architectures and design patterns

**Note**: All content in this repository is original and transformative. While inspired by various learning sources, the explanations, examples, diagrams, and case studies are created from first principles to provide a unique learning experience.

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

We welcome contributions! Whether it's:

- 🐛 Bug fixes
- 📝 Documentation improvements
- 💡 New learning content
- 🎯 Additional case studies or examples
- 📚 Additional learning resources
- 🔧 Tooling and automation improvements

Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## 📞 About & Get In Touch

### Swamy's Tech Skills Academy 2026

Ready to master System Design? Let's begin your transformation! 🚀

Ready to take your system design skills to the next level? Join our learning community!

- 🌐 Visit our website for more courses
- 📧 Contact us for custom training programs
- 🏆 Get certified in System Design
- 👥 Join our learning community

Happy Learning! 🎓✨

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
