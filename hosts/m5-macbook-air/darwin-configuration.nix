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
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      # CRITICAL: Changing this to "zap" or "uninstall" natively forces
      # nix-darwin to supply the safety flags (--force) Homebrew demands.
      #cleanup = "zap";
      cleanup = "none";
    };

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
      "microsoft-office"
      "microsoft-teams"
      "obsidian"
      "openscad@snapshot"
      "orcaslicer"
      "raspberry-pi-imager"
      "slack"
      "visual-studio-code"
      "zoom"
    ];
  };

  # system settings for macOS
  system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
  system.stateVersion = 5;
  security.pam.services.sudo_local.touchIdAuth = true;
}
