# Harness Architecture

This repository is the personal configuration layer around OpenCode. OpenCode remains the runtime that communicates with models and executes tools.

## Layers

1. `AGENTS.md` defines behavior that should apply in every project.
2. `opencode.jsonc` selects models, permissions, context management, and MCP servers.
3. `.opencode/agents/` contains specialized roles with restricted tools.
4. `.opencode/skills/` contains reusable, on-demand procedures and knowledge, including guided discovery and the central TLC delivery workflow.
5. `.opencode/commands/` contains explicit workflows invoked by the user.
6. Project-level `AGENTS.md` and `opencode.jsonc` files can add or override project-specific requirements.

The pragmatic DDD skill is loaded from TLC's Design phase only when business behavior, invariants, ownership, or boundaries require domain modeling. It does not impose layers on simple work.

## Design Principles

- Keep global instructions general; project conventions belong in each project.
- Add an agent, skill, command, or MCP only when it solves a recurring need.
- Keep credentials outside Git.
- Prefer free models initially while preserving the ability to switch providers.
- Require approval at destructive, system-level, and publishing boundaries.

## Delivery Method

The harness uses one TLC-based lifecycle with composable planning capabilities. C4, pragmatic DDD, UX, Scrum, and container-specific guidance are loaded only when relevant.

See [`delivery-workflow.md`](delivery-workflow.md) for the planning levels, adaptive artifact policy, and coaching model.

## Global Installation

The installation script creates symbolic links in `~/.config/opencode/`. The repository remains the source of truth, so Git can track configuration changes while OpenCode sees them as global configuration.

Existing global paths are renamed with a timestamp before links are created. OpenCode's generated `package.json` and `node_modules/` remain untouched.
