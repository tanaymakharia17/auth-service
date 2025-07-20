.PHONY: up down build logs clean migrate

# Start all services
up:
	docker-compose up -d

# Stop all services
down:
	docker-compose down

# Build containers
build:
	docker-compose build

# Show logs
logs:
	docker-compose logs -f

# Clean everything
clean: down
	docker system prune -a -f
	docker volume prune -f

# Run migrations
migrate:
	docker-compose exec web python manage.py migrate

# Create superuser
superuser:
	docker-compose exec web python manage.py createsuperuser

# Run tests
test:
	docker-compose exec web python manage.py test

# Install new requirements
requirements:
	docker-compose exec web pip install -r requirements.txt