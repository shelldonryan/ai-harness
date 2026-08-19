# Personal AI Harness

A portable, version-controlled OpenCode configuration for software development, research, learning, and Markdown writing.

## Current Scope

- Global personal instructions
- Free-model defaults
- Balanced permissions
- Context7 documentation tools
- Connected Notion MCP with approval-gated writes
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

## Quick Start

Install or refresh the global symbolic links:

```bash
./scripts/install.sh
```

Restart OpenCode, open a project directory, and run:

```bash
opencode
```

Use `Tab` to select `delivery-planner` for guided planning, or start directly with a command:

```text
/product help me define a new product through one-question-at-a-time coaching
```

Before implementation, run an independent review:

```text
/delivery-review review the active feature for implementation readiness
```

Then switch to `build` for approved implementation tasks.

Configuration changes require quitting and restarting OpenCode.

## Documentation

| Guide | Purpose |
| --- | --- |
| [`docs/user-guide.md`](docs/user-guide.md) | Usage map, working modes, workflows, prompts, artifacts, Notion, Gitflow, and troubleshooting |
| [`docs/tutorial-study-planner.md`](docs/tutorial-study-planner.md) | Small guided example from product idea through sprint feedback |
| [`docs/delivery-workflow.md`](docs/delivery-workflow.md) | TLC lifecycle, planning levels, adaptive artifacts, DDD, C4, Scrum, and traceability |
| [`docs/architecture.md`](docs/architecture.md) | How the harness itself is structured |
| [`docs/model-strategy.md`](docs/model-strategy.md) | Free-model defaults and provider policy |
| [`docs/setup.md`](docs/setup.md) | Installation, diagnostics, and MCP authentication |

## Commands

| Command | Agent | Purpose |
| --- | --- | --- |
| `/backlog` | `delivery-planner` | Review, add, refine, or prioritize backlog outcomes |
| `/sprint-plan` | `delivery-planner` | Define a sprint goal and conservatively select Ready work |
| `/sprint-review` | `delivery-planner` | Compare the increment with goal and validation evidence |
| `/sprint-retro` | `delivery-planner` | Reflect and choose one observable process experiment |
| `/architecture` | `delivery-planner` | Plan, map, update, or review the smallest useful C4 view set |
| `/product` | `delivery-planner` | Discover, create, validate, or revise product requirements |
| `/container-plan` | `delivery-planner` | Plan or review a C4 container technical baseline |
| `/ux-plan` | `delivery-planner` | Plan or review journeys, flows, states, accessibility, and responsiveness |
| `/design-system` | `build` | Create, extend, or review reusable interface foundations and components |
| `/prototype` | `build` | Plan, build, hand off, or evaluate a purpose-driven prototype |
| `/delivery-review` | `delivery-reviewer` | Independently review planning, traceability, or validation evidence |

## Agents

| Agent | Mode | Purpose |
| --- | --- | --- |
| `delivery-planner` | Primary | Guided planning with writes limited to `.specs/**` |
| `delivery-reviewer` | Subagent | Independent read-only review with findings ordered by severity |

Use `Tab` to select `delivery-planner`. Invoke the reviewer with `@delivery-reviewer` or `/delivery-review`.
