# Homelab

- Run scripts on 1.BaseConfigs:
  - [base-packages](./1.BaseConfigs/base-packages.sh) - Base packages for Ubuntu/Debian
  - [oh-my-posh](./1.BaseConfigs/oh-my-posh.sh) - Oh My Posh for PowerShell
  - [sudo-user](./1.BaseConfigs/sudo-user.sh) - Create a sudo user
- Make scripts executable:

```bash
chmod +x 1.BaseConfigs/*.sh
```

# Next steps

## Terraform + Proxmox API

- [Terraform](https://www.terraform.io/) - Infrastructure as Code (IaC) tool

## Forward Proxy (Client)

- Squid - Forward Proxy with authentication and caching (HTTP/HTTPS)
- Apt-cacher-ng - Apt caching proxy (Ubuntu/Debian packages)
- Docker-registry-proxy - Docker registry caching proxy (Docker images)

## Reverse Proxy (Server)

- Nginx - Reverse proxy for web applications (HTTP/HTTPS)
- Traefik - Reverse proxy for Docker containers (HTTP/HTTPS)
