{ pkgs, ... }:
{
  # System packages for the host (NixOS-style configuration)
  environment.systemPackages = with pkgs; [
    vim
  ];

  # Minimal metadata
  system.stateVersion = "22.11";
}
