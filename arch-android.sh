## Android development environment on archlinux

## adb
pacman -S android-tools 

#### android sdk ###########################

## sdkmanager cmdline
# yay -S android-sdk-cmdline-tools-latest

## sdk
# yay -S android-platform

## better install them in the user home instead since changes are being made to the directory by flutter (userspace, not root)

## place the extracted sdkmanager folder under ~/.android-sdk/cmdline-tools/latest, not ~/.android-sdk/cmdline-tools
## https://developer.android.com/studio#command-line-tools-only
## https://stackoverflow.com/questions/65262340/cmdline-tools-could-not-determine-sdk-root

## system/sdkmanager compatible
archlinux-java set java-22-openjdk

## https://wiki.archlinux.org/title/Android#SDK_packages
## https://developer.android.com/tools/sdkmanager
sdkmanager "build-tools;35.0.0"
sdkmanager "platform-tools"
sdkmanager "platforms;android-35"

## flutter compatible
archlinux-java set java-11-openjdk

#### Flutter ###############################

## Install flutter, dart extensions on vscode/codium

flutter create <project-directory>
flutter run

flutter doctor
flutter devices

## https://stackoverflow.com/a/76383993
