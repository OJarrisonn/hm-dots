{
  inputs,
  config,
  pkgs,
  nixgl,
  ...
}: let
  wrapGL = config.lib.nixGL.wrap;
in {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ojarrisonn_";
  home.homeDirectory = "/home/ojarrisonn_";

  # Nixpkgs unfree
  nixpkgs.config.allowUnfreePredicate = _: true;

  # nixGL configuration
  nixGL.packages = nixgl.packages;
  nixGL.defaultWrapper = "mesa";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  imports = [
    ./modules/app
    ./modules/cli
    ./modules/misc
    ./modules/catppuccin.nix
  ];

  home.packages = [
    pkgs.rustup
    pkgs.nodejs_23
    pkgs.bun
    pkgs.jdk17
    pkgs.kotlin
    pkgs.python313
    pkgs.python313Packages.pip
    pkgs.go
    pkgs.leiningen
    pkgs.deno
    pkgs.zig
    pkgs.lua51Packages.lua
    pkgs.lua51Packages.luarocks
    pkgs.devbox
    pkgs.mise
    pkgs.nh
    # Editors
    pkgs.vscode
    pkgs.neovim
    (wrapGL pkgs.obsidian) # nixGL
    (wrapGL pkgs.zathura)
    (wrapGL pkgs.ghostty) # nixGL
    pkgs.lnav
    # CLI Utils
    pkgs.ripgrep-all
    pkgs.sd
    pkgs.direnv
    pkgs.pandoc
    pkgs.texliveMedium
    pkgs.fzf
    pkgs.fd
    pkgs.glow
    pkgs.jq
    pkgs.file
    pkgs.ueberzugpp
    pkgs.chafa
    pkgs.ouch
    pkgs.carapace
    pkgs.dive
    pkgs.grpcurl
    pkgs.pueue
    pkgs.glances
    pkgs.usql
    pkgs.zoxide
    # Nix
    pkgs.nix-prefetch-github
    pkgs.nix-prefetch-git
    pkgs.nix-init
    # Foolery
    pkgs.neofetch
    pkgs.asciinema
    pkgs.onefetch
    pkgs.yt-dlp
    pkgs.ffmpeg_6
    pkgs.vivid
    pkgs.tealdeer
    pkgs.kanata
    # LSP
    pkgs.nixd
    pkgs.alejandra
    pkgs.taplo
    pkgs.clang-tools
    pkgs.lua51Packages.lua-lsp
    # python313Packages
    pkgs.python313Packages.pip
    # Fonts
    pkgs.nerd-fonts.fira-code
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
    ".config/starship.toml".source = ./files/starship.toml;
  };

  # Use this after switch (hmsw): bash-env ~/.nix-profile/etc/profile.d/hm-session-vars.sh | load-env
  home.sessionVariables = {
    EDITOR = "${pkgs.neovim}/bin/nvim";
    VISUAL = "${pkgs.neovim}/bin/nvim";
    NIX_PATH = "nixpkgs=${inputs.nixpkgs}";
    FLAKE = "/home/ojarrisonn_/.config/home-manager";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
