# ─────────────────────────────────────────
# Login bash (`bash -lc`) skips the zsh files, but some tools run commands
# that way regardless of the login shell (e.g. Capy agents). Reuse the zsh
# PATH setup, which is plain POSIX sh.
# ─────────────────────────────────────────
if [ -f "$HOME/.zshenv" ]; then
	. "$HOME/.zshenv"
fi
