# Product Requirements Document

Use only sections that answer an active product question.

## Standard Template

```markdown
# Product Requirements

**Status:** Draft | Approved | Revising
**Updated:** YYYY-MM-DD
**Project:** ./PROJECT.md

## Product Summary

[What the product enables and why it should exist]

## Problem

[Current user situation, pain, and consequence]

## Users And Actors

| User or actor | Need | Current behavior | Evidence status |
| --- | --- | --- | --- |

## Outcomes

| ID | Desired outcome | Success evidence |
| --- | --- | --- |
| `USER-01` | ... | ... |

## Core Journeys

### Journey: <Name>

**Trigger:** ...
**Desired result:** ...
**Important failure or recovery:** ...

## Product Capabilities

| ID | Capability | Supports | Priority rationale |
| --- | --- | --- | --- |
| `CAP-01` | ... | `USER-01` | ... |

## Product Requirements

### CAP-01: <Capability>

- WHEN ... THEN the product SHALL ...
- WHEN ... THEN the user SHALL be able to ...

## User-Visible Quality Requirements

| ID | Requirement | Evidence |
| --- | --- | --- |
| `QUAL-01` | ... | ... |

## Scope

### Included

### Non-Goals

### Later Candidates

## Constraints

## Assumptions

| Assumption | Impact if false | Validation plan |
| --- | --- | --- |

## Risks And Open Questions

## Success Criteria

| Outcome | Indicator | Baseline | Target or decision rule |
| --- | --- | --- | --- |
```

Use `Unknown` for unavailable baselines or targets and record how they could be learned.

## Requirement Quality

A useful product requirement is:

- Connected to a user or product outcome
- Observable from outside the implementation
- Clear about trigger, behavior, and meaningful constraint
- Independent of a preferred technical solution where possible
- Stable enough for feature specifications to refine

Weak: `Use PostgreSQL to store orders.`

Product requirement: `The product shall retain confirmed orders so customers can review their purchase history.`

Architecture and design decide the storage technology later.

## PROJECT.md Baseline

Keep `PROJECT.md` short:

```markdown
# Project

## Purpose
## Users
## Current Product Scope
## Important Constraints
## Current Stage
## Artifact Map
## Next Decision
```

Link to the PRD, architecture, current sprint, and state rather than repeating them.
