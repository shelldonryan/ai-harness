# Container Plan Template

Use only relevant sections.

```markdown
# <Container Name>

**C4 ID:** `container_<id>`
**Type:** Web | Mobile | API | Worker | Data store | Other
**Status:** Proposed | Approved | Implemented | Revising
**Architecture:** [link]

## Responsibility

### Owns

### Does Not Own

## Requirements And Quality Attributes

| Source ID | Local responsibility | Evidence |
| --- | --- | --- |

## Consumers And Dependencies

| Element | Direction | Purpose | Contract owner |
| --- | --- | --- | --- |

## Runtime And Technology

## Internal Structure

## Interfaces And Contracts

## Data Ownership And Persistence

## Security And Privacy

## Failure And Recovery

## Testing Strategy

## Deployment And Configuration

## Observability And Operations

## Decisions And Alternatives

## Risks And Open Questions

## Related Features
```

Do not add empty headings. Technology selections include rationale and verified version-specific constraints when those details affect the decision.

## Feature-Specific Container Plan

Path: `.specs/features/<feature>/plans/<container-id>.md`

```markdown
# <Feature>: <Container> Plan

**Feature design:** ../design.md
**Container baseline:** ../../../containers/<container-id>.md
**Requirements:** `FEATURE-01`, `FEATURE-02`

## Local Responsibilities
## Interface Changes
## State And Data Changes
## Failure Behavior
## Security Impact
## Verification
## Migration Or Compatibility
## Risks
```

Use this file only when the central feature design would otherwise become difficult to navigate.
