# Contributing

Follow the [central OPSd contribution guide](https://github.com/opsd-io/.github/blob/main/CONTRIBUTING.md)
for organization-wide rules. The module-specific checks below apply in this
repository.

## Pull Requests And Commits

Use the following format for the pull request title and every commit:

~~~text
type(scope): short imperative description
~~~

Allowed scopes are modules, ci, docs, and release, for example
fix(modules): correct managed database defaults. Breaking changes may use the
! marker.

The Conventional Commits check is required. Release Please uses these
messages to create consistent release notes and determine the next version.

## Local Validation

Run the module checks for the affected module, including both Terraform and
OpenTofu where available:

~~~bash
terraform fmt -check -recursive
tofu fmt -check -recursive
terraform validate
tofu validate
~~~

The shared CI additionally runs initialization without a backend, TFLint, and
Checkov. Do not commit state files, provider credentials, or generated
.terraform directories.

When changing a module interface or rendered behavior, update the public
integration scenario coverage as well. Public checks stop at plan; real
DigitalOcean apply tests run from the private workflow.
