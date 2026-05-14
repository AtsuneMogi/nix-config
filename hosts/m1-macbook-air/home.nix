{ pkgs, ... }:
let
  cmdEikanaPkg = import ../../modules/cmd-eikana.nix { inherit pkgs; };
in {
  imports = [
    ../../modules/dotfiles.nix
  ];

  home.username = "atsune";
  home.homeDirectory = "/Users/atsune"; # for macOS

  home.packages = with pkgs; [
    # --- dev tools ---
    platformio
    (texlive.combine {
    inherit (texlive)
      scheme-medium
      collection-langjapanese
      collection-fontsrecommended
      latexmk
      physics; # latex packages
    })

    # --- CLI tools ---
    fastfetch
    gemini-cli
    htop
    openssh
    ranger
    wireshark-cli
    cmdEikanaPkg
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
