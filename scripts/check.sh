#!/usr/bin/env bash
# Единая проверка проекта (design D1 change kb-mvp): запускает только существующие части.
set -euo pipefail
# Диспетчер панели запускает проверки с минимальным PATH.
export PATH="$HOME/.cargo/bin:/opt/homebrew/bin:/usr/local/bin:$PATH"
cd "$(dirname "$0")/.."

if [[ ! -f Cargo.toml ]]; then
  echo "check: Cargo.toml пока нет — проверять нечего"
  exit 0
fi

echo "== cargo fmt"
cargo fmt --all --check
echo "== cargo clippy"
cargo clippy --workspace --all-targets --locked -- -D warnings
echo "== cargo test"
cargo test --workspace --locked

if [[ -f crates/kb/tests/budget.rs ]]; then
  echo "== бюджет горячего пути (release)"
  cargo test --release -p kb --test budget --locked
fi
