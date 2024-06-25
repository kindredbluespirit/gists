## Archlinux Installation
## https://wiki.archlinux.org/title/Installation_guide

#### ISO side (root) #########################################################

## Disable the pc speaker
## https://wiki.archlinux.org/title/PC_speaker#Disabling_the_PC_speaker
rmmod pcspkr

## Connect to the internet
iwd
station wlan0 get-networks
station wlan0 connect <network-name>

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
## https://wiki.archlinux.org/title/EFI_system_partition#Typical_mount_points
mount /dev/sda3 /mnt
mount /dev/sda1 /mnt/efi
swapon /dev/sda2

## Bootstrap the system
pacstrap -K /mnt base linux linux-firmware \
  git chezmoi neovim zsh iwd

## Generate filesystem table file
genfstab -U /mnt >> /mnt/etc/fstab

## Uncomment en US UTF-8 in /mnt/etc/locale.gen
## otherwise you may face issues in the computer's ~/.config/locale.conf (default C values)

## /etc/locale.conf
LANG=en_US.UTF-8

## /etc/hostname
archlinux

## Chroot into the new system
arch-chroot /mnt

#### Computer side (root) #########################################################

## Set the timezone
ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime

## Generate /etc/adjtime
hwclock --systohc

## Enable time synchronization
systemctl enable --now systemd-timesyncd

## Generate locale
locale-gen

## generate the initial ramdisk (initramfs)
mkinitcpio -P

## root password
passwd
