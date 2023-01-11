1. Add `resume` to `HOOKS` in `/etc/mkinitcpio.conf`.
2. Add `resume=/dev/nvme0n1p2` to the first option in `/boot/refind_linux.conf`.

/etc/mkinitcpio.conf
```
HOOKS=(... resume fsck)
```

/boot/refind_linux.conf
```
"Boot with standard options"  "root=... resume=<swap-partition>"
```
