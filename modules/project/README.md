# project

Creates a DigitalOcean project used to group infrastructure resources.

Typical usage:
- isolate environments (dev/stage/prod)
- separate client workloads
- attach resource URNs for governance and billing context

Use `project_id` output for cross-module linking. Avoid linking by project name.
