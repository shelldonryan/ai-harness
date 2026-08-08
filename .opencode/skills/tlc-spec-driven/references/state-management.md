# State Management

`STATE.md` is concise cross-session memory, not an activity log.

## Suggested Structure

```markdown
# Project State

**Updated:** YYYY-MM-DD
**Current phase:** Specify | Design | Tasks | Execute | Validate
**Current feature:** <name or none>

## Active Objective
## Completed And Verified
## In Progress
## Next Approved Step
## Decisions
## Blockers And Risks
## Deferred Ideas
## Working Preferences
```

Link to detailed artifacts instead of copying their content.

## Pause Work

Before ending a session:

1. Inspect Git status and current branch.
2. Record completed and verified work.
3. Record partial work precisely, including affected paths.
4. Record the next safe step and its prerequisites.
5. Record blockers, deviations, and uncommitted changes.
6. Update the timestamp.

Do not claim unverified work is complete.

## Resume Work

On resume:

1. Read `STATE.md` and the current feature artifact.
2. Inspect Git status, branch, and recent history.
3. Verify the recorded state still matches the repository.
4. Summarize the objective, completed work, current risk, and next step.
5. Ask before continuing when the next action changes files or requires a planning decision.

Correct stale state when repository evidence disagrees, and explain the correction.
