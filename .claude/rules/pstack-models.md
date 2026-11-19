# pstack model configuration. One line per role. Delete a line to fall back to the skill default.
# `inherit-parent` or `auto` as a value: the role runs on the parent chat model (omit Task `model` and spawn `generalPurpose`). Alias entries in a panel list still count toward its fan-out.
# defaults: 3
# budget: medium (high)
feature, refactoring: opus high
bug-fix: opus high
perf-issue: opus high
hillclimb: opus high
judgment and prose: opus high
arena runners: fable medium, opus medium, inherit-parent
arena cross-judge pool: opus medium, inherit-parent
swarm workers: opus medium
interrogate reviewers: fable medium, opus medium, inherit-parent
