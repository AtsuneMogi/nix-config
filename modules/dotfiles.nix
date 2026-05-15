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
