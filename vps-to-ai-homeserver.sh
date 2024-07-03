## wireguard, ollama, open-webui, ufw, podman
## https://blog.fuzzymistborn.com/vps-reverse-proxy-tunnel/

#### vps #############################################################

## setup wireguard
## /etc/wireguard/conf.d/wg0.conf
```
[Interface]
Address = 10.10.10.1/24
ListenPort = 51820
PrivateKey = PRIVATE_VPS_KEY

[Peer]
PublicKey = PUBLIC_DMZ_KEY
AllowedIPs = 10.10.10.10/32
```

## setup caddy
## /etc/caddy/Caddyfile
## redirects https/443 traffic to open-webui listening on port 8080 
```
https://<domain-name>
reverse-proxy <homeserver-wg0-ip>:8080 
```

## allow https (443)
ufw allow 443

#### homeserver/DMZ #####################################################

## setup wireguard
## /etc/wireguard/conf.d/wg0.conf
```
[Interface]
Address = 10.10.10.10/32
PrivateKey = PRIVATE_DMZ_KEY
# DNS = 9.9.9.9, 149.112.112.112

[Peer]
PublicKey = PUBLIC_VPS_KEY
Endpoint = VPS_IP_ADDRESS:51820
AllowedIPs = 10.10.10.1/32
PersistentKeepalive = 25
```

## setup ollama
ollama run llama3

## setup open-webui with podman
docker run -d --gpus all --network=host -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:cuda
# -p 3000:8080 