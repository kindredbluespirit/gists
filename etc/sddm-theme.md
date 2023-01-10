/etc/sddm.conf.d/theme.conf
```
[Theme]
Current=archlinux-soft-gray
CursorTheme=oreo_white_cursors
```

The available themes are located at `/usr/share/sddm/themes/`.

You can dry-test a theme by running `sddm-greeter --test-mode --theme /usr/share/sddm/themes/<theme-name>`.
