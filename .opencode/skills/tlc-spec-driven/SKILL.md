---
name: tlc-spec-driven
description: Central adaptive delivery workflow for new projects, existing codebases, features, architecture changes, quick fixes, validation, and session handoffs. Uses Specify, optional Design, optional Tasks, and Execute phases with guided discovery, artifact control, traceability, verification, and Gitflow. Use when the user says initialize project, map codebase, specify feature, design, create tasks, implement, validate, quick fix, pause work, or resume work.
license: CC-BY-4.0
compatibility: OpenCode
metadata:
  author: "Felipe Rodrigues / Tech Lead's Club; adapted for this harness"
  version: "0.1.0"
  source: "https://github.com/rawelcl/tlc-spec-driven"
---

# TLC Spec-Driven Delivery

Use one adaptive lifecycle for planning and delivery:

```text
Discover -> Specify -> Design? -> Tasks? -> Execute -> Validate -> Learn
```

`Specify` and `Execute` are always required. The question marks mean that complexity, not ceremony, determines whether a separate artifact is useful.

## Governing Principles

1. Understand the problem before proposing implementation.
2. Keep one source of truth for each decision; link instead of duplicating.
3. Create only artifacts that answer a unique question or support a later phase.
4. Treat features as end-to-end behavior even when they cross containers.
5. Inspect existing code and conventions before designing changes.
6. Verify current library behavior through project docs, Context7, or authoritative sources rather than guessing.
7. Implement the smallest approved scope and capture unrelated ideas as deferred.
8. Verify work before calling it complete.
9. Ask before every commit, push, pull request, release, or externally visible action.

## Request Router

Classify the request before choosing a path:

| Situation | Path | Reference |
| --- | --- | --- |
| New product or project | Guided discovery -> product baseline -> architecture proposal | [project-workflows.md](references/project-workflows.md) |
| Existing project | Codebase mapping -> concerns -> project baseline | [project-workflows.md](references/project-workflows.md) |
| New or changed feature | Specify -> optional Design -> optional Tasks -> Execute | [feature-workflow.md](references/feature-workflow.md) |
| Architecture change | Requirements -> options -> decision -> architecture update | [planning-artifacts.md](references/planning-artifacts.md) |
| Quick fix or tiny change | Brief scope -> implement -> verify | [execution.md](references/execution.md) |
| Validate completed work | Requirement traceability -> tests -> user acceptance | [execution.md](references/execution.md) |
| Pause or resume | Persist or restore concise working state | [state-management.md](references/state-management.md) |
| Backlog or sprint work | Prioritize -> sprint goal -> review -> retrospective | Load `scrum-solo` |

If the request combines situations, identify the primary path and sequence supporting paths explicitly.

## Shared Preflight

Before planning or editing:

1. Read applicable `AGENTS.md` files and repository documentation.
2. Inspect Git status and the current branch without modifying either.
3. Read `.specs/STATE.md` and `.specs/PROJECT.md` when present.
4. Read only the current feature and relevant architecture documents; do not load every specification.
5. Inspect the affected code, tests, and existing conventions.
6. State material gaps, conflicts, or risks.

Do not ask the user for information already available in these sources.

## Complexity And Artifact Proposal

Choose the smallest sufficient depth:

| Depth | Indicators | Typical output |
| --- | --- | --- |
| Quick | Local, reversible, no architecture or product decision | Inline scope and verification; optional quick record |
| Standard | Clear feature or project with limited cross-cutting impact | Product/feature spec and consolidated design as needed |
| Extended | Ambiguous domain, several containers, major risk, or consequential architecture | Approved specialized artifacts and explicit task dependencies |

Before creating planning files:

1. List existing artifacts that will be reused.
2. Propose only new artifacts that provide unique value.
3. Explain why each proposed artifact is needed.
4. Ask for approval when adding artifacts beyond the established baseline.

Load [planning-artifacts.md](references/planning-artifacts.md) for selection and consolidation rules.

## Guided Discovery

Load the `grill-me` skill when requirements are ambiguous, a project or significant feature is beginning, user-facing tradeoffs remain, or an architecture decision would benefit from coaching.

Use one question at a time. Let the user reason before recommending an answer when the decision has learning value. Return approved findings to the current TLC artifact rather than creating a parallel discovery document.

## The Four TLC Phases

### Specify

Define what outcome is required without prematurely prescribing implementation. Capture users or actors, scope, non-goals, testable requirements, edge cases, constraints, and success criteria. Give requirements stable IDs for downstream traceability.

For product initialization, focus the PRD on product and user requirements. Exclude competition, monetization, and market positioning unless explicitly requested.

Load `product-planning` when creating or revising `PROJECT.md`, a PRD, product scope, users, outcomes, success criteria, or roadmap candidates.

### Design

Create a separate design only when implementation requires meaningful technical decisions, coordination across containers, unfamiliar technology, domain modeling, UX planning, or architecture changes.

Use installed specialized skills when relevant:

- Pragmatic DDD for domain language, invariants, boundaries, and implementation structure
- C4 for System Context, Container, and selected Component views
- UX/design-system planning for user-facing behavior and prototypes
- Container profiles for web, mobile, API, worker, or other runtime concerns

Load `pragmatic-ddd` when the feature contains meaningful business rules, unclear ownership, cross-domain behavior, or a boundary decision. Do not load it for simple CRUD or presentation-only work.

Load `c4-architecture` when planning or changing the system boundary, runtime containers, significant internal structure, cross-container interactions, or deployment topology. Use C4 to communicate approved architecture, not to replace requirements or decision rationale.

Load `container-planning` after C4 container responsibilities are approved and runtime-specific technical baselines or cross-container feature plans are needed.

Load `ux-planning` for user-facing journeys, information architecture, flows, screen states, design systems, accessibility, responsive behavior, prototypes, or design review. Resolve UX behavior before production task decomposition.

Do not choose microservices before product requirements, domain boundaries, quality attributes, and operational tradeoffs are understood. Record consequential choices as ADRs.

### Tasks

Create `tasks.md` only when explicit dependencies, parallel work, cross-container sequencing, or more than a few non-obvious steps make it useful. Otherwise list a short implementation sequence inline.

Every formal task defines:

- Deliverable and affected paths
- Source requirement IDs
- Dependencies and reuse opportunities
- Tests or validation evidence
- A binary completion condition
- The exact verification command when known
- A proposed Conventional Commit message

Tests belong with the task that creates or changes the behavior. Do not defer verification into a generic final testing task.

### Execute

For each task:

```text
Inspect -> Plan -> Implement -> Verify -> Report -> Ask to commit -> Continue
```

Follow [execution.md](references/execution.md). Never create a commit automatically. If approval is granted, create an atomic commit from only the verified task changes.

## Validate And Learn

After implementation:

1. Trace each requirement to implementation and evidence.
2. Run the relevant test, type, lint, build, and acceptance checks.
3. Check for scope drift and unrecorded design changes.
4. Perform guided UAT for significant user-facing behavior.
5. Update state, backlog, architecture, and decisions only where the completed work changed them.
6. Capture process lessons in the sprint retrospective when a sprint is active.

Load `scrum-solo` when creating or prioritizing the product backlog, planning a sprint, reviewing sprint outcomes, or running a retrospective. Backlog items represent outcomes; do not duplicate TLC implementation tasks in Scrum artifacts.

## Gitflow

For user-owned repositories that adopt Gitflow:

- Start features from `develop` in `feature/<name>`.
- Integrate completed features into `develop` after validation.
- Use `release/<version>` for stabilization before `main`.
- Use `hotfix/<name>` from `main` for urgent production corrections.
- Respect a repository's existing documented workflow instead of imposing Gitflow.

Branch creation and commits are separate decisions. Inspect before changing branches and ask before each commit. Always ask before pushing or publishing.

## Completion Report

Keep the report decision-oriented:

- Outcome
- Artifacts or code changed
- Requirements satisfied
- Verification performed and results
- Deviations, risks, or unresolved items
- Current branch and uncommitted status when relevant
- Recommended next approved step

## Attribution

This skill adapts TLC Spec-Driven v2 by Felipe Rodrigues and the Tech Lead's Club community. See [NOTICE.md](NOTICE.md).
