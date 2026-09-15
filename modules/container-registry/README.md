# container-registry

Creates a DigitalOcean Container Registry.

Typical usage:
- store container images for App Platform and Kubernetes
- establish a shared image source for deployment pipelines

## Project attachment

- this module does not currently expose a project attachment path
- the underlying registry resource is not wired in this repository through `project_id` or a standard `urn` output
