# project

Creates a DigitalOcean project used to group infrastructure resources.

Resource assignment is intentionally handled by the separate
`project-resources` module. The DigitalOcean project resource must not manage
resource URNs directly because newly created resources can remain associated
with the default project while the API is eventually consistent.

Typical usage:
- isolate environments (dev/stage/prod)
- separate client workloads
- attach resource URNs for governance and billing context through
  `project-resources`

Use `project_id` output for cross-module linking. Avoid linking by project name.
