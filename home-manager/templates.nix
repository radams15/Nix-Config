{
  pkgs, config, ...
}: {
  home.file."Templates" = {
    source = ./Templates;
    recursive = true;
  };
}
