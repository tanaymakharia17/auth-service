.PHONY: start stop restart

start:
	@echo "🔄 Starting Minikube..."
	minikube start --driver=docker

	@echo "📂 Setting Docker env to Minikube..."
	@eval $$(minikube docker-env)

	@echo "📦 Applying Kubernetes manifests..."
	kubectl apply -f k8s/

	@echo "🧹 Killing process using port 10350 if any..."
	-@lsof -ti :10350 | xargs -r kill -9

	@echo "⚙️  Starting Tilt..."
	@eval $$(minikube docker-env) && tilt up

stop:
	@echo "🛑 Stopping all services..."
	@tilt down || true
	@kubectl delete -f k8s/ 2>/dev/null || true
	@minikube stop || true

restart: stop start
