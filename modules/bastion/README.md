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

## Access and tunnels

The bastion is an SSH jump host. It does not store a kubeconfig or Kubernetes
credentials. Keep those credentials on the operator workstation and forward
only the private service endpoint that you need.

### Direct access

```sh
ssh -i ~/.ssh/platform_ed25519 bastion@BASTION_IP
```

The `BASTION_IP` value is the Reserved IP returned by the module's
`ip_address` output. The configured operator user is available from the
`user` output.

### Kubernetes API tunnel

Replace `CLUSTER_API_HOST` with the hostname from the cluster endpoint output:

```sh
ssh -N -L 6443:CLUSTER_API_HOST:443 bastion@BASTION_IP
```

The local kubeconfig should use `https://127.0.0.1:6443` as its server and set
`tls-server-name` to `CLUSTER_API_HOST` so certificate verification still uses
the cluster's original hostname. Keep the tunnel process running while using
`kubectl`.

### Database tunnel

Forward a private database endpoint through the bastion. PostgreSQL and MySQL
use different local ports here only to make simultaneous tunnels convenient:

```sh
# PostgreSQL
ssh -N -L 15432:PRIVATE_POSTGRES_HOST:5432 bastion@BASTION_IP
psql "postgresql://DB_USER@127.0.0.1:15432/DB_NAME"

# MySQL
ssh -N -L 13306:PRIVATE_MYSQL_HOST:3306 bastion@BASTION_IP
mysql --host=127.0.0.1 --port=13306 --user=DB_USER DB_NAME
```

The private hostnames must be resolvable from the bastion's VPC. Database
credentials are not provisioned by this module.

### Reusable `~/.ssh/config` entry

```sshconfig
Host opsd-bastion
    HostName BASTION_IP
    User bastion
    IdentityFile ~/.ssh/platform_ed25519
    IdentitiesOnly yes
    ExitOnForwardFailure yes
    ServerAliveInterval 60
```

With that entry, invoke the same tunnels using the alias:

```sh
ssh -N -L 6443:CLUSTER_API_HOST:443 opsd-bastion
ssh -N -L 15432:PRIVATE_POSTGRES_HOST:5432 opsd-bastion
```

Multiple `LocalForward` entries can be placed in the host block when the
operator routinely uses the same set of services. Use `ssh -N -f opsd-bastion`
only when backgrounding is intentional; `ExitOnForwardFailure` makes a
mistyped target fail immediately.

The SSH firewall must allow the operator's source CIDR, and the DOKS
control-plane firewall must allow the bastion Reserved IP for the Kubernetes
API tunnel to work.
