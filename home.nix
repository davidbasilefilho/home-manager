{ config, pkgs, specialArgs, ... }:

{
  home.username = "${specialArgs.username}";
  home.homeDirectory = "/home/${specialArgs.username}";
  home.stateVersion = "25.05";

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
    };

    syntaxHighlighting = {
      enable = true;
    };
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
  ];

  programs.home-manager.enable = true;
}
