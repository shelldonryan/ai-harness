# Harness User Guide

This guide maps a request to the right agent, command, skill, and artifact. You normally interact through natural language or slash commands; skills are loaded automatically by the agents when their trigger conditions apply.

## Mental Model

```text
Your request
  -> Choose a working mode
  -> TLC classifies the situation
  -> Specialized skills answer planning questions
  -> Approved decisions are written to .specs
  -> Independent review finds gaps
  -> Build implements approved tasks
  -> Validation supplies evidence
  -> Scrum review and retrospective close the loop
```

The harness is the behavior and tool layer around OpenCode. OpenCode remains the runtime, and the selected provider model performs the reasoning.

## Start A Session

Open a terminal in the project you want to work on:

```bash
opencode
```

OpenCode loads the global harness automatically through the symbolic links in `~/.config/opencode/`. Project-level `AGENTS.md` and `opencode.jsonc` files can add more specific rules.

Configuration, agent, command, and skill changes require restarting OpenCode.

## Working Modes

| Need | Agent or interface | Write boundary |
| --- | --- | --- |
| Plan a product, feature, architecture, UX, or sprint | `delivery-planner` | Approved `.specs/**` files only |
| Implement, test, prototype, or modify application code | `build` | Project files under global safety rules |
| Analyze without making changes | Built-in `plan` | Restricted by OpenCode |
| Independently review a plan or evidence | `delivery-reviewer` | Read-only |
| Explore a codebase quickly | Built-in `explore` subagent | Read-only |
| Research current dependency behavior | Context7 or built-in research tools | Read-only external documentation |

Use `Tab` in the TUI to cycle primary agents. The default remains `build`. Most planning commands select `delivery-planner` automatically. `/design-system` and `/prototype` select `build` because they may create executable assets or application code.

## Three Ways To Use The Harness

### Natural Language

Describe the outcome and let TLC route the work:

```text
I want to build a personal study planner. Use guided coaching and help me define the product before choosing architecture.
```

```text
Specify a password-reset feature for this existing application. Inspect current behavior before asking questions.
```

Natural language is best when the situation spans several skills or you are unsure which workflow applies.

### Slash Commands

Use a command when the activity is already clear:

| Command | Agent | Use it for |
| --- | --- | --- |
| `/product` | `delivery-planner` | Product discovery, `PROJECT.md`, PRD, scope, users, and outcomes |
| `/architecture` | `delivery-planner` | C4 architecture, architecture options, mapping, and reviews |
| `/container-plan` | `delivery-planner` | Web, mobile, API, worker, data-store, or integration baselines |
| `/ux-plan` | `delivery-planner` | Journeys, information architecture, flows, states, responsiveness, and accessibility |
| `/design-system` | `build` | Shared visual principles, tokens, components, and interaction contracts |
| `/prototype` | `build` | Prototype planning, implementation, external handoff, or evaluation |
| `/backlog` | `delivery-planner` | Add, refine, order, or inspect product backlog outcomes |
| `/sprint-plan` | `delivery-planner` | Define a sprint goal and select conservative Ready work |
| `/sprint-review` | `delivery-planner` | Compare the increment with goals and TLC validation evidence |
| `/sprint-retro` | `delivery-planner` | Reflect and select one observable process experiment |
| `/delivery-review` | `delivery-reviewer` | Run an independent read-only planning or evidence review |

Commands accept additional context:

```text
/architecture compare a modular monolith with microservices for the approved requirements
```

```text
/delivery-review review the checkout specification, design, and tasks before implementation
```

### Explicit Agent Or Skill Routing

Mention the reviewer directly when you want an independent second opinion:

```text
@delivery-reviewer review .specs/features/checkout for requirement and validation gaps
```

You can explicitly request a skill when teaching or diagnosis matters:

```text
Load pragmatic-ddd and help me understand who should own this business rule.
```

Normally TLC loads skills automatically, so explicit skill routing is optional.

## Situation Map

| Situation | Recommended first action | Expected result |
| --- | --- | --- |
| New product | Select `delivery-planner`; run `/product` | Product baseline and approved PRD |
| Existing codebase | Ask `delivery-planner` to map the codebase using TLC | Current architecture, conventions, tests, and concerns |
| New feature | Ask `delivery-planner` to specify the feature | `spec.md`, then optional UX, design, and tasks |
| Architecture change | Run `/architecture` | Options, tradeoffs, ADR when needed, and updated C4 view |
| New web/mobile/API/worker project | Run `/container-plan` after architecture approval | Runtime-specific technical baseline |
| User-facing feature | Run `/ux-plan` after feature scope approval | Flows, states, accessibility, and design-system impact |
| Visual exploration | Run `/prototype` after UX questions are clear | Purpose-driven prototype and evaluation evidence |
| Small obvious fix | Use `build` and request TLC quick mode | Minimal change and focused verification |
| Sprint selection | Run `/backlog`, then `/sprint-plan` | Ordered outcomes and one sprint goal |
| Before implementation | Run `/delivery-review` | Severity-ordered independent findings |
| Resume later | Ask TLC to resume from `.specs/STATE.md` | Verified current state and next safe step |

## Full New-Product Path

Use this path when you want the complete learning-oriented planning experience:

```text
1. delivery-planner + /product
2. grill-me discovery, one question at a time
3. approve PROJECT.md and PRD.md
4. pragmatic DDD discovers language and meaningful boundaries
5. /architecture evaluates options and creates useful C4 views
6. /container-plan defines each approved runtime baseline
7. /backlog converts outcomes into ordered candidates
8. /sprint-plan selects one focused goal
9. TLC specifies the selected feature
10. /ux-plan handles user-facing behavior when relevant
11. TLC creates design and tasks only when complexity justifies them
12. /delivery-review checks the plan independently
13. switch to build for implementation and verification
14. /sprint-review and /sprint-retro complete the feedback loop
```

This is a route, not a mandatory ceremony. TLC uses Lean, Standard, or Extended documentation according to complexity.

## Feature Path

For an existing product:

```text
delivery-planner
  -> inspect project and existing .specs
  -> Specify the feature
  -> UX and DDD only when relevant
  -> Design only when decisions are meaningful
  -> Tasks only when dependency-aware decomposition helps
  -> delivery-reviewer
  -> build
  -> Validate requirements with evidence
```

A single feature specification remains authoritative even when web, mobile, API, worker, or data-store containers are all affected. Container plans describe local technical responsibilities without copying product behavior.

## Quick-Fix Path

Use `build` directly when the change is local, reversible, and introduces no product, domain, dependency, or architecture decision:

```text
Fix the incorrect empty-state label using TLC quick mode. Inspect the existing component, update the smallest scope, and run the focused test.
```

If investigation reveals ambiguity or wider impact, TLC should escalate to a feature specification.

## Planning Artifacts

The default Standard structure is:

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

The planner writes only approved `.specs/**` files. It does not edit application code. Extra artifacts require a unique purpose and approval.

## Using Context7

Context7 supplies current library and framework documentation. Ask naturally:

```text
Check the current Next.js documentation before recommending an authentication pattern.
```

The harness instructs agents to use Context7 after a technology is relevant, not during product discovery.

## Using Notion

Notion is connected as an optional workspace knowledge and documentation tool. Useful requests include:

```text
Search Notion for my previous notes about the Study Planner and summarize only the product decisions.
```

```text
Create a Notion project summary from the approved PRD and architecture. Show me the proposed page content before writing it.
```

```text
Update the existing sprint review page with these validated outcomes.
```

Notion is not the source of truth for project specifications unless you explicitly decide that it should be. By default, `.specs/**` remains version-controlled truth and Notion is used for discovery, summaries, or selected sharing.

Notion reads are allowed. Create, update, move, duplicate, and skill-conversion tools ask for approval. OAuth credentials remain outside Git.

## Using Git And Gitflow

The default branch model for your repositories is:

```text
main
  └── develop
        ├── feature/<name>
        ├── release/<version>
        └── hotfix/<name> starts from main
```

The harness inspects repository conventions before changing branches. It asks before every commit and always asks before pushing, creating a pull request, or publishing a release.

## Safety Boundaries

The global configuration asks before:

- Destructive filesystem or Git commands
- System package installation
- Git pushes, pull requests, releases, and npm publication
- Notion create or modification operations
- External directory access not explicitly allowed by OpenCode

Credentials belong in environment variables, OAuth storage, or a credential manager, never tracked files.

## Daily Usage

At the beginning of work:

```text
Resume this project using TLC. Read STATE.md, inspect Git status, and tell me the next safe step.
```

Before implementation:

```text
/delivery-review review the active feature for implementation readiness
```

During implementation:

```text
Use build. Implement T2 only, verify it, report the result, and ask before committing.
```

At the end of work:

```text
Pause work using TLC and update STATE.md with verified progress, blockers, and the next safe step.
```

## Troubleshooting

Check the harness installation:

```bash
./scripts/doctor.sh
```

Check available models and MCP servers:

```bash
opencode models opencode
opencode mcp list
```

If OpenCode fails because of project configuration, start it with project configuration disabled:

```bash
OPENCODE_DISABLE_PROJECT_CONFIG=1 opencode
```

Return to [`setup.md`](setup.md) for installation and MCP authentication details.
