{
  pkgs, config, ...
}: {
      programs.vim = {
        enable = true;
        defaultEditor = true; # Set EDITOR variable
        plugins = with pkgs.vimPlugins; [
          awesome-vim-colorschemes
          nerdtree
          vim-devicons
          vim-airline
          vim-lsc
        ];
        extraConfig = ''
          source ~/.config/vim/vimrc
        '';
      };

  home.file."${config.xdg.configHome}/vim" = {
    source = ./vim;
    recursive = true;
  };
}
