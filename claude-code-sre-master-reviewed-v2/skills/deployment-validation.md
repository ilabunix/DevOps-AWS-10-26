# Skill: Deployment Validation

Use before and after a deployment/change to verify readiness and service health.

Pre-deployment:
1. Recover project/change context.
2. Confirm target environment/account/region.
3. Review proposed diff/change scope.
4. Confirm prerequisites and rollback.
5. Confirm monitoring/alerts are available.
6. Identify manual steps and approvals.

Post-deployment:
1. Validate application/service health.
2. Validate expected infrastructure state from user-provided evidence.
3. Review logs/metrics/alerts.
4. Run documented smoke/steady-state checks when available.
5. Confirm no unexpected errors, degradation, or alert noise.
6. Confirm rollback is no longer needed or remains available.
7. Record validation evidence.
8. Checkpoint project-historian.

Use validation-reviewer for high-impact changes.

Return:
- Deployment status
- Checks completed
- Evidence
- Failures/warnings
- Rollback recommendation
- Remaining observation window
- Final readiness/state
