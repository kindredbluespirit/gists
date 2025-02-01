/etc/sddm.conf.d/theme.conf
```
[Theme]
Current=archlinux-soft-grey
CursorTheme=oreo_white_cursors
```

The available themes are located at `/usr/share/sddm/themes/`.

You can dry-test a theme by running `sddm-greeter --test-mode --theme /usr/share/sddm/themes/<theme-name>`.

-------------

If you get a blank screen, try settting the theme to `breeze` instead.

### Wallpaper/background
https://wiki.archlinux.org/title/SDDM#Customizing_a_theme

/usr/share/sddm/themes/breeze/theme.conf.user
```
[General]
background=/usr/share/wallpapers/default.jpeg
```

### Cursor theme not respected
https://github.com/sddm/sddm/issues/1894#issuecomment-2041431779

https://wiki.archlinux.org/title/SDDM#SDDM_loads_only_US_keyboard_layout (Xsetup)

/usr/share/sddm/scripts/Xsetup
```
echo 'Xcursor.theme: oreo_white_cursors' | xrdb -nocpp -merge
```
