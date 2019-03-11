#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

export RUST_BACKTRACE=1

# Ensure everything is run and tested with the same nightly version
ci/check-nightly-version.sh

# Install extra rustup components
rustup component add rustfmt

# Check if the code is good
cargo test --all --locked
cargo fmt --all -- --check
