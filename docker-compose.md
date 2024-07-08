# docker compose collection

## default

Dockerfile
```
FROM pytorch/pytorch:2.3.0-cuda12.1-cudnn8-runtime
# WORKDIR /code
COPY requirements.txt requirements.txt
RUN apt update && apt install -y gcc
RUN pip install Cython
RUN pip install -r requirements.txt
```

docker-compose.yml
```yaml
services:
  myapp:
    build: .
    network_mode: "host"
    volumes:
      - .:/app:delegated
    working_dir: /app
    command: sleep inf
    # tty: true
```
Run with `docker compose up -d` for detached mode (no output, no console blocking).

Run `docker compose down` to revert everything.
