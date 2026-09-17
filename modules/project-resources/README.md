# DigitalOcean Project Resources

Assigns existing DigitalOcean resources to a project after confirming that
they are visible through the DigitalOcean API.

The module uses the built-in `terraform_data` resource for visibility polling
and then manages the assignment with `digitalocean_project_resources`.
