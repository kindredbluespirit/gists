## can be used instead of the GUI applet
## in archiso, use iwd instead

## https://chatgpt.com/share/6859937a-13c4-800c-9378-8db29a475bd8

## connected or not
nmcli device status

## list networks
nmcli device wifi list

## connect to network
nmcli device connect <SSID> --ask ifname <wlan0>
