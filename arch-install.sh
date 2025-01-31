## Archlinux Installation
## https://wiki.archlinux.org/title/Installation_guide

#### ISO side (root) #########################################################

## Disable the pc speaker
## https://wiki.archlinux.org/title/PC_speaker#Disabling_the_PC_speaker
rmmod pcspkr

## Connect to the internet
iwctl
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
  git chezmoi neovim zsh iwd refind\ # minimal live boot independent system

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

## /etc/locale.gen
en_US.UTF-8

## Generate locale
locale-gen

## generate the initial ramdisk (initramfs)
mkinitcpio -P

## refind
refind-install

## https://wiki.archlinux.org/title/REFInd#Installation_with_refind-install_script
## https://www.reddit.com/r/archlinux/comments/16thgfi/comment/k2eyb4u/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
rm /boot/refind_linux.conf

## root password
passwd

## for makepkg/yay
pacman -S debugedit fakeroot

## dotfiles
git clone https://github.com/kindredbluespirit/dotfiles.git ~/.dotfiles
chezmoi --source ~/.dotfiles apply

## regular user
useradd -m -G wheel -s /bin/zsh user
passwd user

## change user
su -l user

#### Computer side (user) #########################################################

## dotfiles
git clone https://github.com/kindredbluespirit/dotfiles.git ~/.dotfiles
chezmoi --source ~/.dotfiles apply

## setup
setup-arch-packages
setup-zsh-deps
setup-home

## https://wiki.archlinux.org/title/XDG_user_directories
LC_ALL=C.UTF-8 xdg-user-dirs-update --force
