# Planning Artifacts

Select artifacts by decision value, not by template availability.

## Creation Test

Create an artifact only if it:

1. Answers a unique question.
2. Records a meaningful decision.
3. Is consumed by a later phase.
4. Has a clear maintenance reason.
5. Cannot remain clear as a section in an existing document.

Merge overlapping concerns before adding files. Link downstream documents to requirement and decision IDs instead of copying source text.

## Default Levels

### Lean

```text
.specs/
├── PROJECT.md
├── STATE.md
└── features/<feature>/spec.md
```

Use for experiments and small projects. Architecture and roadmap may be sections in `PROJECT.md`.

### Standard

```text
.specs/
├── PROJECT.md
├── PRD.md
├── ARCHITECTURE.md
├── STATE.md
├── decisions/
├── features/
└── scrum/
```

Use for most projects. `ARCHITECTURE.md` may combine quality attributes, C4 System Context, Containers, communication, and deployment.

### Extended

```text
.specs/
├── project/
├── architecture/
├── containers/
├── features/
├── decisions/
└── scrum/
```

Use only when the system is complex enough that consolidated documents have independent audiences or lifecycles.

## Artifact Responsibilities

| Artifact | Unique question |
| --- | --- |
| `PROJECT.md` | What is this project and what context must every session know? |
| `PRD.md` | Which user problems, outcomes, requirements, and success criteria define the product? |
| `ARCHITECTURE.md` | How is the system structured and which quality constraints shape it? |
| `STATE.md` | What is active, blocked, decided, learned, or deferred now? |
| `ADR-NNN-*.md` | Why was a consequential architecture option chosen over alternatives? |
| `features/<name>/spec.md` | What behavior must this feature provide? |
| `features/<name>/context.md` | Which ambiguous user or product choices were resolved? |
| `features/<name>/ux.md` | Which flows, screens, states, and accessibility behavior are required? |
| `features/<name>/design.md` | How will the approved feature be implemented? |
| `features/<name>/tasks.md` | In which dependency-aware, verifiable steps will it be delivered? |

## Cross-Container Features

Keep one behavioral specification. Add technical plans only for affected containers:

```text
.specs/features/<feature>/
├── spec.md
├── design.md
├── plans/
│   ├── web.md
│   └── api.md
└── tasks.md
```

Do not create independent copies of the feature requirements inside each container.

## Architecture Decisions

An ADR is appropriate when a choice is hard to reverse, affects multiple features or containers, changes important quality attributes, or requires future maintainers to understand rejected alternatives.

An ADR contains:

- Status and date
- Decision context
- Constraints and quality attributes
- Considered options
- Decision and rationale
- Positive and negative consequences
- Follow-up conditions

Do not create an ADR for routine implementation choices.
