# dotfiles

A repo to save all my config files

## Location

Below the location for each config file:

- `~/.gitconfig`
- `~/.config/nvim/`
- `~/.tmux.conf`
- `~/.zshrc`
- `~/.bash_aliases`
- `~/.iex.exs`

> Some of the aliases defined in `.bash_aliases` relies on scripts defined
> [here](https://github.com/nprimo/scripts)

## Todo

1. Write simple setup script or use a tool such as
   [`chezmoi`](https://www.chezmoi.io/). The script should:
   - ensure used tools used are installed;
   - create the symlinks to have all the dotfiles in the correct order (backup
     the old dotfiles somewhere easy to recover).
