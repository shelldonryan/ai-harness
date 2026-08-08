---
name: product-planning
description: Guided product planning for PROJECT.md, product requirements documents, users, outcomes, scope, non-goals, success criteria, capabilities, roadmap candidates, and requirement validation. Use when starting a product, creating or revising a PRD, clarifying who a product serves, defining product scope, or translating an idea into feature candidates. Focuses on product and user requirements; do not include competitor analysis, monetization, market positioning, technical architecture, or implementation design unless explicitly requested.
license: MIT
compatibility: OpenCode
metadata:
  version: "0.1.0"
---

# Product Planning

Turn a product idea into an approved statement of users, problems, outcomes, scope, and testable product requirements. Teach product reasoning instead of silently manufacturing a complete PRD.

## Boundaries

This skill owns:

- Product purpose and users
- User problems and desired outcomes
- Product scope and non-goals
- Capabilities and product requirements
- Success criteria and product risks
- Feature candidates and roadmap outcomes

This skill does not own:

- Competitor analysis, monetization, or market positioning
- Runtime architecture or technology selection
- Detailed feature behavior already owned by a feature specification
- Implementation tasks
- Sprint priority and commitment

Use TLC for lifecycle, `c4-architecture` for solution structure, and `scrum-solo` for backlog and sprint decisions.

## Artifact Roles

| Artifact | Role |
| --- | --- |
| `PROJECT.md` | Concise cross-session context and navigation |
| `PRD.md` | Authoritative product and user requirements |
| `features/<name>/spec.md` | Detailed behavior and acceptance for one feature |
| `PRODUCT_BACKLOG.md` | Ordered candidate outcomes and work |

Do not duplicate detailed feature requirements in the PRD. Link from product capabilities to feature specifications as they are created.

## Process

### 1. Inspect Existing Evidence

Read current project, product, state, roadmap, feature, user-feedback, and architecture artifacts. Distinguish verified information from assumptions. Do not ask questions already answered by reliable project context.

### 2. Run Guided Discovery

Load `grill-me` for a new product or material PRD gaps. Ask one question at a time, prioritizing:

1. Problem and intended outcome
2. Users or actors
3. Current behavior and pain
4. Core user journeys
5. Scope and non-goals
6. Success evidence
7. Constraints and risks
8. Lower-impact preferences

For learning decisions, explain why the question matters, let the user reason, then review and recommend.

Do not invent user research. Label unsupported user descriptions as assumptions or proto-personas, not validated personas.

### 3. Select Documentation Depth

- **Lean:** keep a short product baseline inside `PROJECT.md`.
- **Standard:** create `PROJECT.md` plus `PRD.md`.
- **Extended:** split supporting user or journey material only when reused across several features and approved under the artifact-value rule.

Explain why a separate artifact is needed before creating it.

### 4. Define The Product

Use [prd.md](references/prd.md). Product requirements describe outcomes and externally meaningful behavior. Avoid framework, database, service, class, or screen-component decisions.

Give durable requirements stable IDs. Use clear categories only when they improve navigation:

- `USER-NN`: user need or outcome
- `CAP-NN`: product capability
- `QUAL-NN`: user-visible quality or constraint

Do not create IDs for headings, background prose, or speculative ideas.

### 5. Validate The PRD

Before approval, confirm:

- The problem is specific enough to recognize.
- Users and actors are distinguishable.
- Each capability supports a stated user outcome.
- Scope and non-goals prevent obvious expansion.
- Requirements are testable or refinable into testable feature criteria.
- Success criteria name evidence without fabricating baselines or targets.
- Assumptions, constraints, risks, and open questions are explicit.
- Technical solutions have not been disguised as product requirements.

Use `Unknown` rather than inventing numbers or user facts.

### 6. Derive Roadmap Candidates

After PRD approval, identify end-to-end outcomes that could become features. Use [roadmap.md](references/roadmap.md). Keep the roadmap at outcome level and let `scrum-solo` order actionable backlog items.

Do not schedule work, estimate velocity, or commit to architecture during product planning.

## Change Management

When revising an approved PRD:

1. Identify the new evidence or decision.
2. Show affected requirement IDs and downstream features.
3. Explain scope, architecture, backlog, and validation impact.
4. Obtain approval before changing product truth.
5. Update links rather than copying revised text downstream.

Record major scope changes in project state. Use an ADR only for architecture choices, not product decisions.

## Completion Report

- Product understanding achieved
- Approved requirements and non-goals
- Assumptions or unknowns still open
- Artifacts created or changed
- Candidate features or decisions unlocked
- Recommended next TLC phase

## Anti-Patterns

- Starting with technology or architecture
- Treating a feature list as a product strategy
- Inventing personas, research findings, or success metrics
- Writing requirements as implementation instructions
- Repeating every feature acceptance criterion in the PRD
- Adding competitor, pricing, or market sections by template habit
- Making every idea part of the first release
- Creating a polished document before resolving the core problem
