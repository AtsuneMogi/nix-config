# Atsune's Nix config

## Nix config layout

`nix-config/` is managed with this structure:

```text
nix-config/
├── flake.nix
├── flake.lock
├── .gitignore
├── README.md
├── hosts/
│   └── m5-macbook-air/
│       ├── darwin-configuration.nix
│       └── home.nix
├── modules/
│   ├── cmd-eikana.nix
│   └── dotfiles.nix
└── dotfiles/
    ├── .editorconfig
    ├── .latexmkrc
    ├── .tmux.conf
    ├── .vimrc
    ├── .zshrc
    └── .config/
        ├── cmux/
        │   └── settings.json
        └── nvim/
            └── init.vim
```

## Install

First, navigate to (or create) the `~/.config` directory:

```console
# Create ~/.config if it doesn't exist and navigate to it
mkdir -p ~/.config
cd ~/.config
```

Then clone this repository and apply the configuration with a nix command:

```console
# clone this repository
git clone https://github.com/AtsuneMogi/nix-config
cd nix-config
# apply nix-darwin configuration
sudo nix run nix-darwin -- switch --flake .#atsune
```
