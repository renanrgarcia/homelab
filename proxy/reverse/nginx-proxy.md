# NGINX Config (/etc/nginx/sites-available/homelab.conf)

```conf
server {
    listen 80;
    server_name homelab.local;

    location /app1/ {
        proxy_pass http://vm1.lan:3000/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /app2/ {
        proxy_pass http://vm2.lan:8080/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

## Symbolic Link

```bash
# Create a symbolic link to enable the configuration. A symbolic link means that the file is not copied, but rather a reference to the original file is created. This allows for easier management of configuration files.
sudo ln -s /etc/nginx/sites-available/homelab.conf /etc/nginx/sites-enabled/
# sudo nginx -t # Test the configuration for syntax errors
# sudo systemctl reload nginx # Reload Nginx to apply the changes
sudo nginx -t && sudo systemctl reload nginx
```

## Host configuration

```bash
# Add the following line to the /etc/hosts file on your local machine to resolve the homelab.local domain to the Nginx server's IP address.
# This allows you to access the applications using the homelab.local domain in your web browser.
192.168.56.1 homelab.local # Replace with the actual IP address of your Nginx server. Obt
```
