#!/usr/bin/env bash

set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/opencode"
timestamp="$(date +%Y%m%d-%H%M%S)"

mkdir -p "$config_dir"

link_path() {
  local source_path="$1"
  local target_path="$2"

  if [[ -L "$target_path" ]] && [[ "$(readlink -f "$target_path")" == "$(readlink -f "$source_path")" ]]; then
    printf 'Already linked: %s\n' "$target_path"
    return
  fi

  if [[ -e "$target_path" || -L "$target_path" ]]; then
    mv "$target_path" "${target_path}.backup.${timestamp}"
    printf 'Backed up: %s\n' "$target_path"
  fi

  ln -s "$source_path" "$target_path"
  printf 'Linked: %s -> %s\n' "$target_path" "$source_path"
}

link_path "$root_dir/opencode.jsonc" "$config_dir/opencode.jsonc"
link_path "$root_dir/AGENTS.md" "$config_dir/AGENTS.md"
link_path "$root_dir/.opencode/agents" "$config_dir/agents"
link_path "$root_dir/.opencode/commands" "$config_dir/commands"
link_path "$root_dir/.opencode/skills" "$config_dir/skills"

printf '\nOpenCode harness installed. Restart OpenCode to load it.\n'
