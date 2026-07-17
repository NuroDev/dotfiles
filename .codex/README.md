# Codex config

Global setup for [OpenAI Codex](https://developers.openai.com/codex). Codex reads everything from `$CODEX_HOME` (`~/.codex/`). The dotfiles repo root maps to `$HOME`, so `.codex/AGENTS.md` here deploys to `~/.codex/AGENTS.md`.

## What's tracked

- **`AGENTS.md`** - my global coding standards, auto-loaded by Codex for every session. Direct port of `~/.config/opencode/INSTRUCTIONS.md`. Single source of truth; edit here, then copy to `~/.codex/AGENTS.md`.
- **`config.toml`** - the portable, user-owned baseline: model prefs + my MCP servers (ported from `opencode.jsonc`). See the caveat below before symlinking it.

## config.toml: the overwrite caveat

`~/.codex/config.toml` is **also managed by the ChatGPT desktop app**, which rewrites model, per-project `trust_level`, `marketplaces` (with timestamps), `plugins`, and the bundled `node_repl` / `computer-use` MCP servers. The tracked `config.toml` here intentionally holds **only** the portable keys and omits all of that machine-specific state.

If you symlink `~/.codex/config.toml` → this file, two things can go wrong:

1. **The app writes through the symlink**, polluting this tracked file with machine-specific churn (absolute paths, timestamps, trust decisions) that then shows up in `git status`.
2. **The app replaces the symlink** with a regular file, silently breaking the link.

**Verify before relying on it:** create the symlink, then trigger a config write in the app (trust a project, or toggle a setting), and check `ls -l ~/.codex/config.toml` still points here and `git -C ~/dotfiles status` is clean. The standalone `codex` CLI (npm `@openai/codex`) is far less aggressive about rewriting config than the desktop app, so the symlink is safer there.

## Instruction precedence

Codex concatenates instruction files from the git root down to the working directory (closer files override earlier ones), capped at 32 KiB:

1. `~/.codex/AGENTS.override.md`, else `~/.codex/AGENTS.md` (this global file)
2. Project `AGENTS.md` files, root → cwd

## Mapping from OpenCode

| OpenCode (`opencode.jsonc` / `INSTRUCTIONS.md`) | Codex                              |
| ----------------------------------------------- | ---------------------------------- |
| `instructions: [".../INSTRUCTIONS.md"]`         | `~/.codex/AGENTS.md` (auto-loaded) |
| `mcp` servers                                   | `[mcp_servers.*]` in `config.toml` |
| `permission.bash` / `permission.edit`           | `approval_policy` + `sandbox_mode` |
| `default_agent`, `theme`, `autoupdate`          | no direct equivalent (app-managed) |
