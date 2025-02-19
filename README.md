# DeusIntra's dotfiles

## Setup

Clone this repository (preferably in your **$HOME** directory) and run **setup-symlinks.sh**:

```bash
git clone https://github.com/DeusIntra/dotfiles.git
```
```bash
cd dotfiles
```
```bash
./setup-symlinks.sh
```

At the top **setup-symlinks.sh** has an array of files and directories you want to symlink to corresponding files/directories in your **$HOME**.
It also creates a backup of the original file if it exists.
If the original file is actually a link, it will be deleted.

## Neovim health dependencies:
- xclip
- nvm
- python
- python-pip
- luarocks
- rgrep

