---
name: c4-architecture
description: Adaptive C4 software architecture planning and documentation for System Context, Container, selected Component, dynamic, and deployment views. Use during TLC Design for new-system architecture, brownfield mapping, container or integration decisions, cross-container features, architecture reviews, and major structural changes. Do not use C4 as a product workflow, create every diagram level automatically, or equate containers with Docker, repositories, bounded contexts, or features.
license: CC-BY-4.0
compatibility: OpenCode
metadata:
  author: "C4 model by Simon Brown; harness adaptation"
  version: "0.1.0"
  source: "https://c4model.com"
---

# Adaptive C4 Architecture

Use C4 to reason about and communicate approved software structure at useful zoom levels. C4 documents architecture; it does not replace product discovery, domain modeling, feature specifications, or architecture decisions.

## Core Sequence

```text
Product and user requirements
  -> Domain and quality constraints
  -> Architecture options and decisions
  -> C4 views of the approved structure
  -> Feature and container implementation plans
```

Do not draw a preferred architecture first and rationalize it afterward.

## Concepts That Must Remain Distinct

| Concept | Meaning |
| --- | --- |
| Software system | A system that delivers value to users or other systems |
| Container | A separately running application, process, or data store in C4 terminology |
| Component | A significant structural responsibility inside one container |
| Feature | End-to-end behavior or outcome that may cross containers and components |
| Bounded context | A domain model and language boundary |
| Microservice | An independently deployable service, normally represented as a container |
| Deployment node | Infrastructure where container instances run |
| Repository | A source-control boundary |

These boundaries may align after an explicit decision, but never assume that they do.

## When To Load This Skill

- A new product needs solution architecture after requirements and domain discovery.
- An existing system needs architecture reconstruction or review.
- A feature crosses applications, processes, stores, or external systems.
- The design changes container responsibilities, communication, or data ownership.
- The team must compare monolith, modular monolith, or service options.
- A dynamic interaction or deployment topology is difficult to explain in prose.

Do not load it for local implementation details that do not change or clarify architectural structure.

## Process

### 1. Establish Scope And Audience

Identify the software system or container in scope, the decision the view must support, and who will use it. A diagram without a decision or communication purpose is not required.

### 2. Load Evidence

Read approved product requirements, quality attributes, domain boundaries, ADRs, existing architecture, code, deployment configuration, and integrations as relevant. For brownfield systems, distinguish observed structure from recommendations.

Load `grill-me` for unresolved architecture constraints or tradeoffs. Load `pragmatic-ddd` when model boundaries, business ownership, or invariants affect structure.

### 3. Build A Textual Model First

Before drawing, inventory elements and relationships using stable IDs:

- Name
- C4 type
- Responsibility
- Technology when appropriate to the level
- Ownership or system boundary
- Relationships with direction, intent, and protocol when useful

Resolve unknowns and contradictory responsibilities before creating a diagram.

### 4. Select Views

Use [views.md](references/views.md):

- System Context is the normal starting point for a meaningful software system.
- Container is the normal technical architecture view.
- Component is optional and scoped to one container.
- Dynamic is optional for important runtime interactions.
- Deployment is optional when environment topology affects decisions or operations.
- Code-level diagrams are exceptional and preferably generated from code.

Explain why each additional view is useful and obtain approval when it adds a new artifact beyond the established documentation baseline.

### 5. Decide Before Documenting

When the architecture is not established, compare options against requirements and quality attributes. Use an ADR for consequential choices. C4 views communicate the resulting decision; they are not substitutes for rationale.

Do not decide on microservices before evaluating independent deployment, scaling, ownership, isolation, security, data, operational maturity, and cost.

### 6. Create Or Update Views

Use [notation.md](references/notation.md). Prefer a textual inventory plus a GitHub-renderable Mermaid diagram in Markdown. Keep notation consistent and include enough labels that readers do not need to infer meaning from arrows or colors.

### 7. Review And Trace

Use [review.md](references/review.md). Trace important containers and interactions to product needs, domain ownership, quality attributes, or ADRs. Update feature designs and container plans by linking to architecture rather than copying it.

Load `container-planning` after Container responsibilities and relationships are approved when a runtime-specific technical baseline is needed.

## Artifact Policy

For Standard documentation, keep architecture consolidated when clear:

```text
.specs/ARCHITECTURE.md
```

Suggested sections:

```markdown
# Architecture

## Drivers And Quality Attributes
## System Context
## Containers
## Important Runtime Scenarios
## Deployment
## Decisions
## Risks And Open Questions
```

Include only useful sections.

Use separate files for Extended documentation only when views have independent size, audience, or maintenance needs:

```text
.specs/architecture/
├── SYSTEM_CONTEXT.md
├── CONTAINERS.md
├── dynamics/
├── deployment/
└── decisions/
```

Component views normally belong in the owning container's architecture document. Do not create a separate architecture tree merely to mirror C4 levels.

## Change Rules

An architecture change must state:

- Driver and affected requirements
- Current structure and observed problem
- Considered options
- Approved decision or unresolved question
- C4 elements and relationships changed
- Migration and compatibility impact
- Verification or operational evidence
- Documentation and ADR updates

If a feature does not change the architecture, link to existing C4 elements from its design instead of redrawing the system.

## Completion Check

- Scope, view type, and intended audience are explicit.
- Every element has a clear name, type, and responsibility.
- System and container boundaries are visible.
- Relationships are directional and labeled with intent.
- Technologies appear only at appropriate levels.
- Features are not misrepresented as C4 components.
- Domain boundaries and deployment boundaries are not assumed to be identical.
- Decisions have rationale outside the diagram when needed.
- The chosen views answer a real planning or communication question.
- Diagrams and textual inventory agree.

## Anti-Patterns

- Treating a C4 container as a Docker-only concept
- Creating one container per source directory
- Drawing one component per class, endpoint, or UI widget
- Calling every feature a component
- Mapping every bounded context to a microservice automatically
- Mixing production nodes and logical containers in one unlabeled view
- Adding databases or message brokers without ownership and relationship labels
- Using arrows without direction or purpose
- Creating all four C4 levels as mandatory artifacts
- Letting diagrams become a second, contradictory source of requirements

## Attribution

This skill applies the C4 model created by Simon Brown using the official definitions at <https://c4model.com>. See [NOTICE.md](NOTICE.md).
