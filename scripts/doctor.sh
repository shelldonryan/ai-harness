#!/usr/bin/env bash

set -u

status=0
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/opencode"

for command_name in opencode git node npm; do
  if command -v "$command_name" >/dev/null 2>&1; then
    printf '[ok] %s: %s\n' "$command_name" "$(command -v "$command_name")"
  else
    printf '[missing] %s\n' "$command_name"
    status=1
  fi
done

if command -v gh >/dev/null 2>&1; then
  printf '[ok] gh: %s\n' "$(command -v gh)"
else
  printf '[optional] gh: not installed (the GitHub MCP integration is disabled until you configure it)\n'
fi

for path in opencode.jsonc AGENTS.md agents commands skills; do
  if [[ -L "$config_dir/$path" ]]; then
    printf '[ok] linked: %s\n' "$config_dir/$path"
  else
    printf '[not linked] %s\n' "$config_dir/$path"
    status=1
  fi
done

if command -v opencode >/dev/null 2>&1; then
  printf '\nOpenCode version:\n'
  opencode --version
  printf '\nMCP status:\n'
  opencode mcp list || status=1
fi

exit "$status"
