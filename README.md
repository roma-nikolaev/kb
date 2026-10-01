# kb

Локальная база знаний проекта для агентов. Агент получает просьбу «поправь шапку»
и за десятки миллисекунд видит 1–3 строки «путь — зачем» ещё до `ls`/`grep`/`read`.
Данные базы лежат в репозитории проекта, в `.kb/`, и едут в git вместе с кодом.
Один бинарь `kb` на Rust, без MCP и без сети на горячем пути.

Планирование и задачи ведутся в контрольной панели (`../control-panel`):
OpenSpec change `kb-mvp`, архитектурный спайн (AD-1…AD-22) — в `_bmad-output/` панели
(`planning-artifacts/architecture/architecture-agent-knowledge-base-2026-10-01/`).

## Проверка

```sh
scripts/check.sh
```

Без `Cargo.toml` скрипт ничего не проверяет. С workspace — `cargo fmt`, `clippy -D warnings`,
`cargo test`; бюджетный тест горячего пути в release — когда появится
`crates/kb/tests/budget.rs`.

## Версии

| Что | Версия |
| --- | --- |
| Rust toolchain | 1.99.0, edition 2024 (`rust-toolchain.toml`) |
| Платформы | macOS, Linux |
| Claude Code | проверено спайном 2.1.287; payload фикстур сняты с 2.1.286 |
| Codex CLI | проверено спайном 0.159.3; payload фикстур сняты с 0.159.0 |
