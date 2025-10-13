#!/usr/bin/env bash
set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/base.sh"
RESET_VOLUMES="true" compose_down
compose_up