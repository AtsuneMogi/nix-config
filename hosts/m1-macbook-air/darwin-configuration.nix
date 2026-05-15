{ pkgs, ... }: {
  system.primaryUser = "atsune";
  nix.enable = false;

  # settings for nixpkgs
  nixpkgs.config.allowUnfree = true; # allow third party software
  # system packages obtained from nixpkgs
  environment.systemPackages = with pkgs; [
    cargo
    curl
    git
    luajit
    neovim
    nodejs_22
    python311
    ruby
    rustc
    tmux
    vim
    wget
  ];

  # settings for homebrew
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    taps = [
      "VOICEVOX/voicevox"
    ];
    casks = [
      "adobe-acrobat-reader"
      "antigravity"
      "bambu-studio"
      "cmux"
      "copilot-cli"
      "discord"
      "firefox"
      "gimp"
      "google-chrome"
      "google-drive"
      "google-gemini"
      "font-jetbrains-mono-nerd-font"
      "microsoft-office"
      "microsoft-teams"
      "obs"
      "obsidian"
      "openscad@snapshot"
      "orcaslicer"
      "slack"
      "visual-studio-code"
      "voicevox"
      "zoom"
    ];
  };

  # system settings for macOS
  system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
  system.stateVersion = 5;
  security.pam.services.sudo_local.touchIdAuth = true;
}
