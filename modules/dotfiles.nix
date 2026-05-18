{ pkgs, ... }: {
  home.file = {
    ".editorconfig".source = ../dotfiles/.editorconfig;
    ".latexmkrc".source = ../dotfiles/.latexmkrc;
    ".zshrc".source = ../dotfiles/.zshrc;
    ".vimrc".source = ../dotfiles/.vimrc;
    ".tmux.conf".source = ../dotfiles/.tmux.conf;
    ".config/nvim" = {
      source = ../dotfiles/.config/nvim;
      recursive = true;
    };
    ".config/cmux" = {
      source = ../dotfiles/.config/cmux;
      recursive = true;
    };
    ".config/starship.toml".source = ../dotfiles/.config/starship.toml;
    # VSCode settings and extensions
    "~/Library/Application Support/Code/User/settings.json".source = ../dotfiles/.vscode/settings.json;
    ".vscode/extensions/extensions.json".source = ../dotfiles/.vscode/extensions.json;
    # vim-plug for Vim
    ".vim/autoload/plug.vim" = {
      source = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim";
        sha256 = "sha256-LuxOfosU4RpHmTz5euO9rGi186fel8CBQXzOPxZDK7E=";
      };
    };
    # vim-plug for Neovim
    ".local/share/nvim/site/autoload/plug.vim" = {
      source = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim";
        sha256 = "sha256-LuxOfosU4RpHmTz5euO9rGi186fel8CBQXzOPxZDK7E=";
      };
    };
  };
}
