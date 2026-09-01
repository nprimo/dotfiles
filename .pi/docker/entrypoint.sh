#!/bin/sh
# Container entrypoint: assemble the agent dir inside the pi-agent-home volume,
# then hand off to pi. Runs as the container user (uid/gid match the host).
set -eu

AGENT_DIR="$HOME/.pi/agent"
CONFIG_DIR="/mnt/pi-config"

mkdir -p "$AGENT_DIR"

# Refresh settings/AGENTS.md from the read-only host mount on every start,
# so edits in the dotfiles repo apply without rebuilding the image.
# Sessions, trust.json, models-store.json and installed packages live in the
# volume and survive across runs.
if [ -f "$CONFIG_DIR/settings.json" ]; then
  cp "$CONFIG_DIR/settings.json" "$AGENT_DIR/settings.json"
fi
if [ -f "$CONFIG_DIR/AGENTS.md" ]; then
  cp "$CONFIG_DIR/AGENTS.md" "$AGENT_DIR/AGENTS.md"
fi

exec pi "$@"
