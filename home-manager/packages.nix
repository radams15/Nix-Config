{
  pkgs, ...
}:
let
  perlLibs = pkgs.perl.withPackages (p: [
    p.PerlCritic
    p.PLS
  ]);

  pythonLibs = pkgs.python3.withPackages (p: [
    p.flake8
    p.pyls-flake8
  ]);
in {
  home.packages = with pkgs; [
    vlc
    calls
    remmina
    chromium
    authenticator
    libreoffice
    discord
    jellyfin-media-player
    signal-desktop
    gnome.gnome-tweaks
    gnome.eog
    evolution
    gimp
    glib
    tor-browser-bundle-bin
    rhythmbox
    distrobox

    direnv

    gnomeExtensions.night-theme-switcher

    jetbrains.clion
    jetbrains.idea-ultimate

    podman-compose
    cmake
    gdb
    gcc
    go

    perlLibs
    pythonLibs

    mktemplate
    # ida-free
  ];
}
