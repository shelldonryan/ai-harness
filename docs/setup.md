# Setup

## Install Globally

From this repository, run:

```bash
./scripts/install.sh
```

The script backs up existing conflicting OpenCode paths and creates symbolic links into `~/.config/opencode/`.

Quit and restart OpenCode after installation because configuration is loaded only at startup.

## Check The Installation

```bash
./scripts/doctor.sh
```

## Context7

Context7 is enabled without authentication. A free API key can provide higher rate limits. If one is used, export it before starting OpenCode:

```bash
export CONTEXT7_API_KEY="your-key"
```

Never add the real value to `.env.example` or another tracked file.

## Notion MCP

Notion is enabled as a remote OAuth MCP server:

```json
"notion": {
  "type": "remote",
  "url": "https://mcp.notion.com/mcp",
  "enabled": true
}
```

Check its status with:

```bash
opencode mcp list
opencode mcp auth list
```

Authenticate or replace an expired session with:

```bash
opencode mcp auth notion
```

Remove local Notion OAuth credentials with:

```bash
opencode mcp logout notion
```

OAuth credentials are managed by OpenCode outside this repository. The harness allows Notion reads and asks for approval before create, update, move, duplicate, or skill-conversion operations.

## GitHub MCP

The GitHub MCP definition is included but disabled until authentication is configured.

1. Create a fine-grained GitHub personal access token with only the repositories and permissions needed.
2. Export it before starting OpenCode:

```bash
export GITHUB_PERSONAL_ACCESS_TOKEN="your-token"
```

3. Change `mcp.github.enabled` to `true` in `opencode.jsonc`.
4. Restart OpenCode and run `opencode mcp list`.

The configured toolsets are limited to repository context, repositories, issues, and pull requests to reduce token usage.
