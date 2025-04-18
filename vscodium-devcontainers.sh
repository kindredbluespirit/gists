## vscode-remote-ssh
ssh-copy-id -i .ssh/id_ed25519 user@<hostname>

## don't recall where this came from
# https://update.code.visualstudio.com/commit:c3f126316369cd610563c75b1b1725e0679adfb3/server-linux-x64/stable

## obtained from vscode -> menu -> help -> about
## vscodium's version
```
Release: 24171
Commit: 7d98c6de73fb939f1eb4b8a500c569b858b2d297
```

## devcontainers tried this url, didn't work
## probably because it's a codium commit and not a vscode one, so it's not available on the official website
## https://update.code.visualstudio.com/commit:7d98c6de73fb939f1eb4b8a500c569b858b2d297/server-linux-x64/stable

## https://stackoverflow.com/questions/56073276/how-can-i-install-vs-code-server-manually-and-tell-vs-code-remote
## https://stackoverflow.com/questions/56718453/using-remote-ssh-in-vscode-on-a-target-machine-that-only-allows-inbound-ssh-co/56781109#56781109
## https://api.github.com/repos/microsoft/vscode/releases

## this could be the answer
## https://github.com/VSCodium/vscodium/issues/205
## https://github.com/gitpod-io/openvscode-server

## about the vsode terminal font
## https://stackoverflow.com/questions/70856163/why-does-my-terminal-in-vs-code-have-weird-spacing-and-how-can-i-fix-it

## also check this
## https://github.com/VSCodium/vscodium/issues/1229
## https://github.com/VSCodium/vscodium/discussions/1471

#### foss alternatives #########################################

## vscode
## vscodium

## remote ssh extension
## https://github.com/xaberus/vscode-remote-oss # for reh support
## https://github.com/jeanp413/open-remote-ssh

#################################################################

## third party server versions that run on a browser
## coder/code-server
## linuxserver
## gitpod

## looks like devcontainers (the foss part) wasn't written very well
## https://github.com/xaberus/vscode-remote-oss/issues/2#issuecomment-1785798665

## focusing on ssh'ing into docker containers instead
## https://linuxhandbook.com/ssh-into-container/
