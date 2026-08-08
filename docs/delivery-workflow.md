# Delivery Workflow

This document defines the planning and delivery model used by the harness. TLC Spec-Driven is the central lifecycle; specialized skills contribute methods without creating competing workflows.

## Core Model

```text
Discover -> Define -> Architect -> Plan -> Execute -> Validate -> Learn
```

The lifecycle is adaptive. The orchestrator classifies the situation and loads only the capabilities that provide value:

- Guided discovery for ambiguity, product definition, and important decisions
- Product requirements for user needs and expected outcomes
- Pragmatic DDD for domain language, boundaries, rules, and implementation structure
- C4 for architecture reasoning and communication
- UX and design-system planning for user-facing applications
- Container profiles for web, mobile, API, worker, and other runtime-specific concerns
- Scrum for backlog, sprint planning, review, and retrospective
- Gitflow for integration and releases

For user-facing work, UX planning proceeds from journeys and flows to states, visual systems, prototypes, and evaluation. External design tools receive approved handoff briefs and do not become sources of product requirements.

## Entry Paths

| Situation | Typical path |
| --- | --- |
| New product | Discovery -> PRD -> Domain -> C4 -> Roadmap |
| Existing project | Codebase mapping -> C4 reconstruction -> Concerns |
| New feature | Specify -> UX/DDD as needed -> Design -> Tasks -> Execute |
| Architecture change | Requirements -> Options -> ADR -> C4 update |
| New container | Container profile -> Contracts -> Testing -> Deployment |
| Quick fix | Describe -> Implement -> Verify |
| Sprint planning | Backlog -> Sprint goal -> Selected work |
| Release | Validate -> Release branch -> Review |

All entry paths return to the shared TLC lifecycle. They are routes through one system, not independent methodologies.

## Planning Levels

### Product

Defines users, problems, product requirements, scope, goals, and success criteria. It deliberately excludes competitors, monetization, market positioning, architecture, and implementation. Detailed feature behavior remains in feature specifications.

### System

Defines system boundaries, people, external systems, quality attributes, domain boundaries, integrations, and major architecture decisions.

### Container

Defines the technical baseline for a separately running application or data store. Container planning adapts to the runtime type:

- Web: information architecture, design system, accessibility, state, and browser testing
- Mobile: navigation, offline behavior, platform integration, design system, and device testing
- API: contracts, authorization, data, errors, observability, and integration testing
- Worker: queues, retries, idempotency, observability, and failure recovery

Start with one consolidated container document. Split it only when sections become independently complex or require a separate lifecycle.

Container profiles adapt the baseline to web, mobile, API, worker, data-store, or integration concerns. Shared product requirements remain central and are referenced by ID rather than copied into each project.

### Feature

Defines one end-to-end user or business outcome. A single feature specification remains the source of behavioral truth even when the feature crosses several containers.

For a cross-container feature, add container-specific implementation plans under the feature:

```text
.specs/features/checkout/
├── spec.md
├── context.md
├── ux.md
├── design.md
├── plans/
│   ├── web.md
│   ├── mobile.md
│   └── api.md
└── tasks.md
```

Only affected containers receive plans.

## C4 Usage

C4 is the architecture zoom model, not the complete delivery workflow:

1. System Context communicates people, the software system, and external systems.
2. Containers communicate running applications, processes, and data stores.
3. Components communicate significant structural responsibilities inside a container.
4. Code-level diagrams are created only when unusually complex logic justifies their maintenance.

Features are behavioral slices and can cross multiple containers and components. Do not create a separate feature specification for every C4 element.

System Context and Container views are the normal architecture baseline when they answer a real communication need. Component, Dynamic, Deployment, Landscape, and Code views are optional and created only for a specific decision, audience, or maintenance purpose.

## Architecture Decisions

Monolith, modular monolith, and microservices are evaluated during solution planning after product requirements, domain discovery, and quality attributes are understood.

The decision considers:

- Independent deployment needs
- Scaling characteristics
- Team and ownership boundaries
- Reliability and fault isolation
- Security, regulation, and data boundaries
- Technology constraints
- Operational maturity and cost

Record consequential choices as architecture decision records. C4 diagrams communicate the resulting structure; they do not determine it.

## Pragmatic DDD

Use domain language, boundaries, value objects, entities, and invariants where they clarify real business complexity. Keep straightforward CRUD straightforward.

Promote a domain area to layered DDD only when its complexity justifies explicit domain, application, infrastructure, and presentation boundaries.

## Adaptive Documentation

The default is Standard adaptive documentation. An artifact is created only when it:

1. Answers a unique question.
2. Records a meaningful decision.
3. Is consumed by a later phase.
4. Has a clear maintenance reason.
5. Cannot remain clear as a section in an existing document.

The agent explains why an additional artifact is useful and asks for approval before creating it.

### Lean

Use for experiments and small projects:

```text
.specs/
├── PROJECT.md
├── STATE.md
└── features/<feature>/spec.md
```

### Standard

Use for most projects:

```text
.specs/
├── PROJECT.md
├── PRD.md
├── ARCHITECTURE.md
├── STATE.md
├── decisions/
├── features/
└── scrum/
```

`ARCHITECTURE.md` may contain both C4 System Context and Container views.

### Extended

Use only for complex systems. Split project, architecture, container, feature, decision, and Scrum concerns into separate directories and documents.

## Guided Coaching

Planning is a learning activity, not a document-generation shortcut. During consequential planning decisions, the agent:

1. Explains the decision and why it matters.
2. Presents relevant constraints and tradeoffs.
3. Asks one focused question at a time.
4. Lets the user reason or choose before recommending an answer.
5. Reviews the reasoning and teaches transferable principles.
6. Records the approved decision and its rationale.

The agent may answer routine factual questions directly. Coaching gates are for decisions where the reasoning provides learning value.

## Scrum And Gitflow

Scrum is stored in Markdown and includes a product backlog plus one current sprint containing its goal, selected work, review, and retrospective. Closed sprints are archived as one file each. Estimation, velocity, daily stand-ups, and separate ceremony documents are not required by default.

TLC owns feature requirements, design, implementation tasks, and validation. Scrum owns outcome priority, sprint focus, review, and process improvement; it does not duplicate TLC task status.

For repositories owned by the user, Gitflow uses `main`, `develop`, `feature/*`, `release/*`, and `hotfix/*`. Feature tasks are verified individually, but the agent asks before each commit.

## Traceability

Planning maintains a navigable chain without duplicating content:

```text
Product objective
  -> Feature requirement
  -> Domain rule
  -> C4 container/component
  -> Implementation task
  -> Test or validation evidence
```

Each downstream artifact links to its source rather than copying the source text.
