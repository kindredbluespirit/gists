## Wine

## lutris keeps deleting wineprefix (initially ~/unshared/wineprefix, ~/.wine)
## Always add wine game manually
## https://www.reddit.com/r/wine_gaming/comments/ejoh2x/manually_installing_games_with_lutris/
## Install wine through system, not lutris
pacman -S wine-staging

## https://github.com/doitsujin/dxvk/issues/3191#issuecomment-1396486397
pacman -S lib32-vulkan-radeon lib32-vulkan-intel
