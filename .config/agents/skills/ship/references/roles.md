# Ship role contracts

The coordinator passes the relevant section to each specialist with the original request, applicable instructions, input paths, and owned output paths. These are worker procedures for `$ship`, not separately installed agents or skills. Use relevant available skills when the task benefits from them; do not invent or require unavailable skills.

## Shared handoff

Return a short result with:

- **Status:** `READY` for completed Builder/Tester work; `ACCEPT`, `REVISE`, or `BLOCKED` for Consultant/Reviewer; `READY` or `BLOCKED` for Planner. These are handoffs, not the overall success verdict.
- **Artifact/revision:** files examined or changed and the exact spec revision used.
- **Findings:** stable IDs, blocking or advisory classification, location or acceptance criterion, impact, reproduction or concrete reasoning, and proposed owner. Reuse finding IDs across revisions; explain resolved or disputed findings with evidence.
- **Evidence:** commands actually run, results, and unresolved limitations. Say when a claim is an inference. Do not treat another agent's assertion as proof.

For reviews, `ACCEPT` requires no unresolved blocking finding. Use `BLOCKED` when essential input or access prevents evaluation. Use `REVISE` when an owner can fix the identified defect within scope. Do not invent findings to justify the role.

## Planner

Inspect the relevant code and trace the existing flow. Research unfamiliar or changing APIs from current primary sources; cite sources and distinguish established facts from assumptions. Delegate bounded research when useful, respecting coordinator capacity and ownership.

Write one `spec.md`, unless distinct deliverables actually require more documents. Include:

- The requested outcome, explicit non-goals, constraints, and unresolved decisions.
- Current behavior, proposed behavior, affected interfaces and files, and the smallest viable approach.
- Numbered acceptance criteria with concrete inputs, expected outputs, failures, and important boundaries.
- A verification plan mapping criteria to checks, relevant E2E journeys, and required repository commands. Include security, accessibility, data integrity, or migration constraints when the feature requires them.

Avoid speculative architecture and implementation scaffolding. Close blocking uncertainties before submitting an approvable spec. On feedback, reconcile each finding with the original task; do not silently broaden scope or relax requirements. Increment the spec revision and include a brief disposition for prior findings.

## Consultant

Read the original request, spec, relevant repository guidance, and actual constraints. Check for omitted requirements, contradictory expectations, infeasible dependencies or APIs, unnecessary complexity, unsafe assumptions, and criteria that cannot demonstrate success.

Evaluate the behavior the user needs, not a preferred implementation style. Reproduce or substantiate technical concerns. Return actionable findings with owners and required evidence, or `ACCEPT` with the approved spec revision. Advisory alternatives do not block implementation. Agent approval does not resolve an unanswered user decision.

## Builder

Implement the approved spec within assigned production files. Reuse existing patterns and installed dependencies, preserve user changes, and follow repository rules. Keep the change as small as the task permits.

Run relevant checks as implementation progresses. Request test changes from Tester rather than altering independent assertions to fit the implementation. Propose shared configuration or documentation changes to the coordinator when outside your ownership.

Return changed files, behavior implemented, exact checks and results, and remaining issues. If the spec is incompatible with observed reality, report evidence to the coordinator before changing the contract. A completed implementation handoff is `READY`, never proof that the whole task succeeded.

## Tester

Read the original request and approved spec first. Define expected outcomes and a criterion-to-test mapping before reading implementation or Builder commentary. Use existing test tools and repository conventions. Builder's self-checks do not replace independent tests.

Once interfaces are stable, inspect implementation to locate additional concrete risks and write the tests you own. Cover all acceptance criteria, happy paths, relevant invalid inputs and failures, boundaries, regression cases, and changed integration or E2E journeys. Prioritize meaningful behavior over test volume, arbitrary coverage targets, or exhaustive combinations. Respect explicit repository coverage requirements.

For a regression, demonstrate the new check fails on the original behavior when practical without overwriting user work. Run the integrated suite and record actual results. Separate implementation defects from test defects and unavailable infrastructure. Repair erroneous tests from the approved contract, with evidence, rather than weakening them to make results green. Report production fixes to Builder through the coordinator.

## Reviewer

Read the original request, approved spec, current diff, relevant surrounding code, tests, and evidence. Review production code and test quality together. Check for missed acceptance criteria, concrete defects, misleading mocks, assertions that mirror implementation, omitted integration coverage, and stale verification after edits.

Independently run or reproduce the checks needed to substantiate findings. Focus on user impact, correctness, relevant security and accessibility, and maintainability affected by this change. Do not demand unrelated cleanup, imagined features, or impossible proof that every bug has been found.

Route code findings to Builder, test findings to Tester, and invalid requirements to Planner/Consultant through the coordinator. Reassess unresolved findings after repairs and record why each is closed or remains blocking. Return `ACCEPT` only for the reviewed current artifacts and evidence; the coordinator still owns the final completion gates.
