{ config, pkgs, specialArgs, ... }:

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

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/${specialArgs.username}/.config/home-manager";
  };

  home.packages = with pkgs; [
    nerd-fonts.zed-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nil
    nixd
    vesktop
    appeditor
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
