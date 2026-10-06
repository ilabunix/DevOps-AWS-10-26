# Skill: AWS Architecture Review

Use for application/platform architecture reviews, migration designs, HA/DR designs, and major AWS changes.

Workflow:
1. Recover project and architecture context.
2. Use aws-architect as lead specialist.
3. Establish:
   - request/data/control flow
   - accounts
   - regions
   - network boundaries
   - identity/security model
   - data stores
   - dependencies
4. Add specialists only when relevant:
   - aws-security-reviewer
   - network-engineer
   - database-engineer
   - sre-reliability
   - observability-engineer
   - cicd-engineer
5. Review:
   - availability/failure domains
   - DR/RTO/RPO
   - scalability/capacity
   - security
   - observability
   - deployment/rollback
   - operational ownership
   - quotas
   - cost implications
6. Identify assumptions and open decisions.
7. Use validation-reviewer for high-impact proposals.
8. Checkpoint project-historian.

Return:
- Current/proposed architecture
- Key strengths
- Risks/gaps
- Tradeoffs
- Recommended design
- Migration/implementation considerations
- Validation/rollback needs
