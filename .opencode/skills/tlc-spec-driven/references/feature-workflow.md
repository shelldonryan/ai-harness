# Feature Workflow

## Specify

Read product requirements, relevant state, current behavior, and related feature documents. Load `grill-me` when material ambiguity remains.

Create one authoritative `spec.md` containing:

```markdown
# <Feature> Specification

**Status:** Draft | Approved | In Progress | Validated
**Product objective:** <link or ID>

## Outcome
## Users And Actors
## Scope
## Non-Goals
## Requirements
## Edge Cases
## Constraints
## Success And Acceptance
## Open Questions
```

Give requirements stable IDs such as `CHECKOUT-01`. Requirements describe observable behavior and constraints, not database columns, framework components, or implementation classes.

Create `context.md` only when several user-facing gray-area decisions need a durable record. Otherwise include approved decisions in the spec.

## Assess Design Need

A separate `design.md` is useful when the feature:

- Crosses containers or significant module boundaries
- Introduces a new integration or dependency
- Contains meaningful domain rules or data ownership decisions
- Changes security, reliability, performance, or observability behavior
- Requires UX flows, design-system decisions, or a prototype
- Uses unfamiliar technology that needs verified research

For straightforward changes, state a short design inline and continue.

## Design

A formal design includes only relevant sections:

```markdown
# <Feature> Design

**Specification:** ./spec.md
**Status:** Draft | Approved

## Requirements Addressed
## Constraints And Quality Attributes
## Existing Code And Reuse
## End-To-End Flow
## Domain Model And Rules
## Affected Containers
## Interfaces And Data
## UX And Accessibility
## Errors And Failure Modes
## Security And Privacy
## Testing Strategy
## Decisions And Alternatives
## Risks And Open Questions
```

For cross-container work, keep the end-to-end design central and place container-specific details in `plans/<container>.md` only when they would make the central document difficult to use.

Obtain approval before task decomposition when the design contains consequential choices.

## Assess Task Artifact Need

Use inline steps when there are only a few obvious sequential changes. Create `tasks.md` when dependencies, parallelism, several containers, handoffs, or a long implementation make explicit tracking valuable.

## Formal Tasks

Each task is independently understandable and verifiable:

```markdown
### T1: <Deliverable>

**Requirements:** FEATURE-01
**Paths:** `path/to/file`
**Depends on:** None
**Reuses:** Existing pattern or component

**Work:** Exact deliverable

**Tests:** Unit | Integration | End-to-end | None with reason
**Verify:** `exact command`

**Done when:**
- [ ] Binary observable condition
- [ ] Required tests pass
- [ ] No unrelated scope is included

**Proposed commit:** `type(scope): description`
```

Use concrete paths and verification commands only when supported by approved design or observed project evidence. Never invent a framework, file structure, test runner, or command to make a task look complete. If these details are material but undecided, keep the task plan Draft, record the decision as a blocker, and do not hand off to Execute.

Mark parallel tasks only when they have no unfinished dependencies, do not edit shared state, and their verification can safely run concurrently.

## Traceability Gate

Before execution, confirm:

- Every in-scope requirement has at least one task or direct implementation step.
- Every task references a requirement or approved technical necessity.
- Dependencies do not contain cycles.
- Tests are included with the behavior they verify.
- Deferred items are outside the approved scope.
- Concrete paths and commands are grounded in project evidence or approved technology decisions.
- Every selected sprint item entering execution has sufficient TLC specification and acceptance coverage.
