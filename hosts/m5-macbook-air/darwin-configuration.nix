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
    ollama
    python311
    ruby
    rustc
    tmux
    uv
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
      "anythingllm"
      "bambu-studio"
      "brave-browser"
      "cmux"
      "copilot-cli"
      "discord"
      "docker"
      "firefox"
      "gimp"
      "google-chrome"
      "google-drive"
      "google-japanese-ime"
      "lm-studio"
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
