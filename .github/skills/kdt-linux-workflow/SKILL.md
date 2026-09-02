---
name: kdt-linux-workflow
description: "Use when validating the KDT Linux workspace, confirming the Conda environment, checking required config and lab files, and verifying a minimal test before running experiments or training."
---

# KDT Linux Workflow

## Purpose

Use this skill to verify that the KDT Linux workspace is in a runnable state before starting analysis, training, or lab tasks. It emphasizes a minimal, evidence-based validation loop instead of jumping straight into heavy commands.

## Workflow

1. Confirm the project context.
   - Identify the workspace root and the relevant directories: `config/`, `env/`, `logs/`, `os-lab/`, and `scripts/`.
   - Check whether the expected Conda environment is `vision-ai`.

2. Validate environment configuration.
   - Review the environment files in `env/` to confirm required packages and naming conventions.
   - Ensure the correct environment is activated before any Python or training commands are run.

3. Inspect the repo for required inputs.
   - Confirm expected files exist in `config/`, `scripts/`, and `os-lab/`.
   - Check for missing artifacts, configuration gaps, or obvious folder mismatches.

4. Run the smallest relevant proof.
   - Prefer a focused check such as `python config/test.py` before broader commands.
   - If the validation fails, inspect the exact error and fix the root cause rather than masking symptoms.

5. Decide the next safe action.
   - If the environment is valid and the minimal probe passes, proceed with the intended task.
   - If a dependency or asset is missing, restore or repair the prerequisite before continuing.
   - If the issue is unclear, isolate the failure to the smallest reproducible command and debug that first.

6. Report readiness.
   - Summarize the environment state, the validation step that passed, and any blockers remaining.
   - State the next command or next action clearly.

## Decision Points

- If the environment is not active: activate the expected environment first.
- If the environment file is missing or inconsistent: compare against the repo’s declared packages and restore the correct environment definition.
- If a required file or directory is absent: stop and fix the workspace setup before running the workflow.
- If a validation command fails: trace the error to the real cause; do not continue with unrelated commands.
- If the task is exploratory: keep validation minimal and incremental rather than broad or expensive.

## Completion Criteria

A task is considered ready to continue only when all of the following are true:

- The correct project root is identified.
- The expected Python environment is active or reproducibly recoverable.
- The required config and lab directories are present.
- A minimal validation command succeeds for the relevant component.
- Any blocker is explicitly documented before proceeding to larger tasks.

## Example Prompts

- "Check whether the KDT Linux workspace is ready to run training."
- "Validate the environment and confirm the repo is set up correctly before I start the lab task."
- "Run the smallest proof that the project is configured correctly and report any blockers."
- "Inspect the environment and config files, then tell me what is missing before I proceed."

## Related Customizations

- Add a workspace-level instruction for repository validation.
- Create a prompt for environment repair and dependency checks.
- Add a task-oriented prompt for experiment launch or dataset validation.
