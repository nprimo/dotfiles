{ config, pkgs, ... }:

{
  home.username = "nprimo";
  home.homeDirectory = "/home/nprimo";
  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    # Dev lang
    beamMinimal27Packages.elixir_1_18
    nodejs_24
    cargo
    rustc
    go
    deno

    # tooling
    neovim
    zoxide
    tmux
    fzf
    jujutsu
    tree
    gemini-cli

    # extras
    hurl
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
