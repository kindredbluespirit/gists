# June 2025 Manual Intervention

## Linux Firmware
https://archlinux.org/news/linux-firmware-2025061312fe085f-5-upgrade-requires-manual-intervention/
```
doas pacman -Rdd linux-firmware
doas pacman -Sy linux-firmware
```


## KDE on x11
https://archlinux.org/news/plasma-640-will-need-manual-intervention-if-you-are-on-x11/
```
## installs kwin-x11 and plasma-x11-session
## used to be kwin and plasma-workspace
doas pacman -S plasma-x11-session

## plasma-desktop needed to be reinstalled for some reason
doas pacman -S plasma-desktop

## test if plasmashell exists if you get a black screen on login
plasmashell

## for plasma settings
systemsettings
```
