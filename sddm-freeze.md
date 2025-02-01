### Symptoms
1. `sddm.service` or `lightdm.service` freeze with a blinking cli cursor.
2. `lspci` blocks output for some time followed by some radeon lines before giving the actual output.

`lspci` gives the AMD GPU even though xf86-video-amdgpu is removed.

`lsmod` shows all the currently loaded modules, which shows `radeon` as well, which is the problem.
I tested it out. Removing the module using `modprobe -r radeon` solved the sddm issue.

`modprobe -r radeon` is temporary and lasts only for the current boot session.

---------

https://chatgpt.com/share/679d9ced-970c-800c-91a8-9404df7345dd

`modinfo radeon | rg filename` shows the location of the driver file.

`pacman -Qo <filename>` says `linux` and not some amd/radeon package.

So you can't remove some radeon package to solve it. Need to blacklist it.

Refer to [radeon-freeze.md](radeon-freeze.md).
