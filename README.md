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
│   ├── google-vm-instance-0/
│   │   └── home.nix
│   ├── m1-macbook-air/
│   │   ├── darwin-configuration.nix
│   │   └── home.nix
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
        ├── nvim/
        │   └── init.vim
        └── starship.toml
```

## Install

### 1. Clone this repository

```console
mkdir -p ~/.config
cd ~/.config
git clone https://github.com/AtsuneMogi/nix-config
cd nix-config
```

### 2. Apply configuration by host

#### macOS (nix-darwin + home-manager)

Use one of the following host names:

- `m1-macbook-air`
- `m5-macbook-air`

```console
sudo nix run nix-darwin -- switch --flake .#m1-macbook-air
# or
sudo nix run nix-darwin -- switch --flake .#m5-macbook-air
```

#### Debian/Linux (home-manager only)

Use this host name:

- `google-vm-instance-0`

```console
nix run home-manager -- switch --flake .#google-vm-instance-0
```

### 3. Update flake inputs (optional)

```console
nix flake update
```
