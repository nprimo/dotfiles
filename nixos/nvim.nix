{pkgs, ...}:

{
  home.packages = with pkgs; [
    tree-sitter
    nodejs_22

    # Clang build tools
    getopt
    flex
    bison
    gcc
    gnumake
    bc
    pkg-config
    binutils

    elfutils
    ncurses
    openssl
    zlib

    # Extra bin
    ripgrep
    unzip
    wl-clipboard

    # Lang
    rustup
    go
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
