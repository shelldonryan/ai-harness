---
name: pragmatic-ddd
description: Pragmatic domain-driven design for discovering domain language, business rules, bounded contexts, entities, value objects, aggregates, events, and implementation boundaries without unnecessary layers. Use during TLC Design for business-rich features, unclear domain ownership, complex invariants, cross-domain workflows, modular monolith or microservice decisions, and domain model refactoring. Do not use for simple CRUD, presentation-only changes, infrastructure configuration, or problems without meaningful domain behavior.
license: MIT
compatibility: OpenCode
metadata:
  version: "0.1.0"
---

# Pragmatic DDD

Model business complexity explicitly while keeping simple software simple. DDD is a reasoning tool, not a required folder structure.

## Core Rule

Every pattern must earn its cost:

```text
Domain language -> Rules and invariants -> Ownership boundaries -> Smallest useful model -> Implementation
```

Do not begin with entities, repositories, layers, or microservices. Begin with the behavior the product must protect.

## When To Load This Skill

Load it when at least one condition applies:

- Business terms are ambiguous or mean different things in different areas.
- Important rules must remain true across operations.
- Responsibility or data ownership is unclear.
- A workflow crosses capabilities or external systems.
- The design must choose module, bounded-context, or service boundaries.
- Domain logic is scattered through controllers, UI handlers, or persistence code.
- A feature changes meaningful domain behavior rather than only storing and retrieving data.

Skip formal domain modeling for straightforward CRUD, static content, styling, build configuration, thin integrations, or simple data transformations. State briefly why DDD is unnecessary and return to the invoking workflow.

## Operating Modes

- **Feature design**: model only concepts and rules needed by the approved feature.
- **Domain discovery**: identify language, capabilities, and candidate bounded contexts for a product or major area.
- **Boundary review**: evaluate modules, containers, data ownership, or service boundaries.
- **Refactoring**: move existing domain behavior toward clearer ownership without rewriting unrelated code.

## Process

### 1. Load Evidence

Read the approved product or feature requirements, existing glossary and architecture, affected code, tests, API contracts, and data model. Treat code as evidence of current behavior, not automatically as the desired domain model.

### 2. Discover Language

Extract business terms used by users, requirements, and existing code. Identify synonyms, overloaded terms, and technical words that hide business meaning.

Load `grill-me` when meaning, ownership, or business behavior remains ambiguous. Ask one question at a time and return approved definitions to the current artifact.

### 3. Identify Capabilities And Rules

Describe what the business does before deciding how software is divided. Capture rules in testable language:

```text
WHEN <business situation>
THEN <required outcome>
BECAUSE <business reason>
```

Mark invariants: rules that must always be true within a consistency boundary.

### 4. Establish Ownership

For each concept and rule, identify which domain area owns its meaning, decisions, and authoritative data. Use [strategic-design.md](references/strategic-design.md) when context boundaries or cross-domain relationships matter.

Do not equate bounded contexts with C4 containers or repositories:

- A bounded context is a model and language boundary.
- A C4 container is a separately running application, process, or data store.
- A repository is a source-control boundary.

They may align, but only after explicit architectural reasoning.

### 5. Select The Smallest Useful Model

Use [tactical-patterns.md](references/tactical-patterns.md) to choose patterns. Start with plain functions and cohesive modules. Introduce value objects, entities, aggregates, domain services, repositories, or events only when their decision criteria are satisfied.

### 6. Choose Implementation Depth

Use [implementation.md](references/implementation.md):

- Keep simple modules feature-oriented.
- Separate application orchestration from domain rules when both are substantial.
- Add infrastructure boundaries where external concerns would otherwise distort the domain.
- Escalate to explicit layered DDD only for sustained domain complexity.

### 7. Trace And Verify

Link domain rules to requirement IDs, owning modules, and tests. Each invariant requires evidence at the lowest reliable test level. Integration tests cover persistence, messaging, and cross-boundary contracts.

## Artifact Policy

Add domain reasoning to an existing TLC artifact whenever it remains clear:

- Product-level language and capabilities belong in `PROJECT.md`, `PRD.md`, or a consolidated `DOMAIN.md` section.
- Feature-specific rules and models belong in `features/<name>/spec.md` and `design.md`.
- Cross-system boundary decisions belong in `ARCHITECTURE.md` or an ADR.

Create separate `GLOSSARY.md`, `DOMAIN.md`, context maps, or model documents only when they are reused by several features or have an independent maintenance reason. Explain the value and obtain approval before adding them.

## Design Output

Include only relevant sections:

```markdown
## Domain Language

| Term | Meaning | Owner | Avoid |
| --- | --- | --- | --- |

## Capabilities And Boundaries

## Rules And Invariants

| Rule ID | Rule | Owner | Requirement | Evidence |
| --- | --- | --- | --- | --- |

## Domain Model

| Concept | Pattern | Identity or value | Responsibility | Rationale |
| --- | --- | --- | --- | --- |

## Cross-Boundary Interactions

## Implementation Shape

## Risks And Open Questions
```

Do not add empty sections.

## Decision Gates

Ask for user approval when the model introduces or changes:

- A bounded context or ownership boundary
- An aggregate or transactional consistency boundary
- Authoritative data ownership
- An externally visible domain event or contract
- A layered architecture not already used by the project
- A module split that affects several features
- A service or microservice boundary

Explain tradeoffs before asking. Use guided coaching so the user reasons about consequential choices.

## Completion Check

Before returning to TLC:

- Terms are defined where ambiguity mattered.
- Every modeled concept supports an approved behavior or rule.
- Important rules have clear owners.
- Invariants have consistency boundaries and test strategies.
- Cross-boundary interactions state contracts and failure behavior.
- Architecture is no more complex than the domain requires.
- Domain decisions trace to requirements and verification.
- Unresolved modeling risks are explicit.

## Anti-Patterns

- Creating one aggregate per database table
- Treating DTOs or ORM records as the domain model by default
- Adding repository interfaces around every query
- Using domain services as a home for unrelated logic
- Emitting events for every state change
- Sharing one model across contexts with different meanings
- Choosing microservices to demonstrate DDD
- Creating domain, application, and infrastructure folders with no behavioral separation
- Rewriting working simple code solely to match a diagram
