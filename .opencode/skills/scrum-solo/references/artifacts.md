# Scrum Artifact Templates

Keep templates concise and remove sections that do not inform a decision.

## Product Backlog

Path: `.specs/scrum/PRODUCT_BACKLOG.md`

```markdown
# Product Backlog

**Updated:** YYYY-MM-DD
**Product:** [link to PRD]

## Prioritization Context

[Current product objective, constraints, or ordering principle]

## Ordered Items

### PB-001: <Outcome>

**Status:** Proposed | Refining | Ready | Selected | In Progress | Done | Deferred
**Type:** Feature | Defect | Risk | Technical enablement
**Source:** [PRD objective or feature specification]

**Outcome:** [User or product result]
**Value:** [Why this matters now]
**Acceptance:** [Observable completion evidence]
**Dependencies:** None or IDs
**Risks/unknowns:** None or concise statement
**Priority rationale:** [Why this position relative to nearby items]

## Deferred Or Removed

| ID | Reason | Revisit when |
| --- | --- | --- |
```

The file order is the priority order. Do not add a separate numeric priority that can disagree with it.

## Current Sprint

Path: `.specs/scrum/CURRENT_SPRINT.md`

```markdown
# Sprint 001

**Status:** Planning | Active | Reviewing
**Started:** YYYY-MM-DD
**Target review:** YYYY-MM-DD or condition

## Sprint Goal

[One outcome and why it matters]

## Goal Evidence

- [Observable evidence that will show the goal is met]

## Capacity And Constraints

- [Availability, learning commitments, known interruptions, or uncertainty]

## Selected Backlog

| Backlog item | Feature spec | Status | Evidence |
| --- | --- | --- | --- |
| `PB-001` | `.specs/features/example/spec.md` | Selected | Pending |

## Scope Decisions

| Date | Change | Reason | Goal impact |
| --- | --- | --- | --- |

## Review

**Goal result:** Met | Partially met | Not met

### Increment And Evidence

### Feedback And Product Discoveries

### Backlog Changes

## Retrospective

### Helped

### Created Friction

### Next Experiment

**Experiment:** [One specific process change]
**Evidence:** [How the next sprint will evaluate it]
```

During planning, leave Review and Retrospective headings present but empty. They keep the lifecycle in one artifact without creating extra files.

## Archived Sprint

Path: `.specs/scrum/sprints/SPRINT-NNN.md`

Use the completed `CURRENT_SPRINT.md` content unchanged except for setting `Status: Closed` and adding:

```markdown
**Closed:** YYYY-MM-DD
```

Do not copy the archived content into another report.
