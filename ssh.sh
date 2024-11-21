## When you have too many keys on the client side, you tend to get an error saying "too many authentication failures"
## Run ssh -v to verify the issue
## https://superuser.com/questions/187779/too-many-authentication-failures-for-username
ssh -o PubkeyAuthentication=no username@<ip-address>

## ssh through proxy
ssh -J <proxy-user>@<proxy-host> user@host

## ssh through proxy (config version)
## ~/.ssh/config
```
Host <any>
Hostname <destination-ip>
User <username>
# ForwardX11 yes
# ForwardX11Trusted yes
ProxyJump <proxy-user>@<proxy-host>
```
