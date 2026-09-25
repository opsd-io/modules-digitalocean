# bastion

Creates an optional bastion droplet in an existing VPC with a stable Reserved
IP and a dedicated cloud firewall.

The module installs configured additional public keys for a non-root operator
user. DigitalOcean SSH key references and inline `authorized_keys` are kept as
separate inputs so callers can distinguish account-managed keys from keys
provided directly in the environment manifest.

Account-managed keys are resolved from DigitalOcean and installed for the
operator user as well as being passed to the Droplet at creation time.

Cloud-init installs and enables `openssh-server`, creates the non-root
operator account, stores its keys under `/etc/ssh/authorized_keys/<user>`, and
configures SSH to reject root and password authentication while allowing local
TCP forwarding for the Kubernetes API tunnel.
