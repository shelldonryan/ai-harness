# Execution And Validation

## Task Cycle

### 1. Inspect

Read the task, source requirements, relevant design section, affected code, nearby tests, and current Git status. Confirm dependencies are complete.

### 2. Plan Locally

State the smallest implementation sequence. Stop and return to planning if the task reveals an unapproved architecture decision, missing requirement, unsafe assumption, or materially larger scope.

### 3. Implement

- Touch only required files.
- Follow existing project conventions.
- Reuse existing components and patterns where suitable.
- Keep domain rules in the clearest ownership location.
- Add or update tests with the behavior.
- Record a `SPEC_DEVIATION` in the report if implementation cannot match an approved requirement; do not silently redefine the requirement.

### 4. Verify

Run the narrowest relevant check first, then broader project gates when appropriate:

1. Targeted test
2. Relevant test suite
3. Type or compile check
4. Lint or static analysis
5. Build
6. End-to-end or acceptance check

Report exact commands and outcomes. Do not claim a check passed when it was not run.

### 5. Report And Commit Gate

Report files changed, requirements addressed, verification results, and deviations. Propose the planned Conventional Commit message and ask for approval.

If approved:

1. Reinspect status and diff.
2. Stage only task-related changes.
3. Create the atomic commit.
4. Report the commit hash.

Never push as part of commit approval. Push requires separate explicit approval.

## Quick Mode

Use quick mode when the change is local, reversible, understandable in one sentence, touches at most a few files, and introduces no architecture, dependency, domain, or product decision.

Before editing, state:

- Problem
- Scope
- Approach
- Verification

Escalate to a feature specification if investigation reveals broader behavior, ambiguous requirements, or more than a few non-obvious steps.

Quick mode still requires verification and commit approval.

## Feature Validation

After all tasks:

1. Build a requirement traceability table.
2. Verify acceptance criteria and relevant quality attributes.
3. Run appropriate full project gates.
4. Review changes for architecture and scope consistency.
5. Perform guided UAT for significant user-facing flows.
6. Record unresolved risks, accepted deviations, and follow-up work.

Example traceability:

| Requirement | Implementation | Evidence | Status |
| --- | --- | --- | --- |
| `AUTH-01` | `src/auth/login.ts` | `login.test.ts` | Pass |

Do not mark the feature validated while required evidence is missing.
