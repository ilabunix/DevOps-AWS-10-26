# Skill: Grafana Alert Review

Use for Grafana alert rules, notification routing, dashboard-to-alert consistency, and alert quality reviews.

Workflow:
1. Recover project/environment/Grafana-org context.
2. Identify alert source:
   - CloudWatch metrics
   - CloudWatch Logs Insights
   - SQL/Redshift
   - other datasource
3. Use observability-engineer.
4. Add terraform-engineer or cicd-engineer only if alert provisioning is IaC/pipeline-managed.
5. Review:
   - query correctness
   - dimensions/labels
   - threshold
   - evaluation window
   - missing/no-data behavior
   - error behavior
   - severity/priority
   - notification policy
   - duplicate/noisy conditions
   - runbook/playbook linkage
   - dashboard consistency
6. Validate against representative data/log samples where available.
7. Use validation-reviewer for meaningful production alert changes.
8. Checkpoint project-historian.

Return:
- Alert purpose
- Query/condition findings
- Noise/miss risk
- Routing findings
- Recommended change
- Validation required
