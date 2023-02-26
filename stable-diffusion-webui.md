### Animation using stable diffusion (deforum)

Place the following text in a new code cell in one of the colab notebooks listed at https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Online-Services.
```
#@markdown # Install the deforum extension
!git clone https://github.com/deforum-art/deforum-for-automatic1111-webui /content/gdrive/MyDrive/sd/stable-diffusion-webui/extensions/deforum
```
### CPU only mode
```py
# @markdown # Start webui

import torch
if torch.cuda.is_available():
  ## gpu/cuda
  !python launch.py --share
else:
  ## cpu
  !python launch.py --share --skip-torch-cuda-test --use-cpu all --precision full --no-half
```

### Huggingface
...only lets you run python scripts, not shell scripts. Instead of using `webui.sh`, run `launch.py` directly instead. Also, `--share` isn't allowed.

### Huggingface + deforum
run.sh
```
#!usr/bin/env bash

[ -d extensions/deforum ] || git clone https://github.com/deforum-art/deforum-for-automatic1111-webui extensions/deforum

. webui.sh
```
run.py
```
# import os

# if not os.path.exists("extensions/deforum"):
#     exec(open("deforum.sh").read())

exec(open("run.sh").read())

```
Run `run.py` instead of `run.sh` since shell scripts cannot be called directly.

-----------------------

Nevermind, apparently none of the shell scripts can be run, directly or indirectly. Only option is to convert everything to python.
