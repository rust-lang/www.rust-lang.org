#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Extract the nightly version from all the places we declared it in
rust_toolchain="$(cat rust-toolchain)"
rust_config="$(cat RustConfig | sed -E 's/^VERSION=(nightly-[0-9]{4}-[0-9]{2}-[0-9]{2})$/\1/')"
travis_yml="$(cat .travis.yml | grep '^rust: ' | head -n 1 | sed -E 's/^rust: (nightly-[0-9]{4}-[0-9]{2}-[0-9]{2})$/\1/')"

# Ensure all the configuration files points to the same nightly
check() {
    if [[ "$2" != "${rust_toolchain}" ]]; then
        echo "error: the nightly version in $1 is different than the one in rust-toolchain!" 1>&2
        exit 1
    fi
}
check RustConfig "${rust_config}"
check .travis.yml "${travis_yml}"

echo "all the configuration files points to the same nightly!"
