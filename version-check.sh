#!/usr/bin/env bash
set -euxo pipefail

readarray -t PACKAGES < <(
  find . -type f -name '.nvchecker.toml' -printf '%h\n' | sort -u
)
pkgctl version check "${PACKAGES[@]}"
