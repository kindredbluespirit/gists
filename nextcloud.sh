## nextcloud-aio docker container
## https://wiki.archlinux.org/title/Nextcloud
## https://hub.docker.com/_/nextcloud
## https://github.com/nextcloud/all-in-one#nextcloud-all-in-one

## For Linux and without a web server or reverse proxy (like Apache, Nginx, Cloudflare Tunnel and else) already in place:
## https://github.com/nextcloud/all-in-one/blob/main/docker-rootless.md
docker run \
--init \
--sig-proxy=false \
--name nextcloud-aio-mastercontainer \
--restart always \
--publish 8081:8080 \
--volume nextcloud_aio_mastercontainer:/mnt/docker-aio-config \
--volume $XDG_RUNTIME_DIR/docker.sock:/var/run/docker.sock:ro \
--env WATCHTOWER_DOCKER_SOCKET_PATH=$XDG_RUNTIME_DIR/docker.sock \
docker.io/nextcloud/all-in-one:latest

# --volume /var/run/docker.sock:/var/run/docker.sock:ro \

## prefix docker.io/ to image name while using podman

