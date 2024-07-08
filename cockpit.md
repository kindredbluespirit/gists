# Cockpit

Cockpit has a bad quirk in that `/etc/cockpit/cockpit.conf` doesn't exist by default. You need to create it yourself and populate it. 

Without the following config, cockpit refuses to connect. We secure the connection using a wireguard tunnel.
```
## /etc/cockpit/cockpit.conf
## https://github.com/cockpit-project/cockpit/issues/8636
## https://wiki.archlinux.org/title/Cockpit#TLS_certificate
## https://cockpit-project.org/guide/latest/cockpit.conf.5.html

[WebService]
Origins=https://<domain-name>
AllowUnencrypted=true
```
