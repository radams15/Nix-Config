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
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
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

  home.packages = with pkgs; [
    firefox
    discord
    freetube
    jellyfin-media-player
    signal-desktop
    gnome.gnome-tweaks
    evolution
    davmail
    starship
    gimp
    glib
    tor-browser-bundle-bin
    rhythmbox
    distrobox

    gnomeExtensions.gsconnect
    gnomeExtensions.night-theme-switcher

    jetbrains.clion
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional

    cmake
    gdb
    gcc

    mktemplate
  ];

  programs.git = {
    enable = true;
    userName = "Rhys Adams";
    userEmail = "rhys@therhys.co.uk";
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
