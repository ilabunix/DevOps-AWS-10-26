# Skill: Production Readiness Review

Use when reviewing whether an application, infrastructure change, or service is ready for production.

Workflow:
1. Recover project and environment context.
2. Establish architecture and critical dependencies.
3. Review security, reliability, observability, capacity, quotas, backup/DR, deployment, rollback, and ownership.
4. Use specialists only where relevant:
   - aws-architect
   - aws-security-reviewer
   - sre-reliability
   - observability-engineer
   - network-engineer
   - database-engineer
   - cicd-engineer
5. Identify blockers, risks, assumptions, and missing evidence.
6. Use validation-reviewer for the final readiness decision.
7. Checkpoint project-historian.

Return:
- Readiness status
- Critical blockers
- High/medium risks
- Validation still required
- Manual actions
- Rollback readiness
- Recommended next step
