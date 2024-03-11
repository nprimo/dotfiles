# dotfiles

A repo to save all my config files

## Setup

Run:

```console
$ stow .
```

> Some of the aliases defined in `.bash_aliases` relies on scripts defined
> [here](https://github.com/nprimo/scripts)

### Nix-env

Install package manager:

```console
$ sh <(curl -L https://nixos.org/nix/install) --daemon
```

To have the application available in the menu starter, create a symlink as
follows:

```console
$ ln -s ~/.nix-profiles/share/applications ~/.local/share/applications
```
