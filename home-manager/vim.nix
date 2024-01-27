{
  pkgs, config, ...
}: {
  home.file."${config.xdg.configHome}/vim" = {
    source = ./vim;
    recursive = true;
  };
}
