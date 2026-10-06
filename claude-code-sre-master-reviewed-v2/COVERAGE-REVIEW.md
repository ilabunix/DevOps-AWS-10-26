# COVERAGE-REVIEW.md

## Purpose

This document records the review performed when optimizing the former ~2,600-line
Senior AWS/SRE CLAUDE.md into the reviewed master version.

The goal was not merely to shorten it. The goal was to preserve the prior operating
capabilities while moving specialist detail into agents and keeping the root policy
more effective.

## Preserved / strengthened areas

The reviewed root CLAUDE.md explicitly covers:

- senior engineering mindset and evidence discipline
- corporate data handling
- workspace/project preservation
- PROJECT_REGISTRY.md
- ISSUE_INVENTORY.md
- automatic checkpointing before project switches
- exact resume state
- main-agent orchestration
- specialist routing
- delegation context packets
- structured agent handoffs
- cross-agent conflict resolution
- token/context efficiency
- user communication
- hard AWS/Terraform/Git/destructive-command boundaries
- internet/download approval boundary
- environment/account/region/partition awareness
- Git safety and conflict preservation
- Terraform modules/providers/state/address stability/drift
- CI/CD and promotion controls
- software engineering/testing
- error handling/idempotency/pagination/rate limits/timezones
- naming/tagging
- IAM/SCP/boundaries/PassRole
- KMS/secrets/encryption
- networking/TLS/DNS
- ALB/NLB health checks
- ECS/EKS
- Lambda
- API Gateway
- S3
- DynamoDB
- RDS/Aurora
- CloudFront/WAF
- messaging/event-driven services
- database migrations including Oracle -> PostgreSQL
- observability/Grafana/CloudWatch
- logging/retention/auditability
- incident response
- RCA
- SRE/reliability
- DR/backups
- capacity/quotas/performance
- dependencies/third parties
- maintenance/version lifecycle
- cost awareness
- multi-account/multi-region
- change planning
- runbooks/playbooks
- local application knowledgebase
- validation reviewer
- project historian
- manual action quality
- documentation/evidence artifacts
- stop conditions

## What was intentionally removed

The optimization removes repetition, not core capability.

Examples:
- repeated warnings about the same blocked AWS/Terraform/Git action
- repeated generic least-privilege statements
- repeated "inspect before changing" language in every service section
- large duplicated handoff prose now standardized across agents
- generic AWS service explanations that did not change engineering behavior

## What moved to agents

Deep specialist behavior is delegated to:
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

## No-loss design

The primary agent owns the canonical task state.
Sub-agents return evidence + findings + proposed changes + validation + approval needs.
The primary agent synthesizes those results.
The project historian receives the synthesized state at meaningful checkpoints.
This prevents a project history from becoming a collection of disconnected agent outputs.

## Important implementation note

Hook syntax/tool names can vary by Claude Code build. The included guard expresses the
intended policy, but after installation it should be tested in a safe workspace to verify
that the corporate Claude Code build actually invokes the hook for the expected shell/web
tool names. The policy in CLAUDE.md still applies even if a hook matcher needs adjustment.
