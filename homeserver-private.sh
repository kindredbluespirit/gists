## server
## https://chatgpt.com/share/67a01e1c-a0b4-800c-a986-ab1e29ba88bf

## /etc/ssh/sshd_config
```
X11Forwarding yes
```

## restart the ssh service
systemctl restart ssh

###############################
## client
## ~/.ssh/config.d/homeserver-private
```
Host <any>
Hostname <destination-ip>
User <username>
ForwardX11 yes
ForwardX11Trusted yes
```

## connect 
ssh -X homeserver-private
