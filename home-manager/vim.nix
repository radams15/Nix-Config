{
  pkgs, config, ...
}: {
  home.file."${config.home.homeDirectory}/.vim" = {
    source = ./vim;
    recursive = true;
  };
}
