# Shared agent config

One instruction doc and one set of skills, shared by every AI coding agent I use. Content lives here; the symlinks and CLI registries that put it in place live in [`nurodev/config`](https://github.com/nurodev/config) under `config/agents.yml` and `tasks/agents.yml`.

## What's tracked

- **`AGENTS.md`** - my global coding standards. The single source of truth; edit this file and nothing downstream of it.
- **`skills/`** - skills shared by every agent, one directory each. Some are vendored from upstream; see below.

## Vendored skills

Copied in rather than installed through an agent's plugin system, so every agent gets them from one place. Re-vendor by copying the upstream directory over the local one.

| Skill(s) | Upstream | Pinned at | License |
| --- | --- | --- | --- |
| `security-audit` | [cloudflare/security-audit-skill](https://github.com/cloudflare/security-audit-skill) | `c1c8a8c` | MIT, in the skill directory |
| `agents-sdk`, `cf-cli`, `cloudflare`, `durable-objects`, `frameworks-on-cloudflare`, `gateway-workers`, `workers-best-practices`, `workers-profiling`, `wrangler` | [cloudflare/skills](https://github.com/cloudflare/skills) | `5108325` | Apache 2.0, `skills/LICENSE.cloudflare-skills` |

The Cloudflare set keeps its upstream directory names because the skills route to each other by name. Only the nine above are vendored, not the whole upstream set, so some of those routes (`basin`, `k2`, `cloudflare-one`, `sandbox-*`, `turnstile-spin`, `web-perf`, and others) point at skills that are not installed; every one of them also carries a docs URL, so an agent still has somewhere to go.

Claude Code additionally has the full upstream set through the `cloudflare@cloudflare` plugin, so it sees both copies of the nine. The plugin also registers Cloudflare's Code Mode MCP server, which vendoring does not.

## How each agent reads it

| Agent       | Path                               | Mechanism                             |
| ----------- | ---------------------------------- | ------------------------------------- |
| Claude Code | `~/.claude/CLAUDE.md`              | `@../.config/agents/AGENTS.md` import |
| Codex       | `~/.codex/AGENTS.md`               | symlink (it takes no path option)     |
| OpenCode    | `instructions` in `opencode.jsonc` | absolute path                         |

Skills are symlinked into `~/.claude/skills/` and `~/.codex/skills/`.

Claude-only rules go in `.claude/CLAUDE.md` in this repo, below the import line. Claude reads the imported file first, then the rest.

The Claude Code adapter uses a relative import on purpose: `../.config/agents/` resolves correctly both from `~/.claude/` and from `~/dotfiles/.claude/`, so it works whether or not the file is reached through its symlink.

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

`~/.claude.json` is app-written and holds account state, so it stays local. `~/.claude/settings.json` is app-written too: the keys I care about are declared in `config/agents.yml` in the config repo and merged into the live file, so whatever the app owns survives.

Skills and plugins synced from a claude.ai account (`~/.claude/skills/synced/`, `~/.claude/plugins/synced/`) are account-side config. They come back on login, not from the playbook.

## Instruction precedence

Codex concatenates instruction files from the git root down to the working directory (closer files override earlier ones), capped at 32 KiB:

1. `~/.codex/AGENTS.override.md`, else `~/.codex/AGENTS.md` (this global file)
2. Project `AGENTS.md` files, root → cwd

Claude Code loads user instructions (`~/.claude/CLAUDE.md`, and its imports) before project ones, and reads a project `AGENTS.md` when that project has no `CLAUDE.md` of its own.

## Mapping from OpenCode

| OpenCode (`opencode.jsonc`)             | Codex                              |
| --------------------------------------- | ---------------------------------- |
| `instructions: [".../agents/AGENTS.md"]` | `~/.codex/AGENTS.md` (auto-loaded) |
| `mcp` servers                           | `[mcp_servers.*]` in `config.toml` |
| `permission.bash` / `permission.edit`   | `approval_policy` + `sandbox_mode` |
| `default_agent`, `theme`, `autoupdate`  | no direct equivalent (app-managed) |
