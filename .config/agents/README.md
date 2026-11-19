# Agent config

One instruction doc and one set of skills for Claude Code. Content lives here; the symlinks and CLI registries that put it in place live in [`nurodev/config`](https://github.com/nurodev/config) under `config/agents.yml` and `tasks/agents.yml`.

## What's tracked

- **`AGENTS.md`** - my global coding standards. The single source of truth; edit this file and nothing downstream of it.
- **`skills/`** - skills shared across projects, one directory each.

## How Claude reads it

`~/.claude/CLAUDE.md` imports the instruction doc with `@../.config/agents/AGENTS.md`, and skills are symlinked into `~/.claude/skills/`.

The import is relative on purpose: `../.config/agents/` resolves correctly both from `~/.claude/` and from `~/dotfiles/.claude/`, so it works whether or not the file is reached through its symlink. That is also why the playbook keeps a `~/.config/agents` symlink pointing here.

Claude-only rules go in `.claude/CLAUDE.md` in this repo, below the import line. Claude reads the imported file first, then the rest.

Claude Code loads user instructions (`~/.claude/CLAUDE.md`, and its imports) before project ones, and reads a project `AGENTS.md` when that project has no `CLAUDE.md` of its own.

## Vendored skills

Copied in rather than installed from a marketplace. Re-vendor by copying the upstream directory over the local one.

| Skill | Upstream | Pinned at | License |
| --- | --- | --- | --- |
| `security-audit` | [cloudflare/security-audit-skill](https://github.com/cloudflare/security-audit-skill) | `c1c8a8c` | MIT, in the skill directory |

Cloudflare's platform skills are not vendored. They come from the `cloudflare@cloudflare` plugin, declared in `config/agents.yml`, which also brings the Cloudflare API MCP server.

## What's NOT tracked (and why)

`~/.claude.json` is app-written and holds account state, so it stays local. `~/.claude/settings.json` is app-written too: the keys I care about are declared in `config/agents.yml` in the config repo and merged into the live file, so whatever the app owns survives.

Skills and plugins synced from a claude.ai account (`~/.claude/skills/synced/`, `~/.claude/plugins/synced/`) are account-side config. They come back on login, not from the playbook.
