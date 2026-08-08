---
name: ux-planning
description: Guided UX, information architecture, user-flow, screen-state, design-system, accessibility, responsive-design, prototype, and design-review planning for web and mobile products. Use during TLC Specify or Design for user-facing features, new interfaces, navigation changes, design systems, wireframes, coded prototypes, Kombai or OpenUI handoffs, and usability reviews. Do not start with visual styling before requirements and flows, invent user research, or create separate UX artifacts when a feature design section is sufficient.
license: MIT
compatibility: OpenCode
metadata:
  version: "0.1.0"
---

# UX Planning And Prototyping

Turn approved user outcomes into understandable, accessible interactions before committing to production implementation. Use prototypes to answer questions, not to disguise unresolved requirements with visual polish.

## Core Sequence

```text
Requirements -> Journey -> Information architecture -> Task flow -> States ->
Low-fidelity structure -> Visual system -> Prototype -> Evaluation -> Handoff
```

Move backward when a later step exposes an unresolved product or behavior decision.

## Preconditions

Before visual design, establish:

- Approved users, outcomes, and feature scope
- Primary task or journey
- Acceptance criteria and important failure behavior
- Relevant web or mobile container constraints
- Existing product and design-system conventions

If these are missing, return to `product-planning`, TLC Specify, or `container-planning`. Do not use a prototype to make hidden product decisions.

## Evidence Rules

- Distinguish observed user evidence from assumptions.
- Call unsupported user models assumptions or proto-personas, not validated personas.
- Do not claim usability from aesthetic preference.
- Record what a prototype is intended to learn and what it cannot validate.
- Treat accessibility conformance as requiring both appropriate automated checks and human evaluation.

## Operating Modes

- **Flow planning:** journeys, information architecture, task flows, screens, and states
- **Design-system planning:** principles, tokens, components, interaction contracts, and governance
- **Prototype planning/building:** low-, medium-, or high-fidelity learning artifact
- **External handoff:** tool-neutral brief for Kombai, `wandb/openui`, Figma, or another approved tool
- **Design review:** usability, consistency, accessibility, responsiveness, and requirement traceability

## Process

### 1. Inspect Existing Context

Read the PRD, feature specification, approved context decisions, container baseline, current interface, design-system source, accessibility policy, and relevant tests. Preserve established visual language and interaction patterns unless redesign is approved.

Load `grill-me` for unresolved user behavior or visual tradeoffs. Ask one question at a time and let the user reason before recommendations when the decision has learning value.

### 2. Select Artifact Depth

- **Quick:** no new UX artifact for a small change that follows an established design system.
- **Standard:** add relevant UX sections to `features/<feature>/ux.md` or `design.md`.
- **Extended:** create a shared UX or design-system document only when several features consume it.
- **External handoff:** create a separate prototype brief only when another tool or collaborator needs a stable input contract.

Explain the value and obtain approval before adding an artifact beyond the current TLC baseline.

### 3. Model The Experience

Use [ux-artifacts.md](references/ux-artifacts.md). Define:

- User intent, trigger, and desired outcome
- Information architecture and navigation implications
- Happy path, alternate paths, cancellation, and recovery
- Screen or surface inventory
- Loading, empty, error, partial, offline, permission, unauthorized, success, and destructive-action states where relevant
- Content and feedback behavior
- Responsive or adaptive changes
- Accessibility requirements and input modalities

Keep behavior independent of a visual tool until interaction decisions are approved.

### 4. Establish Visual Direction

For an existing product, reuse its system. For a new product, make the visual direction explicit before generating screens:

- Product character and design principles
- Typography role and hierarchy
- Color purpose and semantic use
- Density, spacing, shape, depth, and imagery
- Motion purpose and reduced-motion behavior
- Desired references and patterns to avoid

Avoid interchangeable AI defaults, generic dashboard grids, gratuitous gradients, and decoration without product rationale.

### 5. Plan The Design System

Load [design-system.md](references/design-system.md) when decisions will be reused. Define semantic tokens and component behavior from approved flows rather than designing a complete abstract library upfront.

For implemented systems, code tokens and tested components become the executable source of truth. Documentation records principles, contracts, status, and governance instead of duplicating every value.

### 6. Select And Build A Prototype

Load [prototyping.md](references/prototyping.md). Choose the lowest fidelity that can answer the current question. State whether the output is disposable learning code or intended to evolve into production.

External tools are optional and never installed, authenticated, or given repository access without approval. A tool receives an approved handoff brief; it does not invent product requirements.

### 7. Evaluate

Use [review.md](references/review.md). Trace findings to requirement and state IDs. Separate:

- Verified defects
- Usability hypotheses needing user evidence
- Accessibility failures
- Design-system inconsistencies
- Technical implementation concerns
- Personal preferences

Revise the relevant source artifact, not only the prototype.

### 8. Handoff To TLC

Return:

- Approved flows and state behavior
- Design-system additions or reuse
- Prototype location and fidelity
- Evaluation evidence and unresolved risks
- Affected requirements and containers
- Production constraints and acceptance checks

TLC then creates implementation design and tasks. Do not copy the entire UX artifact into task descriptions.

## Decision Gates

Ask for approval before:

- Changing an established navigation or design-system pattern
- Selecting a high-fidelity visual direction
- Adding a new shared component or token category
- Choosing prototype technology intended to become production code
- Installing or authenticating an external design/prototype tool
- Sending code, designs, screenshots, or product context to an external service
- Treating prototype code as production implementation

## Completion Check

- The planned interaction traces to approved user outcomes.
- Primary, alternate, error, and recovery paths are defined where relevant.
- Screen states do not rely on visual appearance alone for meaning.
- Responsive and input-method behavior is explicit.
- Accessibility criteria are testable and linked to the current standard or platform guidance.
- Design-system work is based on real product use, not speculative completeness.
- Prototype fidelity matches the question being tested.
- External handoff contains no credentials or unapproved private context.
- Findings update source decisions and requirements.

## Anti-Patterns

- Starting with colors and components before task flows
- Treating a generated screen as validated UX
- Designing only the happy path
- Calling a screenshot an interactive prototype
- Creating a design system before recurring patterns exist
- Using color as the only status indicator
- Assuming desktop behavior scales directly to mobile
- Claiming WCAG conformance from a linter alone
- Letting Kombai, OpenUI, or another generator choose product scope
- Shipping prototype shortcuts as production architecture without review
