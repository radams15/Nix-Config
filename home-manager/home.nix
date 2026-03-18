{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./vim.nix
    ./dconf.nix
    ./bash.nix
    ./templates.nix
    ./packages.nix
    ./defaults.nix
    ./firefox.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      # outputs.overlays.modifications
      # outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "rhys";
    homeDirectory = "/home/rhys";
  };

  programs.git = {
    enable = true;
    ignores = [ "*.swp" ];
    settings.user = {
      name = "Rhys Adams";
      email = "rhys@therhys.co.uk";
    };
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "25.11";
}
