#!/bin/bash

# Run migrations
python manage.py migrate

# Start server
exec "$@"