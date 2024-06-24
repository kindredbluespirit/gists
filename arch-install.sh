## Archlinux Installation

## ISO side (root)

## Disable the pc speaker
## https://wiki.archlinux.org/title/PC_speaker#Disabling_the_PC_speaker
rmmod pcspkr

## Connect to the internet
```
iwd
station wlan0 get-networks
station wlan0 connect <network-name>
```

## Get the disk/device summary
lsblk
fdisk -l

## Edit the filesystem table
cfdisk /dev/sda

## Format the partitions in the filesystem table
mkfs.fat -F 32 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 /dev/sda3

## Mount
mount /dev/sda3 /mnt
mount /dev/sda1 /efi
swapon /dev/sda2

## Bootstrap the system
pacstrap -K /mnt base linux linux-firmware

## Generate filesystem table file
genfstab -U /mnt >> /mnt/etc/fstab

## Chroot into the new system
arch-chroot /mnt
