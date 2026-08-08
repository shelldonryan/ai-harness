---
name: container-planning
description: Runtime-specific technical planning for approved C4 containers such as web apps, mobile apps, APIs, workers, and data stores. Use after C4 Container decisions, when initializing a container project, defining a container technical baseline, planning cross-container features, or reviewing container responsibilities, contracts, quality attributes, testing, deployment, and operations. Do not use before product and architecture decisions, duplicate feature requirements, or create one document per concern automatically.
license: MIT
compatibility: OpenCode
metadata:
  version: "0.1.0"
---

# Container Planning

Translate an approved C4 Container view into the smallest useful technical baseline for each runtime. Adapt planning to the container type without creating a separate delivery methodology.

## Preconditions

Before detailed container planning, establish:

- Approved product or feature requirements
- Relevant quality attributes
- C4 system and container boundaries
- Container responsibility and relationships
- Consequential architecture decisions

If these are unresolved, return to TLC product, DDD, or C4 planning. Do not use container documents to make hidden system-level decisions.

## Concepts

A C4 container is a separately running application, process, or data store. It may be:

- A project inside a monorepo
- A separately deployed repository
- A web or mobile application
- An API or background process
- A database, object store, or similar store

Repository, bounded-context, team, and deployment boundaries may align with a container, but only by approved decision.

## Process

### 1. Load Shared Context

Read the PRD or feature spec, architecture drivers, C4 Container view, ADRs, domain ownership, existing code, contracts, deployment, and test conventions. Do not repeat shared requirements in the container plan; link to their IDs.

### 2. Confirm The Container Contract

Establish:

- Stable C4 ID and name
- Responsibility and non-responsibilities
- Users and consuming containers
- Inputs, outputs, and owned data
- Quality attributes that apply specifically here
- Runtime and lifecycle
- Upstream and downstream dependencies

Resolve overlapping responsibilities before discussing frameworks.

### 3. Select A Profile

Use [profiles.md](references/profiles.md) for relevant questions. A container may combine profiles, but include only concerns that affect decisions or verification.

### 4. Choose Artifact Depth

- Keep a short baseline in `.specs/ARCHITECTURE.md` for simple containers.
- Create `.specs/containers/<container-id>.md` when the container supports several features, has an independent lifecycle, or needs a reusable technical contract.
- Add `features/<feature>/plans/<container-id>.md` only for complex feature-specific implementation details.

Do not create separate security, testing, data, deployment, or observability files by default. Begin as sections and split only with approval when independent maintenance is justified.

### 5. Plan Through Decisions

Use [template.md](references/template.md). Explain significant tradeoffs and use `grill-me` coaching gates. Verify current framework behavior through project documentation and Context7 after technology choices become relevant.

Record cross-container or hard-to-reverse decisions as ADRs. Keep local, reversible implementation choices in the container or feature design.

### 6. Integrate Features

One feature specification remains authoritative across containers. The container plan references requirement IDs and defines only its local responsibilities, interfaces, failure handling, and verification.

For cross-container changes, confirm:

- Contract ownership and versioning
- Authentication and authorization boundaries
- Timeout, retry, idempotency, and partial-failure behavior
- Data ownership and consistency
- Observability and correlation
- Integration and contract tests

### 7. Validate

Check plan consistency with the C4 inventory, ADRs, domain ownership, feature design, repository structure, and deployment evidence. Do not present a recommendation as current architecture in brownfield work.

## Container Completion Check

- Responsibility and non-responsibilities are unambiguous.
- Every interface has an owner and consumers.
- Data ownership and mutation authority are explicit.
- Relevant quality attributes have design and evidence.
- Failure behavior is planned at external boundaries.
- Testing covers local behavior and contracts.
- Deployment and operational needs are sufficient for this runtime.
- Feature plans link to requirements without duplicating them.
- The artifact set is no larger than its maintenance value.

## Anti-Patterns

- Selecting a framework before container responsibilities are understood
- Copying the entire PRD into every project
- Creating frontend, API, and database phases instead of end-to-end features
- Giving multiple containers authority over the same data without a consistency decision
- Ignoring mobile lifecycle, API compatibility, or worker delivery semantics
- Treating a database as an implementation detail with no owner or recovery plan
- Splitting every concern into its own document
- Assuming each C4 container requires a separate repository or microservice
