# Traefik (Kubernetes)

- After moving to K8s, Traefik is now used as the ingress controller for the cluster. It is configured to handle incoming traffic and route it to the appropriate services within the cluster. The configuration is managed through Kubernetes resources such as Ingress and Custom Resource Definitions (CRDs).

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: app1-ingress
  annotations:
    traefik.ingress.kubernetes.io/router.entrypoints: web
spec:
  rules:
    - host: app1.homelab.local
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: app1-service
                port:
                  number: 3000
```

- Make sure DNS or /etc/hosts points `app1.homelab.local` to your cluster IP.
