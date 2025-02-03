https://huggingface.co/docs/hub/ollama

https://github.com/ollama/ollama/blob/main/docs/import.md

https://tariksghiouri.github.io/tutorials/gguf_conversion.html

https://medium.com/@qdrddr/the-easiest-way-to-convert-a-model-to-gguf-and-quantize-91016e97c987

-----------------

Four steps
1. Download safetensors from hf
2. safetensors to gguf
3. gguf to ollama
4. (optional) quantize

------------------

### Workspace
```
mkdir ~/unshared/huggingface
```

### Download the model
```
pacman -S python-huggingface-hub
huggingface-cli  download deepseek-ai/DeepSeek-R1-Distill-Qwen-1.5B --local-dir deepseek-r1
cd deepseek-r1
```

-------------

### Convert to gguf
```
podman run --rm -v .:/model ghcr.io/ggerganov/llama.cpp:full --convert /model --outtype f16 ## or f32
```

### gguf to ollama
~/unshared/huggingface/deepseek-r1
```
FROM ./Deepseek-R1-1.8B-F16.gguf
```
```
ollama create model1
```

----------------------

### Directly convert safetensors to ollama
`llama.cpp` is not needed here.

~/unshared/huggingface/deepseek-r1
```
FROM .
```
```
ollama create model2
```
--------------------

### Directly convert safetensors to quantized ollama
`llama.cpp` is not needed here.

~/unshared/huggingface/deepseek-r1
```
FROM .
```
```
ollama create --quantize q4_K_M model3
```
