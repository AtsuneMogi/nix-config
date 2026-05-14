{ pkgs, ... }:
{
  imports = [
    ../../modules/dotfiles.nix
  ];

  home.username = "debian";
  home.homeDirectory = "/home/maomudunyin";
  home.username = "maomudunyin";

  home.packages = with pkgs; [
    fastfetch
    htop
    vim
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
