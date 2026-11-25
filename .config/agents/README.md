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
| `apple-design` | [emilkowalski/skills](https://github.com/emilkowalski/skills) | `64eb3de` | MIT, in the skill directory |
| `architect` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `arena` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `automate-me` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `benchmark-checklist` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `blast-radius` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `break-ui` | [emilkowalski/skills](https://github.com/emilkowalski/skills) | `64eb3de` | MIT, in the skill directory |
| `bro` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `correct` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `create-formal-verification-skill` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `create-verification-skill` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `emil-design-eng` | [emilkowalski/skills](https://github.com/emilkowalski/skills) | `64eb3de` | MIT, in the skill directory |
| `figure-it-out` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `how` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `in-your-own-words` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `interrogate` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `ketchup` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `ketchup-video` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `maintain-formal-verification-skill` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `maintain-verification-skill` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `make-bot-ui` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `mobile-native` | [emilkowalski/skills](https://github.com/emilkowalski/skills) | `64eb3de` | MIT, in the skill directory |
| `no-comments` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `poteto-help` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `poteto-mode` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `principle-attack-the-premise` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `principle-boundary-discipline` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `principle-build-the-lever` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `principle-encode-lessons-in-structure` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `principle-exhaust-the-design-space` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `principle-experience-first` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `principle-explain-the-number` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `principle-fix-root-causes` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `principle-foundational-thinking` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `principle-guard-the-context-window` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `principle-laziness-protocol` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `principle-make-operations-idempotent` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `principle-migrate-callers-then-delete-legacy-apis` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `principle-minimize-reader-load` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `principle-model-the-domain` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `principle-never-block-on-the-human` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `principle-outcome-oriented-execution` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `principle-prove-it-works` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `principle-redesign-from-first-principles` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `principle-separate-before-serializing-shared-state` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `principle-sequence-verifiable-units` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `principle-subtract-before-you-add` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `principle-test-behavior-not-implementation` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `principle-type-system-discipline` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `recall` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `reflect` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `reframe` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `security-audit` | [cloudflare/security-audit-skill](https://github.com/cloudflare/security-audit-skill) | `c1c8a8c` | MIT, in the skill directory |
| `setup-pstack` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `sharpen` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `show-me-your-work` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `statechart` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `swarm` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `tdd` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `teach` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `technical-writing` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `typescript-best-practices` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `unslop` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |
| `why` | [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack) | `41e4009` | MIT, in the skill directory |

`emilkowalski/skills` ships no `.claude-plugin/marketplace.json`, so there is no plugin to install; `npx skills add` is the other option, but it writes into `~/.claude/skills` itself and keeps its own lock file, which collides with the symlinks the playbook puts there. Four of its twenty skills are vendored: `emil-design-eng` is the superset of the animation advice and the `animate*` / `review-animations` family restates it, while `animate-expo` and `write-swift` target React Native and Swift. The four `SKILL.md` files cross-reference skills that are not installed; those pointers just go nowhere.

pstack is Lauren Tan's (poteto) skill pack, kept under `pstack/` in `cursor/plugins`. `backnotprop/pstack` is a standalone mirror of it, and the most-installed pstack listing on skills.sh. All 59 of its skills are vendored, because `poteto-mode` routes to the rest and `.claude/rules/pstack-models.md` sets models for roles across the whole set. The rest of `cursor/plugins` is other plugins, none of them vendored. The copy is `pstack/skills`, the tree Cursor and `npx skills add` install, not the generated `harness/pstack/claude-code` tree that the `pstack@cursor-plugins` Claude plugin installs. That tree only adds a line to 22 skills telling Claude to read `../../docs/harness/claude-code.md`, a file outside any skill directory that would not resolve through the `~/.claude/skills/<name>` symlinks. So the skills use Cursor names (`Task`, `generalPurpose`, `~/.cursor/rules/pstack-models.mdc`) and Claude maps them itself; the model rule still reaches every session because Claude Code loads it from `.claude/rules/`. Upstream keeps one `LICENSE` for the whole pack, so each directory gets a copy of `pstack/LICENSE`; copy it back in after re-vendoring. Links to the pstack guide, README, Claude Code adapter, and the `poteto-agent` and `comment-sicko` agents go nowhere. `poteto-mode/scripts/` ships its own `package.json` and `bun.lock` for its `watch-pr` tool; they are upstream's and stay as is.

`npx skills add` (1.9.0) has no option for a target directory. In project scope with `--copy` it writes `./.claude/skills/<name>` and a `./skills-lock.json`, so the most it can do here is fetch into a scratch directory, and `git archive` of a pinned commit gives the same bytes with the commit named up front.

Cloudflare's platform skills are not vendored. They come from the `cloudflare@cloudflare` plugin, declared in `config/agents.yml`, which also brings the Cloudflare API MCP server. Matt Pocock's skills are not vendored either: `mattpocock-skills@claude-plugins-official` carries all 27 of them and updates itself.

## Generated skills

Written by a CLI rather than copied from an upstream repo, so there is no commit to pin. Refresh by letting the tool reinstall it.

| Skill | Generated by | Refresh with |
| --- | --- | --- |
| `rex` | Rex CLI (`rex skill setup`) | `rex skill setup --agent claude` |

`rex`'s stub is a pointer: it tells Claude to run `rex __internal skill`, so the real guide comes from the installed binary. Its text is version-coupled to that binary (the current one bakes in a `--feature-session-naming` flag), which is why it goes stale on a Rex upgrade and must not be hand-edited.

`rex skill setup` also writes a `SessionStart` hook into `~/.claude/settings.json`, and `rex skill status` reports both halves. The hook is declared in `claude_settings` in `config/agents.yml`, so the playbook owns it; keep that command string in step with the installed Rex, and re-run setup here only to regenerate the stub.

Because the skill is symlinked out of this repo, `rex skill setup` writes *through* the symlink and dirties the working tree. That is the intended refresh path, not a bug: it recognises its own stub by `metadata.rex-stub` and leaves a foreign skill of the same name alone.

The Rex app and its `rex` binary are not provisioned by the playbook, so a fresh machine has the skill without the CLI. The hook no-ops safely (`|| true`); the skill does not.

## What's NOT tracked (and why)

`~/.claude.json` is app-written and holds account state, so it stays local. `~/.claude/settings.json` is app-written too: the keys I care about are declared in `config/agents.yml` in the config repo and merged into the live file, so whatever the app owns survives.

Skills and plugins synced from a claude.ai account (`~/.claude/skills/synced/`, `~/.claude/plugins/synced/`) are account-side config. They come back on login, not from the playbook.
