# Outcome Roadmap

A roadmap communicates product progression, not a guaranteed delivery calendar.

## Derivation

1. Start from approved product outcomes and capabilities.
2. Identify the smallest end-to-end increments that create value or learning.
3. Expose dependencies without turning technical layers into milestones.
4. Order broad horizons by outcome, risk reduction, and learning.
5. Send actionable candidates to the product backlog for detailed priority.

## Suggested Form

Keep the roadmap in `PROJECT.md` when short. Create a separate `ROADMAP.md` only when several horizons or stakeholders need it.

```markdown
# Product Roadmap

## Now

### <Outcome>

**Product requirements:** `CAP-01`, `USER-01`
**Why now:** ...
**Evidence:** ...

## Next

## Later

## Not Planned

| Candidate | Reason |
| --- | --- |
```

Use horizons instead of dates until delivery evidence and constraints justify scheduling.

## Rules

- Roadmap entries are outcomes, not frontend/backend/database phases.
- A feature can cross several C4 containers.
- The backlog contains actionable work; the roadmap remains directional.
- Sprint selection does not automatically change long-term product priority.
- Update the roadmap when product evidence changes, not after every implementation task.
