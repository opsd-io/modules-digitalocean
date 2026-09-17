#!/usr/bin/env bash
set -euo pipefail

api_root="${DIGITALOCEAN_API_URL:-https://api.digitalocean.com}/v2"
deadline=$(( $(date +%s) + TIMEOUT_SECONDS ))

resource_endpoint() {
  local urn="$1"
  local kind="${urn#*:}"
  local id="${urn##*:}"

  case "$kind" in
    kubernetes) echo "$api_root/kubernetes/clusters/$id" ;;
    dbaas|database) echo "$api_root/databases/$id" ;;
    droplet) echo "$api_root/droplets/$id" ;;
    loadbalancer|load_balancer) echo "$api_root/load_balancers/$id" ;;
    *) echo "Unsupported DigitalOcean resource URN: $urn" >&2; return 2 ;;
  esac
}

check_resource() {
  local endpoint
  endpoint="$(resource_endpoint "$1")"
  curl --fail-with-body --silent --show-error --output /dev/null \
    --header "Authorization: Bearer ${DIGITALOCEAN_TOKEN}" \
    --header "Accept: application/json" \
    "$endpoint"
}

while IFS= read -r urn; do
  [ -n "$urn" ] || continue

  until check_resource "$urn"; do
    if [ "$(date +%s)" -ge "$deadline" ]; then
      echo "Timed out waiting for DigitalOcean resource: $urn" >&2
      exit 1
    fi

    echo "Waiting for DigitalOcean resource to become visible: $urn"
    sleep "$POLL_INTERVAL"
  done
done <<< "${RESOURCE_URNS}"
