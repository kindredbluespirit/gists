## T480s
Installing `python-validity` suffices

Top of /etc/pam.d/sddm
```
# auth 			[success=1 new_authtok_reqd=1 default=ignore]  	pam_unix.so try_first_pass likeauth nullok
auth 			sufficient  	pam_fprintd.so
```
