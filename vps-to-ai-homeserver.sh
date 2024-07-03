## wireguard, ollama, open-webui, ufw, podman
## https://blog.fuzzymistborn.com/vps-reverse-proxy-tunnel/

#### vps #############################################################

## setup wireguard
## webguard homeserver

## setup caddy

## allow https (443)
ufw allow 443

#### homeserver #####################################################

## setup wireguard

## setup ollama

## setup open-webui with podman
docker run -d --gpus all --network=host -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:cuda
# -p 3000:8080 
