#!/usr/bin/env bash
set -euo pipefail

# Flags (env):
#   RESET_VOLUMES=false

# RELATIVE PATHS
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEV_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"                       # environments/dev
COMPOSE_FILE="${DEV_DIR}/docker-compose-dev.yml"

compose_cmd() {
  if ! docker compose version >/dev/null 2>&1; then
    echo "Error: 'docker compose' not found or not available in your Docker installation."
    echo "Please upgrade Docker to version 20.10+ where 'docker compose' is included as a plugin."
    exit 1
  fi
  echo "docker compose"
}

COMPOSE="$(compose_cmd)"

start_docker_desktop() {
  systemctl --user start docker-desktop
  sleep 2
}

compose_up() {
  start_docker_desktop

  echo "Pulling images (if needed)…"
  $COMPOSE -f "$COMPOSE_FILE" pull || true

  echo "Building local images (if service uses 'build:')…"
  $COMPOSE -f "$COMPOSE_FILE" build --pull || true

  echo "Starting dev stack…"
  $COMPOSE -f "$COMPOSE_FILE" up -d
}

compose_down() {
  if [[ "${RESET_VOLUMES:-false}" == "true" ]]; then
    echo "RESET_VOLUMES=true -> removing containers and volumes..."
    $COMPOSE -f "$COMPOSE_FILE" down -v || true
  else
    echo "Stopping containers (keeping volumes)..."
    $COMPOSE -f "$COMPOSE_FILE" down || true
  fi
}