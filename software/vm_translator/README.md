# Hack machine VM Translator

## Description
This is a vm translator written in
rust to facilitate the translation of the
supported vm command to its associated
Hack's assembly instruction. 

I have ensured the translator documents
each processed command to make debugging easier.

## Version 2: Stage 2 translator


## Usage
```bash
git clone --depth=1 --no-checkout https://github.com/xpanvictor/hack/ && cd hack && git sparse-checkout set software/vm_translator && git checkout
cd software/vm_translator
cargo run <VM_FILE_PATH.vm>
```
___Where___ \
`VM_FILE_PATH.vm`: a path leading to file to translate

___NOTE___  
The output file is stored in `VM_FILE_PATH.asm`.


