#!/usr/bin/env bash

set -euo pipefail

screens_dir="${HOME}/Pictures/Screenshots"
timestamp="$(date +%Y-%m-%d_%H-%M-%S)"
outfile="${screens_dir}/screenshot-${timestamp}.png"

mkdir -p "${screens_dir}"

geometry="$(slurp)"
[ -n "${geometry}" ]

grim -g "${geometry}" "${outfile}"
wl-copy < "${outfile}"
dms notify "Screenshot saved" "$(basename "${outfile}") copied to clipboard" --file "${outfile}" --icon "${outfile}" --app "Screenshot" --timeout 3500
