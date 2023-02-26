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
...only lets you run python scripts, not shell scripts. Instead of using `webui.sh`, run `launch.py` directly instead.
