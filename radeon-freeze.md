The radeon kernel module was the reason behind the desktop freezing.

Figured this when trying to switch back to xinit, disabled sddm, xinit was giving radeon logs

Archwiki has info on this
1. remove radeon kernel module, xf86-amdgpu package
https://wiki.archlinux.org/title/AMDGPU#Disable_loading_radeon_completely_at_boot
2. remove xf86-Intel package
https://wiki.archlinux.org/title/Intel_graphics#Installation

Completely prevent the radeon kernel module from loading
1. Blacklist radeon on modprobe.conf
2. Add modprobe.conf to mkinitcpio.conf files
3. Run mkinitcpio -P
4. Reboot
