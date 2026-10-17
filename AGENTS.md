# AGENTS.md

Instructions for agents working in the `kb` repository. Project overview is in `README.md`.

Reply to the owner in English. Write all docs, memory-bank pages and commit messages in English.

## How to test

- **Full check:** `scripts/check.sh` from the repository root. This is the same command
  as the task check. The script runs only the parts that exist: without
  `Cargo.toml` it reports there is nothing to check and exits with code 0. With a workspace —
  `cargo fmt --all --check`, `cargo clippy --workspace --all-targets --locked -- -D warnings`,
  `cargo test --workspace --locked`, and, if `crates/kb/tests/budget.rs` exists, the
  hot-path budget test in release.
- **Quick run:** `cargo test -p <crate>` for one crate, e.g.
  `cargo test -p kb`. A single test — `cargo test -p <crate> <test_name>`.
- **Toolchain:** pinned in `rust-toolchain.toml` (1.99.0, components `rustfmt` and
  `clippy`); rustup picks it up automatically. Do not change the version and do not call
  `cargo +<other toolchain>`. If the toolchain is not installed, do not install it yourself —
  tell the owner.
- **Environment setup:** not needed. Tests need no network, `.env` or external services;
  `target/` is created on the first run and is not tracked by git.
- **Forbidden in tests and checks:** installing kb on the machine (`kb setup`) and calling
  `kb remember` / `kb propose` — only the owner does that.

If `kb init` later adds a managed block to this file, the "How to test" section
stays outside it.
