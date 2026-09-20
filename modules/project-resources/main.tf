resource "terraform_data" "wait_for_resources" {
  triggers_replace = var.resource_urns

  provisioner "local-exec" {
    command = "${path.module}/scripts/wait-for-resources.sh"

    environment = {
      DIGITALOCEAN_TOKEN = var.digitalocean_token
      PROJECT_ID         = var.project_id
      RESOURCE_URNS      = join("\n", var.resource_urns)
      TIMEOUT_SECONDS    = tostring(var.timeout_seconds)
      POLL_INTERVAL      = tostring(var.poll_interval_seconds)
    }
  }
}

resource "digitalocean_project_resources" "this" {
  project   = var.project_id
  resources = var.resource_urns

  depends_on = [terraform_data.wait_for_resources]
}
