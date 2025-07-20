FROM python:3.9-slim

ENV PYTHONUNBUFFERED=1 \
    DJANGO_SETTINGS_MODULE=auth_service.settings

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy scripts first and set permissions
COPY ./scripts/ /app/scripts/
RUN chmod -R +x /app/scripts/

# Then copy the rest
COPY . .

ENTRYPOINT ["/app/scripts/entrypoint.sh"]