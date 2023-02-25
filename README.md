# Arch-Configs
## Overview
This is where I store the various dot files that I use on my Linux system.

### ZSH
Personally, I like using ZSH as my default Shell. Included is my `.zshrc` file, which contains all of the various aliases and functions that I use.
To use my `.zshrc` file, simply copy it to your home directory and rename it to `.zshrc`.

To use my .zshrc file, you will also need to install zplug. To install zplug, simply run the following command:
```bash
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
```

Once you have installed zplug and copied my `.zshrc` file to your home directory, you will just need to close and reopen your terminal.

### Neovim
I use Neovim as my default text editor. Included is my `init.vim` file, which contains all of the various plugins and settings that I use.
To use my `init.vim` file, simply copy it to your home directory and rename it to `.config/nvim/init.vim`.

In addition to using my `init.vim` file, you will also need to install vim plug, which is a plugin manager for Neovim. To install vim plug, simply run the following command:
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
