# Personal AI Harness

A portable, version-controlled OpenCode configuration for software development, research, learning, and Markdown writing.

## Current Scope

- Global personal instructions
- Free-model defaults
- Balanced permissions
- Context7 documentation tools
- Optional GitHub MCP integration
- Installation and diagnostic scripts
- A guided, one-question-at-a-time `grill-me` discovery skill
- An adapted TLC Spec-Driven central delivery workflow
- Pragmatic DDD guidance that scales from cohesive modules to explicit layers only when justified
- A lightweight Markdown Scrum workflow with backlog, sprint, review, and retrospective commands
- Adaptive C4 architecture planning with Context, Container, and optional deeper views
- Product and user requirement planning without market-analysis ceremony
- Runtime-specific container planning for web, mobile, API, workers, and data stores
- UX, design-system, accessibility, and prototype planning with optional Kombai or OpenUI handoffs
- A write-restricted planning coach and independent read-only delivery reviewer

## Repository Map

| Path | Purpose |
| --- | --- |
| `opencode.jsonc` | OpenCode runtime, model, MCP, and permission configuration |
| `AGENTS.md` | Personal behavior and workflow instructions |
| `.opencode/agents/` | Specialized agent definitions |
| `.opencode/commands/` | User-invoked repeatable workflows |
| `.opencode/skills/` | On-demand domain knowledge and procedures |
| `docs/` | Architecture, model, and setup documentation |
| `scripts/install.sh` | Installs the repository as the global OpenCode configuration |
| `scripts/doctor.sh` | Checks dependencies, links, and MCP status |
| `.env.example` | Names optional environment variables without storing secrets |

## Start

Read [`docs/architecture.md`](docs/architecture.md) and [`docs/delivery-workflow.md`](docs/delivery-workflow.md), then follow [`docs/setup.md`](docs/setup.md).

Configuration changes require quitting and restarting OpenCode.

## Planning Commands

| Command | Purpose |
| --- | --- |
| `/backlog` | Review, add, refine, or prioritize backlog outcomes |
| `/sprint-plan` | Define a sprint goal and conservatively select Ready work |
| `/sprint-review` | Compare the increment with goal and validation evidence |
| `/sprint-retro` | Reflect and choose one observable process experiment |
| `/architecture` | Plan, map, update, or review the smallest useful C4 view set |
| `/product` | Discover, create, validate, or revise product requirements |
| `/container-plan` | Plan or review a C4 container technical baseline |
| `/ux-plan` | Plan or review journeys, flows, states, accessibility, and responsiveness |
| `/design-system` | Create, extend, or review reusable interface foundations and components |
| `/prototype` | Plan, build, hand off, or evaluate a purpose-driven prototype |
| `/delivery-review` | Independently review planning, traceability, or validation evidence |

## Agents

| Agent | Mode | Purpose |
| --- | --- | --- |
| `delivery-planner` | Primary | Guided planning with writes limited to `.specs/**` |
| `delivery-reviewer` | Subagent | Independent read-only review with findings ordered by severity |

Use `Tab` to select `delivery-planner`. Invoke the reviewer with `@delivery-reviewer` or `/delivery-review`.
