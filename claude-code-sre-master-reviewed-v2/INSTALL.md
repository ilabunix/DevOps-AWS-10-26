# INSTALL.md

## What this master pack contains

- reviewed optimized root `CLAUDE.md`
- 13 specialist agents
- CloudOps PreToolUse guard
- settings snippet
- 11 reusable workflow skills
- ISSUE_INVENTORY template
- application knowledgebase guide

## 1. Root CLAUDE.md

Your previous root file was the very large ~2,600-line version.

This pack contains a consolidated optimized replacement:

`CLAUDE.md`

Recommended action:
- back up your existing `C:\Users\g1lxm01\mohirs-cc\CLAUDE.md`
- replace it with this optimized master `CLAUDE.md`

The optimized version preserves the same major operating model while removing duplicated
instructions and adding the context/agent-efficiency rule.

It does NOT replace or modify:
- `projects\PROJECT_REGISTRY.md`
- existing project folders
- current project history/memory
- existing issue files

## 2. Agents

Copy all files from:

`agents\`

to:

`C:\Users\g1lxm01\.claude\agents\`

Agents:
- aws-architect
- terraform-engineer
- aws-security-reviewer
- sre-reliability
- observability-engineer
- network-engineer
- database-engineer
- cicd-engineer
- software-engineer
- incident-investigator
- validation-reviewer
- project-historian
- app-knowledgebase

## 3. Guard hook

Copy:

`hooks\cloudops-guard.ps1`

to:

`C:\Users\g1lxm01\.claude\hooks\cloudops-guard.ps1`

Merge `settings-snippet.json` into:

`C:\Users\g1lxm01\.claude\settings.json`

Do not overwrite existing settings blindly.

## 4. Issue inventory

If `projects\ISSUE_INVENTORY.md` does not already exist, copy:

`templates\ISSUE_INVENTORY.md`

to:

`C:\Users\g1lxm01\mohirs-cc\projects\ISSUE_INVENTORY.md`

Do not overwrite an existing issue inventory.

## 5. Knowledgebase

Create/use:

`C:\Users\g1lxm01\mohirs-cc\knowledgebase\apps\`

Use the included knowledgebase README as a guide.

## 6. Skills

The `skills\` folder contains reusable workflow definitions:
- project-switch
- terraform-review
- incident-response
- code-change
- change-plan
- knowledgebase-query

These are optional workflow files. The core behavior is already captured by the master CLAUDE.md.

## 7. Restart and verify

Restart Claude Code and verify:
- all 13 agents are visible
- root CLAUDE.md is loaded
- project registry is still intact
- AWS commands are blocked
- terraform plan is blocked
- git add/commit/push are blocked
- internet access asks for approval
- git status and terraform validate remain usable
- project-historian can read the existing PROJECT_REGISTRY.md
- app-knowledgebase is visible


## Review verification

After installation, run a read-only verification prompt:

"Review this workspace configuration in read-only mode. Confirm:
1. the root CLAUDE.md is loaded,
2. all 13 agents are discoverable,
3. PROJECT_REGISTRY.md remains canonical,
4. project-historian knows to checkpoint before switching projects,
5. ISSUE_INVENTORY.md is the cross-project issue index,
6. app-knowledgebase is read-only/local-first,
7. AWS CLI and terraform plan are manual-only,
8. internet/remote access requires approval,
9. specialist handoffs preserve evidence and validation,
10. simple tasks do not spawn unnecessary agents.
Do not modify anything."

Then test the guard in a safe non-production workspace.

## Additional workflow skills
The reviewed v2 pack adds production readiness, RCA, Grafana alert review, AWS architecture review, and deployment validation workflows.
