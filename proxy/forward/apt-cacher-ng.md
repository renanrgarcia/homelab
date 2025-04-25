# Apt cacher ng

- Install on your host or a dedicated VM: `sudo apt update && sudo apt install apt-cacher-ng`

- Configure clients (VMs, containers, etc.)

  - Edit /etc/apt/apt.conf.d/01proxy on each client: `Acquire::http::Proxy "http://<proxy-ip>:3142";`
  - Replace <proxy-ip> with the IP of the machine running apt-cacher-ng.

- Try running `sudo apt update` on a client. The proxy should start caching packages.
