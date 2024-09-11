#!/usr/bin/env bash
set -euxo pipefail

readarray -t PACKAGES < <(find . -mindepth 1 -maxdepth 1 -type d -not -path '*/.*')
pkgctl version check "${PACKAGES[@]}"
