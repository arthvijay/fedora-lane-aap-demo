# Fedora Lane – AAP demo content

Playbooks used in the Automation TDP demo (Junior SA track). Contains **no credentials**: AWS keys, tokens and passwords live only in Ansible Automation Platform credentials.

| Playbook | Demo | Challenge |
|---|---|---|
| `playbooks/staging_db_volume.yml` | Self-service, survey-driven, idempotent EBS volume for a staging DB | 1: brittle scripts |
| `playbooks/staging_db_volume_cleanup.yml` | Housekeeping after rehearsals | – |
| `playbooks/onboard_gitlab_project.yml` | Workflow step 1: GitLab project (demo mode by default) | 3: handoffs |
| `playbooks/grant_dev_db_access.yml` | Workflow step 3, after approval: DB access (demo mode by default) | 3: handoffs |
| `playbooks/onboarding_summary.yml` / `onboarding_denied.yml` | Workflow success / denial paths | 3: handoffs |
| `legacy/provision_staging_env.sh` | Fictional "before" Bash script, a prop only | 1 |

Challenge 2 (credentials, RBAC, audit) is configured in AAP itself. See `presentation/DEMO_SETUP.md`.

**Demo mode:** the RHDP lab has no GitLab or PostgreSQL dev database, so those steps log exactly what they would do. Set `gitlab_url` / `db_host` (plus a credential) to run them for real.
