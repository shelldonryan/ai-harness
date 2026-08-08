---
name: scrum-solo
description: Lightweight personal Scrum planning in Markdown for maintaining a prioritized product backlog, choosing a sprint goal and work, reviewing outcomes, and running a concise retrospective. Use when the user says product backlog, prioritize work, plan sprint, current sprint, sprint review, retrospective, close sprint, or asks what to work on next. Integrates with TLC specifications and validation without mandatory estimates, velocity, daily ceremonies, or extra artifact files.
license: MIT
compatibility: OpenCode
metadata:
  version: "0.1.0"
---

# Personal Scrum

Apply useful Scrum feedback loops to personal projects without pretending that one person is a full Scrum team. Optimize for focus, inspectable outcomes, and process learning.

## Core Loop

```text
Product Backlog -> Sprint Goal -> Focused Delivery -> Review -> Retrospective -> Backlog
```

TLC controls specification, design, tasks, execution, and validation. This skill controls prioritization, short-horizon commitment, outcome review, and process improvement.

## Principles

1. Prioritize outcomes and user value, not a list of disconnected tasks.
2. Define the sprint goal before selecting work.
3. Select less work than the available time appears to allow.
4. Keep one backlog item active by default; finish before starting another.
5. Treat changed information as a reason to replan, not hide scope changes.
6. Mark work Done only after TLC validation provides evidence.
7. Keep estimation optional and never manufacture velocity from weak data.
8. Make the retrospective produce at most one concrete process experiment.
9. Maintain only artifacts that will be read and updated.

## Active Artifacts

Default to two files:

```text
.specs/scrum/
├── PRODUCT_BACKLOG.md
└── CURRENT_SPRINT.md
```

When a sprint closes, archive the complete sprint as one file:

```text
.specs/scrum/sprints/SPRINT-001.md
```

Do not create separate planning, review, retrospective, or metrics files unless their independent size and lifecycle justify them. Load [artifacts.md](references/artifacts.md) for templates.

## Product Backlog

The backlog is one ordered list of potential outcomes. Each item uses a stable ID such as `PB-001` and links to its PRD objective or TLC feature specification when available.

### Add Or Refine An Item

1. Read the PRD, roadmap, current backlog, and relevant feature spec.
2. Load `grill-me` if the user outcome, scope, or acceptance remains ambiguous.
3. Describe the desired outcome rather than implementation tasks.
4. Capture value, acceptance, dependencies, risks, and source links briefly.
5. Place the item relative to existing items and explain the priority tradeoff.

An item becomes `Ready` when its outcome, acceptance, major dependencies, and material risks are understood enough to plan. A complete technical design is not required for backlog readiness.

### Priority

Order items by explicit reasoning:

- User or product value
- Risk reduction and learning
- Dependencies and opportunity enablement
- Urgency or cost of delay
- Effort and uncertainty

Do not calculate a fake universal score by default. Use a short rationale and compare nearby items directly.

## Sprint Planning

Before planning, inspect project state, current branch, unfinished work, backlog readiness, and known personal availability.

Use guided coaching:

1. Ask the user what outcome would make the sprint valuable.
2. Turn the answer into one falsifiable sprint goal.
3. Identify candidate Ready items that directly support that goal.
4. Discuss capacity constraints and uncertainty without requiring story points.
5. Select a conservative amount of work.
6. Define the validation evidence for the goal.
7. Obtain approval before changing backlog status or creating the sprint artifact.

Select backlog items, not every implementation task. TLC creates and manages feature-level tasks after selection.

Selection does not make an item implementation-ready. Before execution, each selected feature must pass TLC Specify and any required Design/Tasks gates. If a selected outcome lacks sufficient specification, planning it is the next sprint activity; the build agent must not invent the missing behavior.

## During The Sprint

- Use `.specs/STATE.md` for session handoffs instead of mandatory daily stand-ups.
- Link active TLC feature artifacts from `CURRENT_SPRINT.md`.
- Keep only one item `In Progress` unless independent parallel work is intentional and justified.
- New requests enter the product backlog first.
- If urgent work threatens the goal, explain the tradeoff and ask whether to swap scope, renegotiate the goal, or stop the sprint.
- Do not silently expand sprint scope.

## Sprint Review

The review inspects product outcomes, not effort:

1. Read the sprint goal, selected backlog items, TLC validation reports, tests, and relevant user feedback.
2. Demonstrate or summarize the actual increment.
3. Compare evidence with the sprint goal and item acceptance criteria.
4. Mark items Done only when validation evidence exists.
5. Return incomplete items to the backlog and re-prioritize them; do not automatically carry them forward.
6. Record product discoveries and backlog changes.

Use `Met`, `Partially met`, or `Not met` for the sprint goal, with evidence.

## Retrospective

After the review, coach the user through one question at a time:

1. What helped delivery or learning?
2. What created friction or reduced quality?
3. What single change should we test next sprint?

The experiment must be specific and observable. Examples include limiting active work to one item, refining acceptance before selection, or running a targeted test before broader implementation.

Do not turn the retrospective into blame, a long diary, or a generic list of intentions.

## Close The Sprint

After review and retrospective are complete:

1. Update item statuses in the product backlog.
2. Record goal outcome, evidence, discoveries, and the next experiment.
3. Move the completed sprint content to the next numbered history file.
4. Remove `CURRENT_SPRINT.md`; a new one is created only during the next approved planning session.
5. Update `.specs/STATE.md` with the next decision or objective.

Archiving changes files but does not imply a Git commit. Follow the TLC commit approval gate.

## TLC Integration

- PRD objectives feed backlog outcomes.
- `Ready` backlog items enter TLC Specify when selected or when refinement needs a formal feature spec.
- TLC tasks remain in `features/<name>/tasks.md`, not duplicated in the product backlog.
- TLC validation is the evidence for Done.
- Sprint review may add or re-prioritize backlog items.
- Sprint retrospective changes the process, not product requirements.
- Gitflow feature branches may link to selected backlog and feature IDs.

## Completion Report

Report:

- Sprint or backlog outcome
- Decisions and priority rationale
- Files changed
- Goal and item status with evidence
- Scope changes or unresolved risks
- One next step or retrospective experiment

## Anti-Patterns

- Treating the backlog as a dump of unprioritized ideas
- Selecting tasks before defining a sprint goal
- Filling all theoretical capacity
- Marking code complete without feature validation
- Automatically carrying unfinished work into the next sprint
- Measuring personal productivity by story points
- Creating charts or ceremony without a decision they support
- Duplicating TLC task status in Scrum files
