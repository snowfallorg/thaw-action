#!/usr/bin/env bash
set -euo pipefail

if [[ -n "$FLAKE_PATH" ]]; then
	cd "$FLAKE_PATH"
fi

nix_options=()
if [[ -n "$NIX_OPTIONS" ]]; then
	for option in $NIX_OPTIONS; do
		nix_options+=("${option}")
	done
fi

if [[ -n "$TARGET_INPUTS" ]]; then
	nix "${nix_options[@]}" run "${THAW_URI}" -- "$TARGET_INPUTS"
else
	nix "${nix_options[@]}" run "${THAW_URI}"
fi

if [[ -z "$(git status --porcelain flake.nix flake.lock)" ]]; then
	echo "No changes to commit"
	exit 1
fi

nix "${nix_options[@]}" flake lock
