# DigitalOcean Project Resources

Assigns existing DigitalOcean resources to a project after confirming that
they are visible and can be assigned through the DigitalOcean API.

The module uses the built-in `terraform_data` resource to poll both conditions
and perform the assignment with retries. This avoids a second provider call
and handles DigitalOcean's eventual consistency between resource creation and
project resource assignment.
