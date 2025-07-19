docker_build("auth-service", ".", live_update=[])

k8s_yaml(["k8s/postgres.yaml", "k8s/auth-deployment.yaml", "k8s/auth-service.yaml"])
k8s_resource("auth-service", port_forwards=8000)
