# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    ./vim.nix
    ./dconf.nix
    ./bash.nix
    ./templates.nix
    ./packages.nix
    ./defaults.nix
    ./fonts.nix
    ./firefox.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
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
    userName = "Rhys Adams";
    userEmail = "rhys@therhys.co.uk";
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "25.11";
}
