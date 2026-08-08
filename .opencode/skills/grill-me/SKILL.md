---
name: grill-me
description: Guided one-question-at-a-time interviews for product discovery, requirements clarification, architecture decisions, UX planning, and feature specification. Use when the user says "grill me", asks for an interview, has an ambiguous idea, starts a project or feature, or needs to reason through consequential tradeoffs. Do not use for routine factual questions or already-approved decisions.
license: MIT
metadata:
  version: "0.1.0"
---

# Grill Me

Turn an unclear idea or consequential decision into an approved, traceable understanding. Act as a coach and thinking partner, not a questionnaire generator.

## Operating Modes

- **Standalone discovery**: clarify a topic and return a decision-ready summary.
- **Delegated discovery**: when another skill invokes this skill, return findings to that workflow and update only its approved artifact.
- **Coaching gate**: teach a concept, let the user reason, then review and recommend.

## Rules

1. Ask exactly one primary question per turn.
2. Use the answer to choose the next question; do not follow a fixed questionnaire blindly.
3. Read available project context first and never ask for information already documented.
4. Explain unfamiliar concepts and relevant tradeoffs before asking the user to decide.
5. Do not reveal a preferred answer before the user reasons when learning is the purpose of the question.
6. Challenge contradictions, unsupported assumptions, vague language, and premature technical decisions respectfully.
7. Separate facts, user decisions, assumptions, constraints, unknowns, risks, and deferred ideas.
8. Do not create an artifact merely because a template exists. Explain why a new artifact is useful and obtain approval first.
9. Do not begin implementation while material planning unknowns remain unless the user explicitly accepts the risk.

## Interview Loop

### 1. Establish The Decision

Identify what must be understood or decided, who will use the result, and which downstream activity depends on it. Infer this from context when possible rather than asking a ceremonial question.

### 2. Load Existing Context

Inspect relevant sources in this order:

1. Current conversation
2. Project `AGENTS.md` and README
3. Existing `.specs/` artifacts
4. Existing code and tests when the topic concerns current behavior
5. Authoritative external documentation when facts may have changed

### 3. Maintain A Discovery Ledger

Track these categories during the interview:

| Category | Meaning |
| --- | --- |
| Facts | Verified information |
| Decisions | Choices explicitly approved by the user |
| Assumptions | Beliefs that still require confirmation |
| Constraints | Boundaries the solution must respect |
| Unknowns | Missing information that can change the outcome |
| Risks | Possible negative outcomes and their impact |
| Deferred | Valid topics intentionally left for later |

Do not repeatedly print the complete ledger. Surface the relevant part when resolving a contradiction, confirming a decision, or completing discovery.

### 4. Select The Next Question

Prioritize the question with the highest decision value:

1. A blocker that prevents all downstream reasoning
2. A high-risk assumption
3. A contradiction between stated goals or constraints
4. Scope and non-goals
5. User behavior and success criteria
6. Domain rules and edge cases
7. Quality attributes and operational constraints
8. Lower-impact preferences

Prefer an open question when discovery matters. Use the structured question tool when concrete alternatives are understood. Always allow a custom answer when available choices may be incomplete.

### 5. Challenge And Teach

When the user is learning a planning skill:

1. Explain why the decision matters.
2. Present the constraints and tradeoffs neutrally.
3. Ask the user to reason or choose.
4. Evaluate the answer after receiving it.
5. Offer a recommendation and explain the transferable principle.

Do not turn every preference into a lesson. Reserve coaching for decisions with meaningful product, architecture, UX, delivery, or risk consequences.

### 6. Check Completion

Discovery is complete when:

- The problem and intended outcome are clear.
- Relevant users or actors are identified.
- Scope and important non-goals are explicit.
- Success can be evaluated.
- Material constraints and domain rules are known.
- High-impact assumptions have been confirmed or marked as accepted risks.
- Remaining unknowns do not block the next phase.

If the topic is narrower than product discovery, apply only the relevant conditions.

## Completion Output

Return a concise decision-ready summary containing:

- Objective
- Approved decisions
- Key rationale
- Constraints
- Accepted risks or unresolved unknowns
- Recommended next step
- Target artifact to update, if one already exists or was approved

In delegated mode, return findings to the invoking workflow without creating a parallel source of truth.

## Anti-Patterns

- Asking five unrelated questions in one turn
- Asking the user to repeat documented information
- Leading questions designed to confirm the agent's preference
- Treating a user's first idea as a final requirement
- Generating a PRD before users, outcomes, and scope are understood
- Converting every answer into a new file
- Continuing an interview after the decision is sufficiently clear
