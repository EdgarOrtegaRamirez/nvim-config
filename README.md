# Welcome to Neovim dotfiles 🦖

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg?cacheSeconds=2592000)
![Prerequisite](https://img.shields.io/badge/nvim-%3E%3D0.8-blue.svg)
![Prerequisite](https://img.shields.io/badge/fzf-%3E%3D0.33.0-green.svg)
[![Documentation](https://img.shields.io/badge/documentation-yes-brightgreen.svg)](https://github.com/EdgarOrtegaRamirez/nvim-config/#README.md)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/kefranabg/readme-md-generator/graphs/commit-activity)
[![License: MIT](https://img.shields.io/badge/license-MIT-yellow.svg)](https://github.com/EdgarOrtegaRamirez/nvim-config/#LICENSE)

## Preinstall 

### Install NeoVim 

Install [NeoVim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

### Vim-Plug
Install [vim-plug](https://github.com/junegunn/vim-plug) for NVIM version

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
### Python3

Here's a [python installation guide](https://realpython.com/installing-python/)

### Iterm (For Mac Users only)

[iTerm2](https://iterm2.com/) is a replacement for Terminal and the successor to iTerm. nvim theme catpuccin won't work for mac terminal app.

## Install 

Go to `~/.config` folder and clone this repository

```
git clone git@github.com:charly-palencia/nvim-config.git ~/.config/nvim
```

Then, open NeoVim using `nvim` and run the command `:PlugInstall`. It will install all the plugins into `./init.vim` file.

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

## Install LSP (Language Service Protocol)

Facilitates features like go-to-definition, find-references, hover, completion, rename, format, refactor, etc., using semantic whole-project analysis. 

Neovim dotfile uses [Mason.nvim](https://github.com/williamboman/mason.nvim) to easly manage LSP Servers. Here's [the complete LSP list](https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers). To install LSP run `:Mason`.

![mason](https://user-images.githubusercontent.com/6705160/177617680-d62caf26-f253-4ace-ab57-4b590595adca.png)


## Copy & Pase Support

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup

So let's fix that

First we'll fix copy/paste

- On mac `pbcopy` should be builtin

- On Ubuntu

  ```
  sudo apt install xsel
  ```

- On Arch Linux

  ```
  sudo pacman -S xsel
  ```

Next we need to install python support (node is optional)

- Neovim python support

  ```
  pip install pynvim
  ```

- Neovim node support

  ```
  npm i -g neovim
  ```

## Fonts

- [A nerd font](https://github.com/ryanoasis/nerd-fonts)

- [codicon](https://github.com/microsoft/vscode-codicons/raw/main/dist/codicon.ttf)
- [An emoji font](https://github.com/googlefonts/noto-emoji/blob/main/fonts/NotoColorEmoji.ttf)
- For custom [Recursive fonts](https://www.recursive.design/) with [Nerdfont icons](https://www.nerdfonts.com/), go to the `assets/fonts` folder and download the
  `recursive-nerdfont.zip`.

After moving fonts to `~/.local/share/fonts/`

Run: `$ fc-cache -f -v`

## Documentation

### [Installed Plugins](docs/installed_plugins.md) 📦
### [Key Mapping](docs/mappings.md) ⌨️
 
## Author

👤 **Edgar Ortega**

* GitHub: [@EdgarOrtegaRamirez](https://github.com/EdgarOrtegaRamirez)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check [issues page](https://github.com/EdgarOrtegaRamirez/nvim-config/issues). You can also take a look at the [contributing guide](https://github.com/EdgarOrtegaRamirez/nvim-config/blob/master/CONTRIBUTING.md).

## Show your support

Give a ⭐️ if this project helped you!



 
