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
      cat = "bat";
    };

    initExtra = ''
      BREW_CMD="/home/linuxbrew/.linuxbrew/bin/brew"

      if [ -x "$BREW_CMD" ]; then
        eval "$($BREW_CMD shellenv zsh)"
      else
        echo "Brew not found at $BREW_CMD"
      fi

      unset BREW_CMD
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
        "eza"
        "brew"
      ];
    };

    completionInit = "eval $(bat --completion zsh);";
  };

  programs.go.enable = true;

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

  programs.cava.enable = true;

  programs.bat = {
    enable = true;
  };

  programs.btop = {
    enable = true;
  };

  programs.bun = {
    enable = true;
    enableGitIntegration = true;
  };

  home.packages = with pkgs; [
    nil
    nixd
    appeditor
    rustup
    nodejs_23
    ripgrep
  ];

  programs.home-manager.enable = true;
}
