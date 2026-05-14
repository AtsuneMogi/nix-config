{ pkgs, ... }: {
  imports = [
    ../../modules/dotfiles.nix
  ];

  home.username = "debian";
  home.homeDirectory = "/home/debian";

  home.packages = with pkgs; [
    fastfetch
    htop
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
