# Maskfile

## dev

> Opens the editor, in a continuous loop.

```bash
while true; do clear; mask edit; sleep 1; done
```

## edit

> Opens the editor.

```bash
nvim -u ./init.vim -p lua/vimrc/{,init.lua} init.vim  {README,maskfile}.md
```

## setup

> Initialize submodules and setup the NeoVim configuration.

```bash
git submodule update --init --recursive
nvim --headless +'packload packer.nvim' +PackerCompile +PackerUpdate +qall
```

## add-plugin (repo) (as)

```bash
git submodule add "${repo}" "./pack/packer/start/${as}"
```
