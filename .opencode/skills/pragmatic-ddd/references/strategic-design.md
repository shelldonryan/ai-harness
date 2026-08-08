# Strategic Design

Use strategic design to clarify language, capabilities, ownership, and relationships before selecting deployment boundaries.

## Domain And Subdomains

The domain is the problem area the product addresses. Divide it by business capability, not technical layer.

Classify subdomains only when the distinction influences investment or design:

- **Core**: differentiating capability that deserves focused modeling.
- **Supporting**: necessary business-specific capability that is not differentiating.
- **Generic**: common capability suitable for a standard product or simple implementation.

Do not label every module as a subdomain.

## Bounded Contexts

A bounded context defines where a model and its language are internally consistent. Consider one when:

- The same word has different valid meanings.
- Different rules or lifecycles apply to similar data.
- A capability needs independent ownership or evolution.
- Coupling forces unrelated features to change together.
- External contracts require translation.

Do not create a bounded context merely because a directory, team, or database already exists.

## Boundary Questions

For a candidate context, establish:

- Purpose and responsibilities
- Terms it owns
- Decisions and invariants it owns
- Authoritative data it owns
- Inputs, outputs, and published contracts
- Upstream and downstream relationships
- Failure and consistency expectations

If these cannot be stated clearly, the boundary may be premature.

## Context Relationships

Use only the relationship vocabulary that clarifies a real dependency:

- **Customer/Supplier**: downstream needs influence an upstream contract.
- **Conformist**: downstream intentionally adopts the upstream model.
- **Anti-Corruption Layer**: downstream translates an external model to protect its own language.
- **Open Host Service**: upstream offers a stable protocol for several consumers.
- **Published Language**: parties share a documented interchange model.
- **Separate Ways**: integration cost exceeds its value.

Prefer a short prose explanation over a formal context map when there are few relationships.

## Boundaries And Deployment

Model boundaries do not force network boundaries. Start by considering a modular monolith when:

- One person or small team owns the system.
- Independent deployment is not required.
- Operational simplicity is valuable.
- Domain boundaries are still evolving.

Consider separate services only when independent deployment, scaling, isolation, ownership, regulatory, or technology needs outweigh distributed-system cost.

Record a service split as an ADR and update the C4 Container view after approval.
