{ pkgs, specialArgs, ... }:

{
  home.username = "${specialArgs.username}";
  home.homeDirectory = "/home/${specialArgs.username}";
  home.stateVersion = "25.05";

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;

    autosuggestion = {
      enable = true;
    };

    syntaxHighlighting = {
      enable = true;
    };

    shellAliases = {
      lazyg = "lazygit";
      lg = "lazygit";
      b = "bun";
      bx = "bunx";
      ls = "eza -lah";
    };

    initExtra = ''
      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
        "bun"
        "dnf"
        "npm"
        "pip"
        "podman"
        "rust"
      ];
    };
  };

  programs.mise = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  programs.starship.enable = true;

  programs.lazygit.enable = true;

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    colors = "always";
    git = true;
    icons = "auto";
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/${specialArgs.username}/.config/home-manager";
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_macchiato";
      editor = {
        cursorline = true;
        true-color = true;
        lsp = {
          display-messages = true;
          display-progress-messages = true;
          display-inlay-hints = true;
        };
      };
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    nil
    nixd
    vesktop
    appeditor
    rustup
    go
    nodejs_23
    bun
    ripgrep
  ];

  xdg.desktopEntries = {
    vesktop = {
      name = "Vesktop";
      genericName = "Discord client";
      terminal = false;
      categories = [ "Network" "Utility" ];
      mimeType = [ "x-scheme-handler/discord" ];
      exec = "${pkgs.vesktop}/bin/vesktop %U";
      icon = "${pkgs.vesktop}/share/icons/hicolor/256x256/apps/vesktop.png";
    };
  };

  programs.home-manager.enable = true;
}
