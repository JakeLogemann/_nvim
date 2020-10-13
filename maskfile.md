# Maskfile

## dev

> Opens the editor, in a continuous loop.

```bash
while true; do clear; mask edit; sleep 1; done
```

## edit

> Opens the editor.

```bash
nvim -u ./init.vim -p lua/vimrc/{packages,globals,mappings}.lua {README,maskfile}.md ./init.vim 
```

## setup

> Initialize submodules and setup the NeoVim configuration.

```bash
git submodule update --init --recursive
nvim --headless +'packload packer.nvim' +PackerCompile +PackerUpdate +qall
```