# Squid

- Install Squid: `sudo apt update && sudo apt install squid`
- Configure Squid:

```bash
# Edit /etc/squid/squid.conf
acl localnet src <Subnet> # Replace with your local network subnet.
http_access allow localnet
```

- Restart Squid: `sudo systemctl restart squid`
- Use on clients:

```bash
# Set the proxy in your browser or system settings to <Squid-IP>:3128
export http_proxy="http://<proxy-ip>:3128"
export https_proxy="http://<proxy-ip>:3128"
```

- Or configure /etc/environment for persistence.

```bash
# Add the following lines to /etc/environment
http_proxy="http://<proxy-ip>:3128"
https_proxy="http://<proxy-ip>:3128"
```
