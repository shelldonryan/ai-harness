# Prototyping

Choose a prototype by the question it must answer.

## Fidelity

| Level | Best for | Typical output |
| --- | --- | --- |
| Low | Information hierarchy, navigation, and task sequence | Flow, wireframe, structured HTML |
| Medium | Interaction, content, states, and responsive behavior | Clickable or coded prototype |
| High | Visual direction, design-system fit, and realistic usability evaluation | Polished interactive prototype |

Do not increase fidelity while fundamental flow questions remain unresolved.

## Prototype Contract

Before building, state:

- Question and hypothesis
- Target users and scenario
- Requirements covered
- Included and excluded flows
- Required states and representative data
- Device, viewport, and input assumptions
- Accessibility behaviors to evaluate
- Design-system source or visual direction
- Fidelity and disposal/production intent
- Evaluation method and success evidence

## Tool-Neutral Handoff Brief

Create a separate brief only when an external tool needs stable input:

```markdown
# <Feature> Prototype Brief

## Goal And Questions
## Source Requirements
## User Scenario
## Flow And Screens
## Required States
## Content And Data Examples
## Responsive Targets
## Accessibility Requirements
## Design System And Visual Direction
## Technical Constraints
## Deliverables
## Evaluation And Acceptance
## Excluded Scope
```

Never include credentials, production personal data, or unapproved private repository context.

## OpenCode-Native

Use the current project stack or isolated `prototypes/<feature>/` code after approval. Prefer the smallest implementation that demonstrates the interaction. Label shortcuts and mocks clearly.

If browser automation is available, use it for repeatable flows, viewport checks, screenshots, and selected accessibility checks. Automated tools do not replace keyboard, screen-reader, content, or usability evaluation.

## Kombai

Kombai currently supports visual design, Canvas, design systems, repository context, code generation, browser interaction, and custom skills/commands. Use it when high-fidelity design exploration or design-to-code work provides value.

Handoff policy:

1. Approve the prototype brief and repository-access boundary.
2. Provide existing design-system and reusable-code sources intentionally.
3. Preserve generated Canvas or code artifacts in the project when appropriate.
4. Review generated output against requirements, states, accessibility, and project conventions.
5. Do not assume generated code is production-ready without TLC verification.

Kombai is an external tool. Installation, authentication, repository access, and paid usage require explicit approval.

## W&B OpenUI

When the selected tool is `wandb/openui`, use it for rapid live UI exploration and conversion to HTML, React, Svelte, or Web Components. It runs separately and needs a supported model provider or a local model through Ollama.

Treat its output as a prototype until reviewed. Do not install Docker, Python dependencies, Ollama, models, or API credentials automatically.

## Evaluation

Record:

- Question answered or still unknown
- Observed task success and failure
- Accessibility and responsive findings
- Content misunderstandings
- Design-system gaps
- Requirements or flows that must change
- Whether to discard, iterate, or productionize the prototype

Update source artifacts before implementation planning.
