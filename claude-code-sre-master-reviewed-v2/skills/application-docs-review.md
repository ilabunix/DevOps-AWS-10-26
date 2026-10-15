---
name: application-docs-review
description: Review an application's playbooks, runbooks, architecture/design documentation, monitoring/alerting guidance, known issues, and app-specific nuances for completeness, consistency, CloudOps usability, and production support readiness.
---

# Application Documentation Review

Use this skill when the user asks to review application documentation, architecture/design material, playbooks/runbooks, operational nuances, monitoring coverage, or production-support readiness.

The user should not need to explicitly name this skill.

## Relationship to Existing Agent

This skill complements the existing `app-knowledgebase` agent:
- `app-knowledgebase` answers: **What do our local application documents say?**
- `application-docs-review` answers: **Are those documents complete, consistent, operationally useful, and sufficient for CloudOps?**

Use `app-knowledgebase` for local document retrieval when useful.

## Review Scope

Review applicable material such as:
- application overview
- architecture/design
- AWS services/dependencies
- request/data flows
- environment differences
- security/IAM assumptions
- networking
- databases/data flows
- scheduled/batch jobs
- integrations
- monitoring/alerts/dashboards/logging
- playbooks/runbooks
- recovery and DR/HA behavior
- maintenance procedures
- known issues
- ownership/escalation
- app-specific limitations and nuances

## Source Priority

Use:
1. current approved application documentation
2. existing playbooks/runbooks
3. architecture/design documents
4. current project documentation
5. local application knowledgebase
6. existing alert/dashboard definitions
7. user-provided evidence
8. clearly labeled engineering inference

Never invent missing application behavior.

## Review Modes

### QUICK REVIEW
For one playbook/runbook or a small documentation set.

### FULL OPERATIONAL READINESS REVIEW
For a complete application handoff or production-support assessment.

### ALERT-TO-DOC REVIEW
Compare deployed/planned alerts with documented failure scenarios and operator procedures.

### DOC-TO-ALERT REVIEW
Identify documented failure scenarios that lack sufficient monitoring/alerts.

## Core Review Questions

Determine:
- What does the application do?
- What are the critical components/dependencies?
- What can fail?
- How would CloudOps know?
- What alerts exist?
- What should CloudOps check first?
- What action is safe for CloudOps?
- What requires application-team involvement?
- What indicates recovery?
- What differs by environment?
- What known quirks/limitations exist?
- What is undocumented or ambiguous?
- What would an on-call engineer be forced to guess?

## Architecture / Design Review

Check whether documentation clearly identifies:
- components/services
- data flow
- ingress/egress
- internal/external dependencies
- regions/accounts/environments
- network paths
- authentication/authorization
- storage/databases
- queues/events
- scheduled jobs
- failure domains
- HA/DR behavior
- scaling/capacity considerations
- deployment model
- operational ownership

Flag contradictions between diagrams and written documentation.

## Playbook / Runbook Review

Check for:
- purpose/scope
- trigger/condition
- symptoms
- expected impact
- prerequisites/access
- initial checks
- exact log/metric/dashboard locations
- ordered procedures
- expected result for each major check
- failure branches
- escalation criteria
- recovery validation
- resolution criteria
- references
- ownership
- environment-specific differences

Do not accept vague instructions like "check logs" without a location/query when source material should provide one.

## Alert and Monitoring Alignment

When alert definitions are available, compare:
- alert name
- trigger/query/metric
- threshold/evaluation window
- severity
- affected service/job
- documented meaning
- CloudOps action
- escalation
- recovery behavior

Identify:
- alerts with no usable playbook
- playbook scenarios with no alert
- generic alerts that cannot identify the affected workflow
- stale alert names/queries
- missing dashboard/log references
- mismatched severity/priority
- alerts that resolve automatically while the underlying issue may remain unresolved

## Application Nuances

Create a concise `Operational Nuances` section when relevant.

Examples include documented/verified processing lag, scheduled Friday-night behavior, informational-only alerts, environment-specific endpoints/log streams, benign errors, manual dependencies, blue/green behavior, upstream/downstream timing, maintenance windows, and stateful recovery considerations.

Only include documented or verified nuances.

## Collaboration

Use specialists only when useful:
- `app-knowledgebase` for local documentation retrieval
- `aws-architect` for architecture gaps
- `observability-engineer` for alerts/logs/dashboards
- `network-engineer` for network design gaps
- `database-engineer` for database/data-flow concerns
- `sre-reliability` for failure-mode/DR/readiness gaps
- `aws-security-reviewer` for security/access concerns
- `validation-reviewer` for high-impact final review

Avoid over-agenting.

## Output Format

### Executive Summary
Is the documentation sufficient for CloudOps support?

### Application Understanding
Concise architecture, dependencies, and operating model.

### Operational Nuances
Important app-specific behaviors CloudOps must know.

### Documentation Strengths
What is clear/useful.

### Gaps / Missing Information
For each gap include severity, missing/unclear item, why it matters, and recommended owner/input.

### Playbook / Runbook Findings
Completeness and usability findings.

### Monitoring / Alert Alignment
Where alerts and documentation align or diverge.

### Architecture / Design Concerns
Unclear, contradictory, or operationally risky design documentation.

### Questions for Application Team
Concise actionable questions needed to close gaps.

### Recommended Documentation Updates
Specific changes recommended.

### Source Material Reviewed
Exact local files/docs used.

## Project Continuity

After a meaningful review, invoke `project-historian` to record documents reviewed, significant gaps, questions for the application team, decisions, alert/playbook changes needed, and exact next step.
