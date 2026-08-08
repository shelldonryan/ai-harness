# Tactical Patterns

Choose a pattern only when its decision criteria match the domain.

## Plain Function Or Module

Default to a plain function or cohesive module when behavior is stateless, rules are simple, identity is irrelevant, and no consistency boundary must be protected.

## Value Object

Use when a concept:

- Is defined by its values rather than identity
- Has validation or behavior that should travel with the value
- Should be immutable in the domain model
- Replaces ambiguous primitive parameters

Examples include money with currency, date ranges, email addresses with product-specific validity, and quantities with units.

Do not wrap every string or number.

## Entity

Use when identity and lifecycle matter independently of current attributes. Define which behaviors belong to the entity and which data changes preserve its identity.

An ORM annotation does not make an object a useful domain entity.

## Aggregate

Use an aggregate when several changes must obey invariants atomically. Define:

- Aggregate root
- Boundary members
- Protected invariants
- Transaction boundary
- How other aggregates reference it, usually by identity

Keep aggregates small. Cross-aggregate consistency is normally eventual or coordinated by an application workflow.

Do not design aggregates from object graphs or table relationships.

## Domain Service

Use for meaningful domain behavior that does not naturally belong to one entity or value object. It should speak domain language and remain free of infrastructure orchestration.

If the operation mainly coordinates repositories, APIs, transactions, or messages, it is likely an application service instead.

## Application Service Or Use Case

Use to orchestrate a user or system intent:

1. Load required state.
2. Invoke domain behavior.
3. Persist results.
4. Publish approved events or return output.

Keep business decisions in the domain model when they represent durable rules.

## Repository

Use around aggregate persistence when the domain needs collection-like access without depending on storage details. Define repositories by use-case needs, not generic CRUD completeness.

Simple query screens can use direct read models without pretending they are aggregate repositories.

## Domain Event

Use when a completed domain fact matters beyond the immediate model boundary. Name it in past tense and define payload, ownership, ordering, delivery, idempotency, and versioning when it crosses a process boundary.

An in-process event does not justify message infrastructure by itself.

## Specification Or Policy

Use when a named, reusable business rule must be evaluated or composed in several places. Keep a one-use condition local instead of introducing a pattern.

## Factory

Use when valid creation is complex, selects among variants, or must protect invariants that a simple constructor or creation function cannot express clearly.
