#!/usr/bin/env sh

## doesn't work as intended, pipe seems to spawn a child shell which becomes the head
# curl <url> | . /dev/stdin

## but this one does
# . <(curl <url>)

pacman -Syu --noconfirm zsh starship grml-zsh-config git chezmoi cockpit gitea caddy zellij

## zellij for scrollability and viewing the output
# exec zellij

## dotfiles
git clone https://codeberg.org/onetruffle/dotfiles.git ~/.dotfiles
chezmoi --no-pager --source ~/.dotfiles apply

## openvpn
curl -O https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh
chmod +x openvpn-install.sh
AUTO_INSTALL=y ./openvpn-install.sh

## code-server
# curl -fsSL https://code-server.dev/install.sh | sh

## caddy
DOMAIN=caddy.org
echo "\
openvpn.$DOMAIN {
  reverse_proxy localhost:1194
}
gitea.$DOMAIN {
  reverse_proxy localhost:3000
}
code.$DOMAIN {
  reverse_proxy localhost:8080
}
cockpit.$DOMAIN {
  reverse_proxy localhost:9090
}" 1>/etc/caddy/Caddyfile

systemctl enable --now gitea cockpit.socket caddy

## zsh
chsh -s /bin/zsh
exec zsh -il
