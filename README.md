# dotfiles

My own implementation / fork of [Jeff Geerling's dotfiles](https://github.com/geerlingguy/dotfiles) that I use to configure my own macOS systems.

The idea of my configuration files is that they are designed to be "relatively simple" & minimal. However, at the same time offer me a number of productivity enhancements that I have found useful over the years.

`main` is macOS-only for now. My old Linux setup lives on the `omarchy` branch (no longer kept up to date), & the `cloudflare` branch is a copy of `main` with a few extra tweaks for my work machine.

## 📂 What's in here

| Path | Configures |
| --- | --- |
| `.claude/` | Claude Code memory (imports `.config/agents/AGENTS.md`) & rules |
| `.fet` | fet.sh, the system info shown at the start of every shell |
| `.gitconfig` | git identity, SSH commit signing & `github:` / `gh:` URL shortcuts |
| `.gitignore` | Global git excludes (see below) |
| `.hushlogin` | Hides the "Last login" banner in new terminals |
| `.nanorc` | nano syntax highlighting from Homebrew |
| `.nirc` | ni, defaulting to pnpm |
| `.osx` | macOS `defaults` (Finder, Dock, Safari, trackpad, etc.) |
| `.zshrc` | zsh entry point, sources everything in `.config/zsh/` & runs `.fet` |
| `.config/agents/` | Agent instructions (`AGENTS.md`) & shared skills |
| `.config/bat/` | bat (no paging, plain style) |
| `.config/btop/` | btop |
| `.config/ghostty/` | Ghostty terminal & my `orng` light / dark themes |
| `.config/starship.toml` | Starship prompt |
| `.config/zsh/` | zsh history, `PATH`, env vars, plugins, functions & per-tool aliases |

## 🔧 Configure

This repository mirrors my `$HOME` directory, so every file here lives at the same path under `~` (e.g. `.config/ghostty/config` ends up at `~/.config/ghostty/config`). There's no install script in here: it is designed to be used with my [`nurodev/config`](https://github.com/nurodev/config) repository, a playbook that sets up & configures a brand new macOS system and symlinks these files into place.

> [!NOTE]
> `.gitignore` isn't just for this repo. `.gitconfig` sets it as git's global `core.excludesfile`, so anything added to it is ignored in every repo on the machine.

## 🤖 Agents

My agent instructions & skills live in `.config/agents/`. See [`.config/agents/README.md`](.config/agents/README.md) for what's in there & how it's wired up.
