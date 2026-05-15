{ pkgs, ... }:
{
  imports = [
    ../../modules/dotfiles.nix
  ];

  home.homeDirectory = "/home/maomudunyin";
  home.username = "maomudunyin";

  home.packages = with pkgs; [
    fastfetch
    htop
    starship
    vim
    zsh
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
