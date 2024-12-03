## NetworkManager

## ip address and interface information
ip a

## get default gateway
ip route
## default via <address>

## show connections
nmcli connection show

## add static ip
nmcli connection "<name>" ipv4.addresses <address>/<subnet-mask> ipv4.gateway <address> ipv4.method manual

## add static ip and a dhcp-assigned ip
nmcli connection "<name>" ipv4.addresses <address>/<subnet-mask> ipv4.gateway <address> ipv4.method auto

## remove static ip
## /etc/NetworkManager/system-connections
## delete the ipv4 address line
