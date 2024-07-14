## Android development environment on archlinux

## adb
pacman -S android-tools 

#### android sdk ###########################

## sdkmanager cmdline
# yay -S android-sdk-cmdline-tools-latest

## sdk
# yay -S android-platform

## better install them in the user home instead since changes are being made to the directory by flutter (userspace, not root)
## https://wiki.archlinux.org/title/Android#SDK_packages
## https://developer.android.com/tools/sdkmanager

#### Flutter ###############################

## Install flutter, dart extensions on vscode/codium

flutter create <project-directory>
flutter run

flutter doctor
flutter devices

## https://stackoverflow.com/a/76383993
