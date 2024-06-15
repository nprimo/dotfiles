{ config, lib, pkgs, ... }:

let
  cfg = config.programs.zoxide;
  cfgOptions = lib.concatStringsSep " " cfg.options;
in {

  imports = [ ./nvim.nix ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nprimo";
  home.homeDirectory = "/home/nprimo";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    zoxide
    trash-cli

    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.file = {
    ".config/nvim".source = ../.config/nvim;
  };

  programs.zsh.initExtra = lib.mkIf cfg.enableZshIntegration ''
    eval "$(${cfg.package}/bin/zoxide init zsh ${cfgOptions})"
  '';


  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/nprimo/etc/profile.d/hm-session-vars.sh
  #
  programs.zsh.enable = true;
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
