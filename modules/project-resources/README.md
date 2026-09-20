# DigitalOcean Project Resources

Assigns existing DigitalOcean resources to a project after confirming that
they are visible and can be assigned through the DigitalOcean API.

The module uses the built-in `terraform_data` resource to poll both conditions
before `digitalocean_project_resources` manages the assignment. This handles
DigitalOcean's eventual consistency between resource creation and project
resource assignment.
