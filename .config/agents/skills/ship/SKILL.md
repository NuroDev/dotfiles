---
name: ship
description: Complete a coding task through a coordinated multi-agent planning, building, testing, and review loop. Use when the user invokes $ship, requests /ship, or explicitly asks for this end-to-end build workflow.
---

# Ship

Act as the coordinator. Take the user's coding task through the roles in [references/roles.md](references/roles.md), repair actionable defects, and report a verified result. This skill guides work inside the active chat; it does not install a background runner or register a custom slash command. Codex's explicit skill invocation is `$ship`.

## Start and retain state

Read the applicable repository instructions and inspect the existing implementation before dispatching work. State material assumptions. Resolve repository facts yourself; request missing product decisions when they affect correctness and continue independent work while waiting.

Default delivery is verified local changes. Include a PR, deployment, or other external action only when authorized by the user's task. Approval by an agent never grants user permission. Honor existing requirements for dependency installation and protected actions.

Record the initial Git status, existing user changes, applicable verification commands, and baseline failures. Preserve user work. Prefer existing code, native features, and installed tools. Do not install dependencies to make the workflow itself run.

Use a unique temporary directory for `spec.md` and `run.md` unless the user supplies an artifact destination. Share its absolute path in progress updates and preserve it across context compaction. Do not create a `plans/` documentation system. Promote only lasting project decisions into the repository's established documentation.

Keep `run.md` compact: original request, assumptions, artifact paths, current phase, spec revision, acceptance checklist, agent assignments, findings and their disposition, command results, loop counts, and final status. Only the coordinator writes this shared log. Save enough evidence to resume without trusting conversation memory.

Default limits are **two specification revisions** and **three implementation repair rounds**, in addition to the initial reviews. Record any user-specified limits instead. An implementation repair round includes fixes by Builder or Tester, verification, and review. Reopening the spec consumes the same specification budget; it never resets either counter.

## Dispatch specialists

Read the role contracts before dispatch. Use the subagent tools actually available in the host. Do not create sidebar chats or launch nested Codex processes for these roles. Respect the available concurrency limit, schedule phases as needed, and inherit the configured model unless the user requests another available model.

Give each specialist its role instructions, the original request, relevant repository guidance, exact input paths, expected output, and permitted write paths. Workers do their assigned role; they do not recursively invoke `$ship` or start their own build loops. Planner may use scoped research subagents when capacity permits.

Give Consultant, Tester, and Reviewer a fresh context containing task artifacts and relevant code, rather than the Builder's reasoning or claims. Preserve their independent judgment. If independent subagents are unavailable, continue useful preparation but report that missing gate; do not describe one agent's role switching as independent review.

Assign one writer per file at a time. Consultant and Reviewer read only. Planner owns the spec; Builder owns production code; Tester owns tests. Parallelize research and test design. Serialize overlapping edits, shared configuration changes, and verification that depends on a stable tree. Have workers return proposed changes outside their ownership to the coordinator.

## Run the loop

1. **Planner:** Draft the smallest complete spec with measurable acceptance criteria and a verification plan.
2. **Consultant:** Compare the spec with the original request and actual repository constraints. On `REVISE`, send only actionable findings to Planner, increment the specification revision count, and review the revised spec. On `ACCEPT`, record the approved revision. Do not implement while a blocking product decision remains unanswered.
3. **Builder and Tester:** Start implementation and independent test design from the approved spec. Tester defines expected behavior before reading implementation. Builder runs its own relevant checks. Once interfaces and affected files are stable, Tester implements and runs the independent tests against the integrated code.
4. **Reviewer:** Inspect the spec, implementation, tests, and verification evidence. On `REVISE`, route production defects to Builder and test defects to Tester. Apply only necessary repairs, increment the repair count, rerun affected checks, and return to Reviewer. Reopen Planner and Consultant only when evidence invalidates an approved requirement or assumption.
5. **Final verification:** After repairs and documentation updates, run every required check against the final tree. Give Reviewer the final evidence and current artifacts. Any subsequent edit invalidates affected evidence and approval. Continue within the remaining budget until the completion gates hold.
6. **Speaker:** The coordinator delivers the final result using the reporting contract below. A separate reporting subagent is unnecessary.

Treat reviewer preferences and speculative features as nonblocking unless they violate a requirement or repository rule. Concrete in-scope defects remain blocking regardless of severity. Do not expand scope, weaken acceptance criteria, skip required checks, delete failing tests, or reduce assertions merely to obtain approval. A legitimate change to expected behavior must reconcile the original request through Planner and Consultant, with a user decision when needed.

## Completion and stopping

Declare `SUCCESS` only when all of these hold:

- Every approved acceptance criterion has observable evidence from the final implementation.
- Required formatting, linting, typechecking, tests, and applicable builds pass. Discover and run the active repository's required commands from its instructions and configuration. If a check is absent, record that explicitly; if required verification is unavailable or failing, success is blocked.
- Changed user journeys and integration boundaries have appropriate E2E evidence using existing tools. Unit tests alone do not prove an affected browser, CLI, network, or deployment flow works. Document any approved manual verification and its limits.
- Reviewer accepts the current implementation and tests with no unresolved in-scope defect, and Consultant approval matches the current spec.
- Applicable documentation reflects the final behavior. Review and update the active repository's existing documentation where the change requires it.

Baseline failures stay visible and cannot be relabeled as passing. Distinguish them from regressions, fix only within authorized scope, and report incomplete when they prevent a required gate.

Stop with `INCOMPLETE` when another revision or repair is needed after its loop budget is exhausted, essential input or authorization is missing, required infrastructure is unavailable, or two consecutive repair rounds leave the same blocking findings unresolved with no new evidence. Evaluate the final allowed round before applying the budget stop. Name the unresolved findings, attempted fixes, failing or unavailable commands, and the next concrete action. Do not rerun identical failures indefinitely or label exhausted retries successful. Resume from recorded state when the user supplies the missing input or extends the budget; revalidate changed artifacts before reusing approval.

## Speaker report

Lead with `SUCCESS` or `INCOMPLETE`. State what was built, the relevant stack, how to use it, and material limitations. Link the resulting files or authorized delivery artifact and the spec/evidence log when useful.

Include measured process statistics: elapsed time when recorded, specialists used, specification revisions, repair rounds, changed files or lines attributable to this task, and actual verification results. Report test counts or coverage only from tool output. Report token usage or cost only when telemetry supplies it, never estimate it from agent count or duration. Do not claim exhaustive testing or absence of all possible bugs.
