https://docs.openwebui.com/#open-webui-bundled-with-ollama
```
## with gpu
podman run -d -p 3000:8080 --gpus=all -v ollama:/root/.ollama -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:ollama

## without gpu
podman run -d -p 3000:8080 -v ollama:/root/.ollama -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:ollama
```

-------------

### Podman Quadlets

Enable running the container as a systemd service.

https://docs.podman.io/en/latest/markdown/podman-systemd.unit.5.html

https://chatgpt.com/share/679eff05-1c54-800c-9dbe-53993200c409

~/.config/containers/systemd/open-webui.container
```
[Container]
Image=ghcr.io/open-webui/open-webui:ollama
ContainerName=open-webui
PublishPort=3000:8080
Volume=ollama:/root/.ollama
Volume=open-webui:/app/backend/data

# [Service]
# Restart=always
```

Generate a systemd service file from above
```
## dryrun
/usr/lib/systemd/system-generators/podman-system-generator --user --dryrun

## actual
/usr/lib/systemd/system-generators/podman-system-generator --user ~/.config/systemd/user
```
Start and enable the service.
```
systemctl --user enable --now open-webui.service
```
