# Docker registry caching proxy

- Run a container with the following command:

```bash
docker run -d \
  --name registry-proxy \
  -p 3129:3128 \
  -e REGISTRIES="docker.io gcr.io quay.io k8s.gcr.io registry.k8s.io" \
  --restart always \
  rpardini/docker-registry-proxy
```

- Edit or create /etc/docker/daemon.json to use in the Docker client:

```json
{
  "registry-mirrors": ["http://<proxy-ip>:3129"]
}
```

- Restart Docker: `sudo systemctl restart docker`
