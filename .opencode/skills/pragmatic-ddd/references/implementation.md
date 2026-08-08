# Implementation Guidance

Implementation structure follows observed complexity and existing project conventions.

## Level 1: Cohesive Feature Module

Use for simple to moderate behavior:

```text
features/orders/
├── order.ts
├── order-service.ts
├── order-repository.ts
└── order-controller.ts
```

Keep business rules in cohesive functions or types. This level does not require formal layers.

## Level 2: Explicit Domain And Application Boundaries

Use when orchestration and business rules are both substantial:

```text
orders/
├── domain/
├── application/
├── infrastructure/
└── presentation/
```

Responsibilities:

- `domain`: language, rules, entities, value objects, and domain services
- `application`: use cases, workflows, transaction coordination, and ports
- `infrastructure`: persistence, messaging, providers, and framework adapters
- `presentation`: HTTP, UI, CLI, or message-consumer entry points

Dependencies point toward stable domain and application policies. Framework and storage concerns should not determine domain behavior.

Do not create all folders before code requires them.

## Level 3: Separate Runtime Container

Consider only when deployment or operational requirements justify a process boundary. A network boundary introduces contract versioning, retries, timeouts, partial failure, observability, security, and data-consistency costs.

Model separation alone is not sufficient justification.

## Read And Write Models

Use the domain model for decisions and invariants. Use purpose-built read models for queries when loading aggregates would complicate or degrade read behavior.

CQRS does not require separate services, databases, or event sourcing.

## Persistence

- Keep persistence mappings from leaking storage constraints into domain language where practical.
- Persist aggregates atomically within their consistency boundaries.
- Avoid repository methods that expose arbitrary storage queries to domain code.
- Use migrations and integration tests to verify actual persistence behavior.

## Cross-Boundary Communication

Define contracts around business intent and facts, not internal entity shapes. For remote interactions, specify:

- Ownership and versioning
- Authentication and authorization
- Timeouts and retries
- Idempotency
- Error and compensation behavior
- Delivery and ordering expectations
- Observability and correlation

Use an anti-corruption layer when an external or neighboring model would distort local domain language.

## Testing Strategy

| Concern | Preferred evidence |
| --- | --- |
| Value-object validation | Focused unit tests |
| Entity behavior and invariants | Unit tests through public behavior |
| Aggregate consistency | Unit tests plus persistence integration where needed |
| Application use case | Unit or integration tests with meaningful boundaries |
| Repository mapping | Integration tests against the real persistence technology |
| Cross-context contract | Contract and integration tests |
| End-to-end business outcome | Selected acceptance or end-to-end tests |

Avoid tests that only reproduce internal implementation steps. Assert business outcomes and protected rules.

## Refactoring Existing Code

1. Characterize current behavior with tests.
2. Identify one rule or ownership problem.
3. Move that behavior to a clearer boundary.
4. Keep adapters at existing interfaces when possible.
5. Verify before continuing.
6. Avoid a complete architecture rewrite unless separately justified and approved.
