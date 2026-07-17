# Codex config

Global setup for [OpenAI Codex](https://developers.openai.com/codex). Codex reads everything from `$CODEX_HOME` (`~/.codex/`). The dotfiles repo root maps to `$HOME`, so `.codex/AGENTS.md` here deploys to `~/.codex/AGENTS.md`.

## What's tracked

- **`AGENTS.md`** - my global coding standards, auto-loaded by Codex for every session. Direct port of `~/.config/opencode/INSTRUCTIONS.md`. This is the single source of truth; edit it here, then copy to `~/.codex/AGENTS.md`.

## What's NOT tracked (and why)

`~/.codex/config.toml` is **managed by the ChatGPT desktop app** (it rewrites model, trust levels, marketplaces, plugins, and the bundled `node_repl` / `computer-use` MCP servers). Tracking it would fight the app, so it stays local. The only pieces I add by hand are the MCP servers below, ported from `opencode.jsonc`. Re-apply them by appending to `~/.codex/config.toml` if the file is ever reset:

```toml
[mcp_servers.cf-portal]
enabled = true
url = "https://portal.mcp.cfdata.org/mcp"

[mcp_servers.grep_app]
enabled = true
url = "https://mcp.grep.app"

[mcp_servers.chrome-devtools]
args = ["-y", "chrome-devtools-mcp@latest"]
command = "bunx"
enabled = false

[mcp_servers.cloudflare-builds]
auth = "oauth"
enabled = false
url = "https://builds.mcp.cloudflare.com/mcp"

[mcp_servers.cloudflare-observability]
auth = "oauth"
enabled = false
url = "https://observability.mcp.cloudflare.com/mcp"
```

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
