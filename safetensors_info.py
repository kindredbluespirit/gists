## ~/unshared/huggingface

from safetensors.torch import load_file

## Load safetensors file
# file_path = "cambrian-8b/model-00001-of-00007.safetensors"
file_path = "deepseek-r1-1.5b/model.safetensors"


state_dict = load_file(file_path)

# Print available keys (usually includes architecture-related names)
[print(key) for key in state_dict.keys()]

print("---------")

from safetensors import safe_open

with safe_open(file_path, framework="pt") as f:
    metadata = f.metadata()
    print(metadata)
