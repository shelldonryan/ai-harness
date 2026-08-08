# Project Workflows

## New Project

### 1. Discover

Load `grill-me` and establish:

- Product problem and intended users
- Desired outcomes and success criteria
- Scope and explicit non-goals
- Important workflows
- Constraints and accepted risks
- Known domain language and rules

Ask one question at a time. Do not choose architecture during product discovery unless a genuine constraint requires it.

### 2. Propose The Baseline

Recommend Lean, Standard, or Extended documentation. Explain each proposed artifact and obtain approval for anything beyond the default baseline.

For Standard documentation, create:

- `PROJECT.md`: concise context and navigation
- `PRD.md`: product and user requirements only
- `STATE.md`: current decisions, unknowns, risks, and next step
- `ARCHITECTURE.md`: initially a placeholder only if architecture planning is approved next

Do not create empty directories or documents solely to match a tree.

### 3. Discover The Domain

Identify capabilities, ubiquitous language, key rules, and likely boundaries. Apply pragmatic DDD: introduce formal entities, value objects, aggregates, or layers only when real domain complexity supports them.

### 4. Plan Architecture

Derive quality attributes from requirements before proposing structure. Compare suitable options such as a simple application, modular monolith, or services. Evaluate operational cost explicitly.

Use C4 to communicate the approved result:

- System Context for people and external systems
- Containers for separately running applications, processes, and stores
- Components only for significant internal structures that benefit from explanation

Record consequential decisions as ADRs.

### 5. Build The Roadmap And Backlog

Translate product outcomes into ordered, end-to-end features. Keep the roadmap outcome-oriented and the product backlog actionable. Do not estimate or schedule work until enough scope is understood.

## Existing Project

### 1. Map Before Judging

Inspect code, dependencies, runtime configuration, tests, deployment, and documentation. Describe observed patterns separately from recommendations.

Capture only useful views:

- Stack and runtime containers
- Repository structure and module boundaries
- Architecture and communication paths
- Coding and testing conventions
- External integrations
- Risks, debt, and fragile areas

Consolidate these into `ARCHITECTURE.md` unless their size or lifecycle justifies separate codebase documents.

### 2. Reconstruct Intent

Use `grill-me` to distinguish current behavior from intended product direction. Do not assume existing implementation is the desired architecture.

### 3. Establish A Safe Baseline

Record current verification commands, known failures, active risks, and branch conventions before planning new work.

### 4. Continue Through Feature Workflow

Once project context is sufficient, plan changes through the same feature workflow used for new projects.
