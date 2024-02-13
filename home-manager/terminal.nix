{
  pkgs, ...
}: {
  programs.gnome-terminal = {
    enable = true;

    profile = {
      "217431ee-1e69-40d1-a14f-ed1c83afe3e5" = {
        default = true;
        visibleName = "Nix Config";
        font = "JetBrainsMono Nerd Font 14";
      };
    };
  };
}
