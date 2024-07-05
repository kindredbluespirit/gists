## https://github.com/nextcloud/all-in-one/tree/main/manual-install

## /etc/containers/registries/01-qualifier.conf
unqualified-search-registries = ["docker.io"]

## compose.yaml
cp sample.yml compose.yaml
```
## disable ipv6
networks:
  nextcloud-aio:
    name: nextcloud-aio
    driver: bridge
    enable_ipv6: false
    ipam:
      driver: default
#       config:
#        - subnet: ${IPV6_NETWORK}

## some more changes to compose.yaml are needed
```

## .env
cp sample.conf .env
```
NC_DOMAIN=<nextcloud-domain>
TIMEZONE=<timezone>
## changes to .env
```

## nextcloud network
docker network create --driver bridge nextcloud-aio

docker compose up

## to purge all, rm containers, images, network, pod
